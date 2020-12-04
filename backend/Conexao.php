<?php
class Connection 
{
    public static function getdb()
    {
        $conn = new PDO("mysql:host=localhost;dbname=fseletro;charset=utf8", "root", "");

        if ($conn){
            return $conn;

        }else {
            echo "<h1>falha na conexão</h1>";
        }
    }   

}
