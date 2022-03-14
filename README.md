
## Configurar el azcli con asdf
asdf plugin list all |grep -i azure
asdf plugin add azure-cli https://github.com/itspngu/asdf-azure-cli.git
asdf install python latest 
asdf local python latest
asdf install azure-cli latest
asdf local azure-cli latest

## Configurando terraform con asdf
asdf plugin add terraform https://github.com/Banno/asdf-hashicorp.git
asdf plugin add terraform-docs https://github.com/looztra/asdf-terraform-docs.git
asdf install terraform latest
asdf install terraform-docs latest
asdf local terraform latest
asdf local terraform-docs latest


## Obteniendo las credenciales

### Se inicia en una terminal con estos comandos
> Guia de referencia
https://docs.microsoft.com/en-us/azure/developer/terraform/get-started-cloud-shell-bash?tabs=bash

- ```az login --use-device-code```
- Una vez el comando ha surgido efecto solicitara acceder a una WEB con un ID
- https://microsoft.com/devicelogin
- Se puede validar la configuracion de la cuenta con el siguiente comando
- ```az account show```

### Configurar un ServicePrincipal para el acceso programatico
- ```az ad sp create-for-rbac --name terraform-principal --role Contributor```
- Generar la informacion necesaria para acceder desde terraform
```bash
export ARM_SUBSCRIPTION_ID="8VVVVV-999C-AAAA4-5555D-5555555555"
export ARM_TENANT_ID="aaaaaaaaaaa-ddddd-sssss-aaaa-888888888"
export ARM_CLIENT_ID="999999-99999-aaaa-bbbb-88888888"
export ARM_CLIENT_SECRET="111111111111222222222222222222333"
```


<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.1.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~>2.97.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 2.97.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_linux_virtual_machine.devops-virtualmachine](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine) | resource |
| [azurerm_network_interface.devops-networkinterface](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface) | resource |
| [azurerm_network_security_group.devops-security-group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group) | resource |
| [azurerm_public_ip.devops-publicip](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip) | resource |
| [azurerm_resource_group.devops-rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_subnet.devops-subnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_virtual_network.devops-vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_proyecto"></a> [proyecto](#input\_proyecto) | Nombre del proyecto a implementar | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Valores de los tags para los recursos | `map(string)` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->