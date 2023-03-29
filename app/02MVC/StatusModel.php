<?php

require_once('Model.php');

class StatusModel extends Model{
  public $status_id;
  public $status;

  public function __construct(){
    $this->db_name = 'lexflix';
  }

  public function create(){

  }


  public function read( $status_id = '' ){
    $this->query = ( $status_id != '' )
      ? "SELECT * FROM status WHERE status_id = $status_id"
      : "SELECT * FROM status";
      

    $this->get_query();
    // print_r($this->rows);

    $num_rows = count($this->rows);
    // echo $num_rows;

    $data = array();

    foreach($this->rows as $key => $value){
      $data[$key] = $value;
    }

    return $data;
  }


  public function update(){

  }

  public function delete(){

  }

  public function __destruct(){
    // unset($this);
  }
}