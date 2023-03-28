<?php

abstract class Model{
  private static $db_host = 'localhost';
  private static $db_user = 'root';
  private static $db_pass = '';
  protected $db_name;
  private static $db_charset = 'utf8';
  private $conn;
  protected $query;
  protected $rows = array();

  //metodos
  //metodos abstractos para CRUD de clases que hereden
  abstract protected function create();
  abstract protected function read();
  abstract protected function update();
  abstract protected function delete();

  //metodo privado para conectarse a la base de datos
  private function db_open(){
    $this->conn = new mysqli(
      self::$db_host, 
      self::$db_user, 
      self::$db_pass,
      self::$db_name
    );

    $this->conn->set_charset(self::$db_charset);
  }

  //metodo privado para desconectarse a la base de datos
  private function db_close(){
    $this->conn->close();
  }

  //establecer un query que afecte datos (INSERT, DELETE, UPDATE)
  protected function set_query(){
    $this->db_open();
    $this->conn->query( $this->query );
    $this->db_close();
  }

  //obtener resultados de un query (SELECT)
  protected function get_query(){
    $this->db_open();
    $result = $this->conn->query($this->query);
    while( $this->rows[] = $result->fetch_assoc() );
    $result->close();

    $this->db_close();

    return $this->rows;
  }

}