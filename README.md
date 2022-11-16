# PSET #
#### Raphael Braian C. - CC1N ####
Essa pasta, e especialmente esse bloco de texto, é a minha primeira etapa na estruturação de um espaço para armazenar 
os meus scripts e o meu progresso no Pset, direcionando eles para o meu repositório Github através do comando PUSH.
Quando eu criei esse subdiretório, eu tive de enfrentar alguns problemas. Entre eles:

1. A pouca memória RAM do meu computador (4GB) permite que eu rode a Máquina Virtual e o BD Server, porém com
tremenda lentidão e dificuldade. Impossibilitado de instalar os aplicativos necessários no meu computador Windows,
tive de me virar com o que podia.

1. Quando instalei e terminei de configurar o Git na máquina virtual, acabei me deparando com um problema. Sempre
que eu tentava executar o comando Push, e o Initial Commit, para este documento de texto e sub-diretório, eu me deparava
 com o erro ''Gtk-Messae: 17:02:38.635: Failed to load module'', seguido de campos de Login e Senha, para preenchimento 
obrigatório. Mesmo inserindo meu login e senha do Github, não era possível seguir com o comando Push. 
Felizmente, meu colega Carlos me mandou uma mensagem, questionando se eu estava enfrentando o exato mesmo problema que ele.
E era exatamente isso! Então ele me disse que questionou o professor Abrantes, e a solução era criar um código TOKEN
do Github para inserir no lugar do campo que requisitava uma senha. Eu pesquisei uma maneira de fazer isso, e dito e feito,
acabou funcionando e eu pude executar o comando Push.

1. Em algum ponto do processo, meu diretório original se tornou corrompido, e a solução foi revertê-lo para uma versão anterior.
Feito isso, porém, a versão do projeto no Github e a versão local na máquina virtual se tornaram incompatíveis, impossibilitando
que eu utilizasse o comando Push para levar minhas alterações direto para o diretório Github online. Normalmente, um comando PULL
resolveria isso, mas por alguma razão isso não funcionou pra mim. Tive de utilizar o Commit no próprio website do Github para salvar
as alterações no projeto.

## SQL POWER ARCHITECT ##
Aprender a utilizar o SQL Power Architect não foi difícil. Minha única ''dificuldade'' foi aprender à criar as AK, Alternate Keys,
que existiam no modelo HR passado pelo professor. Mas relendo o Pset eu me dei conta de que deveria fazer isso através da propri-
edade Index. O processo se tornou bem fácil desde então.
Eu não estava totalmente certo sobre os erros no projeto que o professor Abrantes mencionou. Alguns pareciam bem óbvios, outros 
nem tanto, como as *Foreign Keys não podendo ser Not Null.* Comparei meu projeto lógico com alguns colegas e concordamos em relação
aos erros. Só espero que o professor concorde também.
Outro problema que enfrentei foi o tamanho dos comentários, na hora de converter o projeto lógico em um script SQL (que eu iria 
alterar). Eu costumo escrever muito e fazer várias piadinhas sem graça, e existem limites específicos de caracteres para alguns
SGBD's que eu desconhecia. Para automatizar um script para o MariaDB, por exemplo, eu vou precisar refazer todos os comentários.

### Root e instalação dos pacotes de linguagem. ###
Eu havia esquecido completamente de como acessar o usuário Root. Tentei usar o comando Sudo do terminal, mas logado como um usuário
não administrador, o Computacao. Quando me dei conta de que eu precisava logar com o usuário administrador, se tornou mais fácil.
Pesquisei na Internet qual o comando específico para executar uma instalação na minha versão do Linux (da máquina virtual), e funcionou.
Depois de certo tempo, os pacotes de linguagem foram instalados sem demais problemas.

## POSTGRESQL ##
O primeiro script que eu automatizei foi o do Postgresql. Ele foi fácil de produzir, necessitando apenas de algumas correções no 
projeto lógico. Dito isto, eu tive de aprender a utilizar o Postgres, já que nunca havíamos feito uso desse SGBD durante as aulas.
As aulas online da Bóson Treinamento foram de grande ajuda. Eu aprendi a me conectar ao Postgres, criar um banco de dados, criar um
SCHEMA e etc. Seguido disso, utilizei o DBeaver para rodar o código. Com algumas alterações, ele passou a funcionar.
O problema agora era implementar os dados do HR original no meu código, para que rodassem no Postgres. Foi isso que me causou mais dor
de cabeça. Não conseguindo utilizar o código passado pelo professor no Pset, recebi uma dica de um colega - todos os comandos de inserção
estavam disponíveis no hr_popul.sql, no meu computador. Eu só precisaria copiar todos e implementar no código.
Claro, isso também significava várias alterações. Eu precisaria substituir todos os nomes de todas as tabelas mencionadas nos comandos Insert
originais por suas versões em português. É um processo lento e enfadonho, mas eu consegui terminar em uma noite.
Porém, logo me vi encarando outro problema. O código não queria funcionar, porque a inserção de dados conflitava com as Constraints de Primary
e Foreign Key já estabelecidas no código. A solução pra isso foi alterar o script, pegando os comandos das Constraints e colocando-os no final
do código, depois dos Inserts de dados. Com isso, o script do Postgresql passou a funcionar bem no meu computador. Agora faltava o do MariaDB.

## MYSQL/MARIADB ##
Por incrível que pareça, o SGBD com o qual eu era o mais familiar acabou me causando a maior dor de cabeça. Praticamente todos os meus comentários
do projeto lógico tiveram de ser refeitos, devido ao limite de caracteres para comentários no MariaDB. Não só isso, mas houve um erro com a
Deferrability de uma das relações 1:N entre as tabelas que eu tive de consertar. E mesmo com isso feito, o script lógico automatizado precisou
de uma série de re-ajustes para funcionar corretamente.
Um desses re-ajustes foi novamente em relação aos comentários. O script seguiu o modelo de ALTER TABLE ___ ADD COMMENT ___ para registrar
os meus comentários do Power Architect, comandos esses que o MySQL não reconhecia. Então tive de alterar manualmente todos os comandos e trocá-los
pelos tracinhos ''--''.
Feito isso, também tive problemas com o formato das datas de alguns Inserts. Eu reutilizei os Inserts do meu script PostgreSQL e não tive problemas,
(com exceção dos empregados, o qual eu refiz com base no comando sugerido pelo professor Abrantes, já que eles não funcionavam no MySQL) e aqueles que
se referiam à datas, aceitavam apenas o formato ''yyyy-MM-dd'' ao invés de ''dd-MM-yyyy''. Então novamente eu tive de alterar dezenas de Inserts para
tornar isso viável.
Feito isso, houveram também alguns errinhos que eu fiz no projeto lógico, que tive de consertar no script. Principalmente em relação às constraints, algumas
tiveram de ser excluídas, e outras alteradas. Mas também na ordem dos dados durante a criação das tabelas, e etc. Foi-se umas três horas de depuração, mas 
com tudo terminado, o script estava pronto e funcional.
