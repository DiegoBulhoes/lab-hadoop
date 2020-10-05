# Lab Hadoop

Laboratório básico para a ferramenta [Hadoop](http://hadoop.org/) provisionado no Google Cloud Platform - GCP

## Terraform

O Terraform irá instanciar 3 maquinas e compartilhar a chave pública do host com as máquinas virtuais, **deverá ter o nome "id_rsa_gcp_erad.pub"**. Para passar as credenciais para o terraform basta popular a variável de ambiente **GOOGLE_APPLICATION_CREDENTIALS**.

```shell
  export GOOGLE_APPLICATION_CREDENTIALS=<path_json>
```

### Executando o Terraform

Para inicializar o Terraform, basta executar o seguinte comando:

```shell
  terraform init
```

Após ser inicializado, execute o seguinte comando para visualizar as alterações que o Terraform irá realizar:

```shell
  terraform plan
```

Para realizar as modificações:

```shell
  terraform apply
```

## Ansible

Para realizar a configuração do ambiente será necessário popular a variável de ambiente **GCP_SERVICE_ACCOUNT_FILE**

```shell
  export GCP_SERVICE_ACCOUNT_FILE=<path_json>
```

### Executar o Ansible

Para isso, basta realizar o download do plugin **gce_compute**, executando o seguinte comando:

```shell
  pip install requests google-auth
```

Para inicializar o Ansible:

```shell
  ansible-playbook -i inventory.gcp.yml -u gce  playbook.yml

```

## Exmemplo

Para executar uma aplicação Hadoop deverá ser crio um diretorio no qual será gerado uma pasta de saída, a pasta de saída **não pode existir**.

```shell
  mkdir input
  cp $HADOOP_COMMON_HOME/etc/hadoop/*.xml input
```

Copiar o diretorio inpout para o HDFS

```shell
  hadoop dfs -copyFromLocal input /in
```

executando o wordCount

```shell
  hadoop jar $HADOOP_COMMON_HOME/share/hadoop/mapreduce/hadoop-mapreduce-examples-3.2.1.jar wordcount /in output
```

Coletando a saída do HDFS

```shell
  hdfs dfs -get output output
  cat output/*
```
