data "aws_caller_identity" "this" {}

data "aws_eks_cluster" "this" {
  name = var.cluster
}

locals {
  open_id_connect_provider = replace(data.aws_eks_cluster.this.identity[0].oidc[0].issuer, "https://", "")
}

data "aws_iam_policy_document" "this" {
  statement {
    actions = ["sts:AssumeRoleWithWebIdentity"]
    effect  = "Allow"

    condition {
      test     = "StringEquals"
      values   = ["system:serviceaccount:${var.namespace}:${var.name}"]
      variable = "${local.open_id_connect_provider}:sub"
    }

    principals {
      identifiers = [
        format(
          "arn:aws:iam::%s:oidc-provider/%s",
          data.aws_caller_identity.this.account_id,
          local.open_id_connect_provider
        )
      ]

      type = "Federated"
    }
  }

  version = "2012-10-17"
}

resource "aws_iam_role" "this" {
  assume_role_policy = data.aws_iam_policy_document.this.json
}

resource "aws_iam_policy" "this" {
  for_each = var.inline_policies

  name   = each.key
  policy = each.value
}

resource "aws_iam_role_policy_attachment" "this" {
  for_each = aws_iam_policy.this

  policy_arn = each.value.arn
  role       = aws_iam_role.this.name
}

resource "kubernetes_service_account" "this" {
  automount_service_account_token = true

  metadata {
    annotations = {
      "eks.amazonaws.com/role-arn" = aws_iam_role.this.arn
    }

    labels = {
      "app.kubernetes.io/name" = var.name
    }

    name      = var.name
    namespace = var.namespace
  }
}
