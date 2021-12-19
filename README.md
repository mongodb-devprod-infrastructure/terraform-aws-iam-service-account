<div align="center">
  <a href="https://github.com/mongodb-devprod-infrastructure/terraform-aws-iam-service-account">
    <img src="https://user-images.githubusercontent.com/2184329/145092072-d669fd86-de77-427e-aa78-7bc14e0bf531.png" width="200">
  </a>
  <h1>
    <code>terraform-aws-iam-service-account</code>
  </h1>
  <p>Associate an IAM role with a Kubernetes service account</p>
</div>

<!-- BEGIN_TF_DOCS -->

## Requirements

| Name                                                                        | Version   |
| --------------------------------------------------------------------------- | --------- |
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform)    | >= 1.0    |
| <a name="requirement_aws"></a> [aws](#requirement_aws)                      | >= 3.64.2 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement_kubernetes) | >= 2.6.1  |

## Providers

| Name                                                                  | Version |
| --------------------------------------------------------------------- | ------- |
| <a name="provider_aws"></a> [aws](#provider_aws)                      | 3.70.0  |
| <a name="provider_kubernetes"></a> [kubernetes](#provider_kubernetes) | 2.7.1   |

## Modules

No modules.

## Resources

| Name                                                                                                                                          | Type        |
| --------------------------------------------------------------------------------------------------------------------------------------------- | ----------- |
| [aws_iam_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy)                                 | resource    |
| [aws_iam_role.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role)                                     | resource    |
| [aws_iam_role_policy_attachment.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource    |
| [kubernetes_service_account.this](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/service_account)         | resource    |
| [aws_caller_identity.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity)                    | data source |
| [aws_eks_cluster.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/eks_cluster)                            | data source |
| [aws_iam_policy_document.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document)            | data source |

## Inputs

| Name                                                                           | Description                                       | Type          | Default     | Required |
| ------------------------------------------------------------------------------ | ------------------------------------------------- | ------------- | ----------- | :------: |
| <a name="input_cluster"></a> [cluster](#input_cluster)                         | The cluster to apply the patch to                 | `string`      | n/a         |   yes    |
| <a name="input_inline_policies"></a> [inline_policies](#input_inline_policies) | A list of named policies to inline into this role | `map(string)` | `{}`        |    no    |
| <a name="input_name"></a> [name](#input_name)                                  | The name of the service account                   | `string`      | n/a         |   yes    |
| <a name="input_namespace"></a> [namespace](#input_namespace)                   | The namespace of the service account              | `string`      | `"default"` |    no    |

## Outputs

| Name                                                                                            | Description                     |
| ----------------------------------------------------------------------------------------------- | ------------------------------- |
| <a name="output_service_account_name"></a> [service_account_name](#output_service_account_name) | The name of the service account |

<!-- END_TF_DOCS -->

## Contributing

Please refer to the [CONTRIBUTING](docs/CONTRIBUTING.md) document for more information.

## License

[Apache License 2.0](LICENSE)
