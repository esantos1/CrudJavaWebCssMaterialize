create database dbalunos;
use dbalunos;

CREATE TABLE IF NOT EXISTS `aluno` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `prim` double NOT NULL,
  `seg` double NOT NULL,
  `ter` double NOT NULL,
  `qua` double NOT NULL,
  `media` double DEFAULT NULL,
  `status_final` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

INSERT INTO `aluno` (`codigo`, `nome`, `prim`, `seg`, `ter`, `qua`, `media`, `status_final`) VALUES
(1, 'Bernado Figueiredo', 7.5, 8, 9.5, 9, 8.5, 'APROVADO'),
(2, 'Kátia Lima', 8, 5, 6, 6, 6.25, 'RECUPERAÇÃO'),
(6, 'Flavia Macedo', 3, 6.5, 4, 3.5, 4.25, 'REPROVADO'),
(29, 'Maria Marlene Ramos', 8, 8, 8, 7.5, 7.875, 'APROVADO'),
(31, 'Henrique de Souza Wuesten', 8, 8, 8, 9, 8.25, 'APROVADO'),
(32, 'Erica de souza', 8, 8, 7.5, 7.5, 7.75, 'APROVADO');