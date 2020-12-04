<?php
require "Conexao.php";

class Pedido
{
    public static function getAll()
{
    $conection = Connection::getdb();
    $stmt = $conection->query("select * from pedido");
    return $stmt->fetchAll(PDO::FETCH_ASSOC);

}
    public static function getRequestWithProducts(){
        $conection = Connection::getdb();
        $stmt = $conection->query("select * from pedido join produtos on pedido.idproduto = produtos.idproduto");
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

}



