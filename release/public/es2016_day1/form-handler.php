<?php
  header('Content-Type: application/json');
  // var_dump(json_decode($_POST['tickets'], true));
  echo json_encode($_POST);
