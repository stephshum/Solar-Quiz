<?php
include('includes/init.php');

$page_number = 1;
?>
  <!DOCTYPE html>
  <html>

  <head>
    <meta charset="UTF-8">
    <title>title</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
  </head>

  <body>
    <?php
$sql = "SELECT * FROM pages WHERE id = :page_number;";
$records = exec_sql_query($db, $sql);
foreach ($records as $record){
  $question_id = $record["question_id"];
  $photo_id = $record["photo_id"];

}
$sql = "SELECT * FROM photos WHERE id = :photo_id;";
$records = exec_sql_query($db, $sql);
foreach ($records as $record){
  $file_name = $record["file_name"];
  $file_ext = $record["file_ext"];
  $alt_text = $record["alt_text"];
}
$sql = "SELECT * FROM questions WHERE id = :question_id;";
$records = exec_sql_query($db, $sql);
foreach($records as $record){
  $question = $record["question"];
  $answer = $record["answer"];
}
?>

      <div class="row">
        <div class="column">
          <?php "<img src=img/$file_name class=image alt=$alt_text> "?>
        </div>
        <div class="column">
          <div class="white_square">
            <div class="internal_container">
              <?php "<div class=question> $question </div>" ?>
              <button class="fact_button fact">Fact</button>
              <button class="myth_button myth">Myth</button>
            </div>
          </div>
        </div>
      </div>
  </body>

  </html>
