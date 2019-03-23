<?php
include('includes/init.php');

$page_number = filter_input(INPUT_GET, "pageid", FILTER_SANITIZE_FULL_SPECIAL_CHARS);
$page_number = trim($page_number);
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
    $sql = "SELECT * FROM pages WHERE id = $page_number;";
    $records = exec_sql_query($db, $sql)->fetchAll();
    foreach ($records as $record){
      $question_id = $record["question_id"];
      $photo_id = $record["photo_id"];
    }
    $sql = "SELECT * FROM photos WHERE id = $photo_id;";
    $records = exec_sql_query($db, $sql)->fetchAll();
    foreach ($records as $record){
      $file_name = $record["file_name"];
      $file_ext = $record["file_ext"];
      $alt_text = $record["alt_text"];
    }
    $sql = "SELECT * FROM questions WHERE id = $question_id;";
    $records = exec_sql_query($db, $sql)->fetchAll();
    foreach($records as $record){
      $question = $record["question"];
      $answer = $record["answer"];
    }
    ?>

      <div class="row">
        <div class="column">
          <?php echo "<img src=img/$file_name class=image alt=$alt_text> "?>
        </div>
        <div class="column">
          <div class="white_square">
            <div class="internal_container">
              <?php
              echo "<div class=question> $question </div>";
              $sql = "SELECT COUNT(*) FROM pages;";
              $records = exec_sql_query($db, $sql)->fetchAll();
              foreach ($records as $record){
                $total_pages = $record["COUNT(*)"];
              };
              if ($total_pages == $page_number) {
                echo "<form method=get action=emailform.html>";
              } else {
                echo "<form method=get action=quiz.php>";
              }
              ?>
                <button class="fact_button fact">Fact</button>
                <button class="myth_button myth">Myth</button>
                <?php
                $page_number = $page_number + 1;
                echo "<input type=hidden id=pageid name=pageid value=$page_number> "?>
              </form>
            </div>
          </div>
        </div>
      </div>
  </body>

  </html>
