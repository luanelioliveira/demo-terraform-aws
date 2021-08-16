# Terraform Samples

## 01 Workspace

Esse é um exemplo que utiliza o recurso de `workspace` do terraform, o qual mostra é possível separar a infra por ambientes.

Para utilizar essa estrutura é necessário ter as credenciais da AWS configurada. Para isso, deve-se configurar no `~/.aws/credentials`, adicionando um novo profile como `awsterraform`

Após isso entrar na package `01-workspace`
```bash
cd 01-workspace
```

Em seguida, gerar chave ssh para que seja possível conectar via ssh na máquina que será criada
```bash
ssh-keygen -t rsa -f mykey
```

Inicializar o terraform
```bash
terraform init
```

Criar workspace `sandbox`
```bash
terraform workspace new sandbox
```

Executar plano de execução
```bash
terraform plan
```

Executar e aplicar a criação das estruturas
```bash
terraform apply
```

Para conectar na máquina via ssh, pegar o endereço publico e subtituir onde está `<public-address>`
```bash
ssh -i ./mykey ubuntu@<public-address>
```

Para excluir estrutura criada
```bash
terraform destroy -auto-approve
```