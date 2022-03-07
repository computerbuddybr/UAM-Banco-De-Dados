**Segue a resposta do exercício feito com o MySQL Workbench com 5 arquivos.**

- 1 ReadMe.md com as explicações da lógica que me levaram a resolver a atividade.
- 1 SQL com o DDL para a criação do banco completo.
- 1 SQL com o DDL para a criação somente da tabela CARGOS como pedido no enunciado.
- 1 PNG com o modelo relacional.
- 1 arquivo mwb do MySQL Workbench com a criação do Modelo.


###Minha resposta:
Criei o modelo relacional abaixo:

![Imagem em png do Modelo relacional](modelo_relacional.png)


Este modelo foi elaborado com o seguinte raciocino lógico:

Elaborei as tabelas pensando nos relacionamentos. Cada tabela tinha uma chave primária com o código então, seria cod_cargo para o código dos cargos, cod_funcionarios para o código dos funcionários e assim por diante, sempre seguindo o padrão cod_ seguido do nome da tabela em singular.

Cada funcionário possui um cargo e um setor, e somente um de cada. Porém, cada cargo e cada setor podem estar relacionados a muitos funcionários, sendo que as relações entre a tabela FUNCIONARIOS e a tabela CARGOS, assim como a relação entre a tabela FUNCIONARIOS e a tabela SETORES serão então de 1:n, de um para muitos. Então, na tabela FUNCIONARIOS, além dos atributos pedidos código e nome, também adicionei as chaves estrangeiras fk_cod_setor e fk_cod_cargo.

Já cada projeto pode estar relacionado a mais de um funcionário e mais de um funcionário pode estar relacionado a mais de um projeto. Com uma relação n:m, de muitos para muitos. Para tanto, criei uma tabela extra PROJETOS_TEM_FUNCIONARIOS com dois atributos que são duas chaves estrangeiras relacionando o código do projeto com o código do funcionário, fk_cod_projeto e fk_cod_projeto.

Todas as chaves primárias e estrangeiras são do tipo INT Unsigned, visto que não faz sentido o código ser negativo e desse modo vou ter o dobro de possibilidades de código. As chaves primárias de códigos também são de autoincremento para que no cadastro não seja necessária a precaução com a criação do código, ele sempre será gerado automaticamente sendo o próximo de cada entidade.
Para o salário na tabela CARGOS decidi usar um DECIMAL(10,2) imaginando que o salário do cargo mais alto não passaria de 99.999.999,99.

Para os atributos cargo e setor das tabelas CARGOS e SETORES, respectivamente, decidi usar o tipo VARCHAR(50) visto que os nomes dos cargos e setores não deveriam ser muito longos. Já para o nome na tabela FUNCIONARIOS usei o VARCHAR(100), já que alguns nomes são bem compridos e é interessante não se abreviar o nome do funcionário.

Nas tabelas SETORES, CARGOS e PROJETOS, no atributo descrição, ainda usei VARCHAR mas com 500 caracteres, pensando que no exemplo dado a descrição tem 75 caracteres mas gostaria de dar a possibilidade de se detalhar um pouco mais sem se estender demais, então pensei em 500 caracteres que são aproximadamente 75 palavras. Por ser um breve texto, um tipo como TEXT seria desperdício neste atributo.

Já na tabela PROJETOS, a abreviatura usa VARCHAR(25), pois a abreviatura não deveria ser longa, mas vemos pelo exemplo TOPAZIO que ela também não será necessariamente curta.
Todos os atributos são NOT NULL, não nulo visto que todos eles são obrigatórios.

Abaixo, segue o comando DDL para a criação da tabela CARGOS como pedido no enunciado:
```

CREATE TABLE IF NOT EXISTS `construtora`.`CARGOS` (
  `pk_cod_cargo` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `cargo` VARCHAR(50) NOT NULL,
  `descricao` VARCHAR(500) NOT NULL,
  `salario` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`pk_cod_cargo`));

```

 