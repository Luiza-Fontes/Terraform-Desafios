# Desafio 3
 

# Conteúdo:
* Azure Key Vault + Secrets

https://github.com/thiago88sp/terraform-treinamento/tree/master/5-secret-management-azure
 
* Modulos

https://github.com/thiago88sp/terraform-treinamento/tree/master/6-terraform-modules
 
 
# Laboratório:
* Gerenciamento de Key Vault

    **Criar um Key Vault

    **Criar uma secret dentro do Key Vault

    **Criar uma access policy para o usuário logado com permissão de "Secret Management"

    **Consumir a secret(data source) para criação de outro recurso do Azure (exemplo: Storage Account)

* Criação de módulo de rede

    **Criar um módulo para criação de uma Vnet com pelo menos 3 subnets default do Azure (App Gateway, Firewall e outra)

    **Criar um NSG para cada subnet

    **Utilizar variáveis locais para definir uma lista ou mapa com as subnets e criá-las em loop

    **Bônus: Utilizar a função "cidrsubnet" para definir os IPs das subnets