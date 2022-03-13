
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
- ```export ARM_SUBSCRIPTION_ID="8bd2899a-247c-44da-a5d0-999da4e36f83"```
- ```export ARM_TENANT_ID="aa34c2de-579a-40ba-951d-8f915087a206"```
- ```export ARM_CLIENT_ID="36f5f4ec-8758-4ea1-a746-de4d3d76fe70"```
- ```export ARM_CLIENT_SECRET="qqk1ottt7FAUWfKM59HAMvGCd.jiaJ9iBD"```
