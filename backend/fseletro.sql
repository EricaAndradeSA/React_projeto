SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

CREATE DATABASE IF NOT EXISTS `fseletro` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `fseletro`;

CREATE TABLE `comentarios` (
  `id` int(30) NOT NULL,
  `nome` varchar(30) NOT NULL,
  `msg` varchar(50) NOT NULL,
  `data` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `comentarios` (`id`, `nome`, `msg`, `data`) VALUES
(17, 'Vera', 'pergunta', '2020-10-31 20:47:56'),
(21, '', '', '2020-10-31 20:49:49'),
(27, 'Maria Pereira', 'Comprou um fogão', '2020-10-31 20:54:38'),
(28, 'Luiz Henrique', 'Comprou um forno', '2020-10-31 20:55:02'),
(29, 'Lucas Santos', 'Comprou um microondas', '2020-10-31 20:55:35'),
(47, 'Verivaldo Santana', 'Comprou uma geladeira', '2020-10-31 21:11:45'),
(49, 'Erica Andrade', 'forno-microondas', '2020-11-06 08:06:53'),
(57, 'Alline', 'eeeeeeeeee', '2020-11-07 16:28:32');

CREATE TABLE `pedido` (
  `idpedido` int(11) NOT NULL,
  `nome_cliente` varchar(50) DEFAULT NULL,
  `quantidade` int(11) DEFAULT NULL,
  `idproduto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `pedido` (`idpedido`, `nome_cliente`, `quantidade`, `idproduto`) VALUES
(1, 'Mario', 3, 1),
(2, 'Mario', 3, 1),
(3, 'Ricardo', 2, 4),
(4, 'Maria', 3, 1),
(5, 'Pedro', 3, 2);
CREATE TABLE `produtos` (
  `idproduto` int(11) NOT NULL,
  `categoria` varchar(45) NOT NULL,
  `descricao` varchar(120) NOT NULL,
  `preco` decimal(8,2) NOT NULL,
  `preco_final` decimal(8,2) NOT NULL,
  `imagem` varchar(245) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `produtos` (`idproduto`, `categoria`, `descricao`, `preco`, `preco_final`, `imagem`) VALUES
(1, 'geladeira', 'Geladeira Consul Side', '6389.20', '5019.00', 'imagem/geladeira1.jpg'),
(2, 'geladeira', 'Geladeira Continental Side', '6500.19', '4019.00', 'imagem/geladeira3.jpg'),
(3, 'cooktop', 'Cooktop Brastemp', '2389.20', '1019.00', 'imagem/cooktop.jpg'),
(4, 'cooktop', 'Cooktop Brastemp', '700.00', '540.00', 'imagem/cooktop1.jpg'),
(5, 'cooktop', 'Cooktop Continental 4 bocas', '700.00', '540.00', 'imagem/cooktop3.jpg'),
(6, 'microondas', 'Microondas Brastemp 240 Litros', '1000.00', '800.00', 'imagem/microondas.jpg'),
(7, 'microondas', 'Microondas Brastemp 240 Litros', '1500.23', '1000.00', 'imagem/microondas1.jpg'),
(8, 'microondas', 'Microondas Brastemp 140 Litros', '550.00', '400.00', 'imagem/microondas2.jpg'),
(9, 'forno eletrico', 'Forno Eletrico Brastemp', '6389.20', '5019.00', 'imagem/fornoeletrico.jpg'),
(10, 'forno eletrico', 'Forno Eletrico Mueller 140 Litros', '550.00', '400.00', 'imagem/fornoeletrico2.jpg'),
(11, 'forno eletrico', 'Forno Eletrico Brastemp', '6389.20', '5019.00', 'imagem/fornoeletrico1.jpg'),
(12, 'geladeira', 'Geladeira Brastemp', '6389.20', '5019.00', 'imagem/geladeira.jpg');

--------------Trabalhando com join tabela pedido e tabela produtos--------------

SELECT * from pedido join produtos on produtos.idproduto = pedido.idproduto
SELECT idpedido, nome_cliente, quantidade from pedido join produtos on produtos.idproduto = pedido.idproduto
SELECT idpedido, nome_cliente, quantidade, descricao from pedido join produtos on produtos.idproduto = pedido.idproduto


ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nome` (`nome`);

ALTER TABLE `pedido`
  ADD PRIMARY KEY (`idpedido`),
  ADD KEY `pedidos_fk` (`idproduto`);
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`idproduto`),
  ADD UNIQUE KEY `imagem_UNIQUE` (`imagem`);

ALTER TABLE `comentarios`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;


ALTER TABLE `pedido`
  MODIFY `idpedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

ALTER TABLE `produtos`
  MODIFY `idproduto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

ALTER TABLE `pedido`
  ADD CONSTRAINT `pedidos_fk` FOREIGN KEY (`idproduto`) REFERENCES `produtos` (`idproduto`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;
