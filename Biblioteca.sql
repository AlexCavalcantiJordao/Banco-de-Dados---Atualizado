create database Biblioteca;

create table Autor(
IdAutor smallint identity,
NomeAutor varchar(50) not null,
SobrenomeAutor varchar(60) not null,
constraint pk_id_autor primary key(IdAutor));

sp_help Autor;

create table Editora(
IdEditora smallint primary key identity,
NomeEditora varchar(50) not null);

create table Assunto(
IdAssunto tinyint primary key identity,
NomeAssunto varchar(25) not null);

create table Livro(
IdLivro smallint not null primary key identity(100,1),
NomeLivro varchar(70) not null,
ISBN13 char(13) unique not null,
DataPub date,
PrecoLivro money not null,
NumeroPagina smallint not null,
IdEditora smallint not null,
IdAssunto tinyint not null,
constraint fk_id_editora foreign key (IdEditora)
  references Editora(IdEditora) on delete cascade,
constraint fk_id_assunto foreign key (IdAssunto)
  references Assunto(IdAssunto) on delete cascade,
constraint verificar_preco check(PrecoLivro >= 0));

create table LivroAutor(
IdLivro smallint not null,
IdAutor smallint not null,
constraint fk_id_livros foreign key(IdLivro) references Livro(IdLivro),
constraint fk_id_autores foreign key(IdAutor) references Autor(IdAutor),
constraint fk_autor primary key(IdLivro, IdAutor));

select name from Biblioteca.sys.tables;

-- Inserir Registro...
-- Tabela de Assuntos...
insert into Assunto (NomeAssunto)
values
('Fic��o Cient�fico'), ('Bot�nica'),
('Eletr�nica'), ('Matem�tica'),
('Aventura'), ('Romance'),
('Finan�a'), ('Gastronomia'),
('Terror'), ('Administra��o'),
('Inform�tica'), ('Suspense');

-- Verifica��o....
select * from Assunto;

-- Tabela de Editora...
insert into Editora(NomeEditora)
values
('Prentice Hall'), ('O�Reilly');

-- Verifica��o...
select * from Editora;

-- Mais editoras...
insert into Editora(NomeEditora)
values
('Aleph'), ('Microsoft'),
('Wiley'),('HarperCollins'),
('�rica'), ('Novatec'),
('McGraw-Hill'), ('Apress'),
('Globo'), ('Companhia de Letras'),
('Franscisco Alves'), ('Sybex'),
('Morro branco'), ('Penguins Books'),('Martins Claret'), 
('Oxford'),('Taschen'), ('Ediouro'),('Bookman'),
('Record'), ('Springer'), ('Melhoramentos');

-- Verifica��o...
select * from Editora;

-- Tabela de Autores...
-- 1) Inserir uma linha �nica...
insert into Autor(NomeAutor, SobrenomeAutor)
values ('Umberto', 'Eco');

-- Verifica��o...
select * from Autor;

-- 2) Inserir m�ltiplas linhas distintas (v�rios registros)...
insert into Autor (NomeAutor, SobrenomeAutor)
values 

('Daniel', 'Barret'), ('Gerald', 'Carter'), ('Mark', 'Sobell'),
('Willian', 'Stanek'), ('Christine', 'Bresnahan'), ('William', 'Gibson'),
('James', 'Joyce'), ('John', 'Emsley'), ('Jos�', 'Saramago'),
('Richard', 'Silverman'), ('Robert', 'Byrnes'), ('Jay', 'Ts'),
('Robert', 'Eckstein'), ('Paul', 'Horowitz'), ('Winfield', 'Hill'),
('Joel', 'Murach'), ('Paul', 'scherz'), ('Simon', 'Monk'),
('George', 'Orwell'), ('Italo', 'Calvino'), ('Machado', 'de Assis'),
('Oliver', 'Stacks'), ('Ray', 'Bradbury'), ('Walter', 'Isaacson');

-- Verifica��o...
select * from Autor;

-- Tabela de Livros...
insert into Livro(NomeLivro, ISBN13, DataPub, PrecoLivro,
NumeroPagina, IdAssunto, IdEditora)
values ('A Arte da Eletr�nica', '9788582604342',
'20170308', 30.74, 1160, 3, 24);

select * from Livro;