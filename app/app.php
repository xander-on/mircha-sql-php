<?php
// Definimos la clase MyApp
class MyApp {
    
    public function getGreeting($name) {
      return "Happy Coding $name !!!";
    }
    
    public function run() {
      $name = 'Alexander';
      
      // Obtenemos el saludo personalizado
      $greeting = $this->getGreeting($name);
      
      // Renderizamos la página de inicio
      // require_once 'views/home.php';

      echo "<h1>$greeting</h1>";
    }
}
?>
