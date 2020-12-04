<?php
require "Conexao.php";

class Produto
{
    public static function getAll()
    {
        $conection = Connection::getdb();
        $stmt = $conection->query("select * from produtos");
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }   

}