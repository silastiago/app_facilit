# Documentação do processo de automação.


Para este processo de automação foram utilizadas as tecnologias, git, terraform, ansible, docker, cadvisor, prometheus, exporter para tomcat e grafana, para juntas trazerem uma solução de provisionamento e monitoramento de uma aplicação simples.


## Criação das Maquinas Virtuais na AWS.

Primeiramente foi criado 1 credencial de acesso para criação de instancias na minha conta da AWS e com isso eu adicionei nas variaveis de ambiente do meu sistema operacional essas credenciais access_key e secret_key, com isso não me preocupo com senhas enviadas dentro do codigo do terraform.

Depois utilizamos o terraform para criar as maquinas virtuais na AWS, foram criadas 2 instancias, monitoramento e app.

O codigo para verificação do projeto se encontra no link abaixo:

	https://github.com/silastiago/app_facilit 

## Instalação dos serviços nas instancias da AWS.

Para a instalação dos serviços nas instancias foi criado 1 playbook no ansible para execução das tarefas para esta instalação.

Para que minha maquina tivesse acesso ssh às instancias da AWS foi criado um par de chaves para que eu pudesse usá-las para acesso aos servidores, com isso não me preocupo com senhas enviadas dentro do codigo do ansible só referencio onde está esse arquivo com as chaves.

Como no terraform, o codigo utilizado  no ansible para provisionar os serviços nas instancias também se encontra nesse repositorio git.

## Como executar o processo ?

Antes de baixar e executar o projeto, você precisará criar 1 conta na AWS e criar um credencial para acesso.

Depois de criado a credencial você terá que linkar ela no codigo do terraform de alguma forma, eu usei variavel de ambiente no link a seguir mostra o exemplo de como fazer.

	https://registry.terraform.io/providers/hashicorp/aws/latest/docs 

Após criar a credencial baixe o projeto git, acesse a pasta terraform e execute o projeto com o comando a seguir:

	terraform apply

Observação não mostraremos como instalar o terraform nesse passo a passo, visto que quem estará vendo esse passo a passo deve ter conhecimento previo de como fazer, porém quem não tem esse conhecimento veja o link da hashicorp ensinando como fazer.

	https://learn.hashicorp.com/tutorials/terraform/install-cli

Após criar as instancias na AWS pelo terraform, copie os dns das instancias que é retornado pelo terraform, pois não utilizamos inventario dinamico no ansible nesse projeto e essa parte de cadastrar os hosts no inventario do  ansible será feito manual mesmo. 

Após inserir no inventario do ansible os dados das instancias criadas execute o playbook com o comando:

	ansible-playbook -i hosts playbook.yml	
	
Após a execução do playbook o ansible instalou, docker, e executou alguns docker-composes com prometheus, grafana, cadvisor e também tomcat.



### Link das aplicações ###
 - **Grafana**
   - http://ec2-3-21-125-176.us-east-2.compute.amazonaws.com:3000/
   - Usuario: teste
   - Senha: teste

 - **Prometheus**
   - http://ec2-3-21-125-176.us-east-2.compute.amazonaws.com:9090/
 
 - **Sample**
   - http://ec2-18-188-15-100.us-east-2.compute.amazonaws.com/sample
   - http://ec2-18-188-15-100.us-east-2.compute.amazonaws.com/metrics
 
 - **Cadvisor**
   - http://ec2-18-188-15-100.us-east-2.compute.amazonaws.com:8080/metrics
  
