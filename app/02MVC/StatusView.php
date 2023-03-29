<?php

require('StatusModel.php');

echo '<h1>CRUD con MVC de la Tabla Status</h1>';

$status = new StatusModel();

$status_data = $status->read();
print_r($status_data);

$num_status = count($status_data);
echo "<h2>Numero de Statuss: <mark>$num_status</mark></h2>";