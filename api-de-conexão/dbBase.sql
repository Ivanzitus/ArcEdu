use api;
CREATE TABLE `Usuarios` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `nome` varchar(100),
  `email` varchar(100) UNIQUE NOT NULL,
  `senha` varchar(255) NOT NULL,
  `dt_cadastro` datetime 
);
 
CREATE TABLE `Locais` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `titulo` varchar(100) NOT NULL,
  `grupo` char,
  `tipo` varchar(50),
  `categoria` varchar(50),
  `descricao` varchar(200),
  `detalhes` text,
  `endereco` varchar(150),
  `hra_funcionamento` varchar(200),
  `localiza_lat` decimal(10,6),
  `localiza_long` decimal(10,6),
  `site` varchar(200),
  `ativo` bool ,
  `dt_cadastro` datetime 
);
 
CREATE TABLE `Avaliacoes` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `nota` int,
  `comentario` text,
  `visivel` bool ,
  `usuario_id` int,
  `local_id` int,
  `dt_cadastro` datetime 
);
 
CREATE TABLE `Eventos` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `titulo` varchar(150) NOT NULL,
  `descricao` text,
  `local` varchar(255),
  `data` datetime,
  `dt_fim` datetime,
  `aberto` bool,
  `site` varchar(200),
  `dt_cadastro` datetime 
);
 
CREATE TABLE `Comentarios_Eventos` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `evento_id` int,
  `usuario_id` int,
  `texto` text,
  `dt_comentario` datetime 
);
 
CREATE TABLE `Imagens` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `caminho` varchar(200),
  `legenda` varchar(250),
  `tipo_origem` char,
  `origem_id` int,
  `capa` bool ,
  `dt_cadastro` datetime 
);
 
CREATE TABLE `Historias` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `titulo` varchar(150) NOT NULL,
  `texto` text,
  `autor` varchar(100),
  `usuario_id` int,
  `dt_cadastro` datetime 
);
 
ALTER TABLE `Avaliacoes` ADD FOREIGN KEY (`usuario_id`) REFERENCES `Usuarios` (`id`);
 
ALTER TABLE `Avaliacoes` ADD FOREIGN KEY (`local_id`) REFERENCES `Locais` (`id`);
 
ALTER TABLE `Comentarios_Eventos` ADD FOREIGN KEY (`evento_id`) REFERENCES `Eventos` (`id`);
 
ALTER TABLE `Comentarios_Eventos` ADD FOREIGN KEY (`usuario_id`) REFERENCES `Usuarios` (`id`);
 
ALTER TABLE `Historias` ADD FOREIGN KEY (`usuario_id`) REFERENCES `Usuarios` (`id`);
 