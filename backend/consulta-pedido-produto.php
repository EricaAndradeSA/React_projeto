<?php

header("Access-Control-Allow-Origin:*");
header("Content-type: application/json");

require "./Models/Pedido.php";
$pedido = Pedido::getRequestWithProducts();
print_r(json_encode($pedido));