<?php

const GALLERY_UPLOADS_PATH = "img/";


// show database errors during development.
function handle_db_error($exception) {
  echo '<p><strong>' . htmlspecialchars('Exception : ' . $exception->getMessage()) . '</strong></p>';
}

// execute an SQL query and return the results.
function exec_sql_query($db, $sql, $params = array()) {
  try {
    $query = $db->prepare($sql);
    if ($query and $query->execute($params)) {
      return $query;
    }
  } catch (PDOException $exception) {
    handle_db_error($exception);
  }
  return NULL;
}

// open connection to database
function open_or_init_sqlite_db($db_filename, $init_sql_filename) {
if (!file_exists($db_filename)) {
  $db = new PDO('sqlite:' . $db_filename);
  $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

  $db_init_sql = file_get_contents($init_sql_filename);
  if ($db_init_sql) {
    try {
      $result = $db->exec($db_init_sql);
      if ($result) {
        return $db;
      }
    } catch (PDOException $exception) {
      // If we had an error, then the DB did not initialize properly,
      // so let's delete it!
      unlink($db_filename);
      throw $exception;
    }
  }
} else {
  $db = new PDO('sqlite:' . $db_filename);
  $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
  return $db;
}
return NULL;
}


$db = open_or_init_sqlite_db('solar-quiz.sqlite', 'init/init.sql');

?>
