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

O terraform se encarregará de criar infraestrutura e executar o playbook do ansible.

Observação não mostraremos como instalar o terraform nesse passo a passo, visto que quem estará vendo esse passo a passo deve ter conhecimento previo de como fazer, porém quem não tem esse conhecimento veja o link da hashicorp ensinando como fazer.

        https://learn.hashicorp.com/tutorials/terraform/install-cli
        https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html

Após a execução do playbook o ansible instalou, docker, e executou alguns docker-composes com prometheus, grafana, cadvisor e também tomcat.
