# Lab Hadoop

Laboratório básico para a ferramenta [Hadoop](http://hadoop.org/) provisionado no Google Cloud Platform - GCP

## Web Interfaces

O cluster Hadoop estiver instalado e funcionando, verifique a interface do usuário da web dos componentes conforme descrito abaixo:

Service|url|Port
---|---|---
ResourceManager  | http://<<ip_master>>:port/ | Default HTTP port is 8088.

## Terraform

O Terraform irá instanciar 3 máquinas e compartilhar a chave pública do host com as máquinas virtuais, **deverá ter o nome "id_rsa.pub"**. Para passar as credenciais para o terraform basta popular a variável de ambiente **GOOGLE_APPLICATION_CREDENTIALS**.

```shell
  export GOOGLE_APPLICATION_CREDENTIALS=<path_json>
```

## Inicializar o laboratório

Clonar o projeto

```shell
git clone  https://github.com/DiegoBulhoes/lab-hadoop
```

Exportar as variáveis de ambiente

```shell
export GCP_SERVICE_ACCOUNT_FILE=/path/keyfile.json  && \
export GOOGLE_APPLICATION_CREDENTIALS=/path/keyfile.json
```

Um dos passos necessários para utilizar esse _setup_ é possuir uma par de _keys_ SSH, podendo ser gerado através do seguinte comando, para mais detalhes consulte a documentação atrves desse [link](https://wiki.debian.org/SSH)

```shell
ssh-keygen
```

Após a geração da chave renomeie o arquivo [terraform/terraform.tfvars.sample](terraform/terraform.tfvars.sample) para terraform.tfvars (nesse arquivo irá conter todas as variáveis para criar as instâncias no GCP). Crie um [**service-accounts**](https://cloud.google.com/compute/docs/access/service-accounts) com uma chave do tipo **JSON** e exponha no ambiente através do variável _GCP_SERVICE_ACCOUNT_FILE_

```shell
export GCP_SERVICE_ACCOUNT_FILE=/path/keyfile.json
```

Para inicializar os modulos, execute o seguinte comando:

```shell
terraform init
```

Para verificar se os arquivos possui algum erro de sintaxe ou de configuração das instâncias execute o seguinte comando:

```shell
terraform plan
```

Após a verificação do _plan_ execulte o seguinte comando para realizar o processo de instanciação

```shell
terraform apply
```

Se tudo estiver ok a saída será similar a esta:

```text
Apply complete! Resources: 6 added, 0 changed, 0 destroyed.

Outputs:

manager_public = [
  "<<ip_public>>",
]
worker_internal = [
  "<<ip_internal1>>",
  "<<ip_internal1>>"
]
```

## Ansible

Para realizar a configuração do ambiente será necessário popular a variável de ambiente **GCP_SERVICE_ACCOUNT_FILE**

```shell
  export GCP_SERVICE_ACCOUNT_FILE=<path_json>
```

### Executar o Ansible

Para execultar o Ansible será necessário realizar o download do plugin **gce_compute**:

```shell
  pip3 install requests google-auth
```

Crie os arquivos `inventory.gcp.yml` e `playbook.yml`, utilize os exemplos.

Para inicializar o Ansible:

```shell
  ansible-playbook -i inventory.gcp.yml -u gce  playbook.yml

```
## Exemplo

Para executar uma aplicação Hadoop deverá ser criado um diretório no qual será gerado uma pasta de saída, a pasta de saída **não pode existir**.

```shell
hdfs namenode -format
```

Inicialize os serviços:

```shell
start-dfs.sh
start-yarn.sh
```

Para executar uma aplicação Hadoop deverá ser criado um diretorio no qual será gerado uma pasta de saída, a pasta de saída **não pode existir**.

```shell
mkdir input
cp $HADOOP_COMMON_HOME/etc/hadoop/*.xml input
```

Copiar o diretório input para o HDFS

```shell
hadoop dfs -copyFromLocal input /in
```

Execultar o WordCount

```shell
hadoop jar $HADOOP_COMMON_HOME/share/hadoop/mapreduce/hadoop-mapreduce-examples-3.2.2.jar wordcount /in output
```

Coletar a saída do HDFS

```shell
hdfs dfs -get output output
cat output/*
```
