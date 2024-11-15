<!-- BEGIN_TF_DOCS -->

## Requirements

No requirements.

## Providers

| Name                                             | Version |
| ------------------------------------------------ | ------- |
| <a name="provider_aws"></a> [aws](#provider_aws) | n/a     |

## Modules

No modules.

## Resources

| Name                                                                                                                  | Type     |
| --------------------------------------------------------------------------------------------------------------------- | -------- |
| [aws_ecr_repository.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository) | resource |

## Inputs

| Name                                                   | Description | Type                                                                                              | Default                                                                    | Required |
| ------------------------------------------------------ | ----------- | ------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------- | :------: |
| <a name="input_ecr"></a> [ecr](#input_ecr)             | n/a         | <pre>object({<br/> prefix = string<br/> is_enable_immutable = optional(bool, false)<br/> })</pre> | <pre>{<br/> "is_enable_immutable": false,<br/> "prefix": "app"<br/>}</pre> |    no    |
| <a name="input_pj_tags"></a> [pj_tags](#input_pj_tags) | n/a         | <pre>object({<br/> name = string<br/> env = string<br/> })</pre>                                  | <pre>{<br/> "env": "test",<br/> "name": "hoge"<br/>}</pre>                 |    no    |

## Outputs

| Name                                                                                   | Description |
| -------------------------------------------------------------------------------------- | ----------- |
| <a name="output_ecr_arn"></a> [ecr_arn](#output_ecr_arn)                               | n/a         |
| <a name="output_ecr_registory_id"></a> [ecr_registory_id](#output_ecr_registory_id)    | n/a         |
| <a name="output_ecr_registory_url"></a> [ecr_registory_url](#output_ecr_registory_url) | n/a         |

<!-- END_TF_DOCS -->
