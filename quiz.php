<?php
include('includes/init.php');
$quiz_name = trim(filter_input(INPUT_GET, "chooseAQuiz", FILTER_SANITIZE_FULL_SPECIAL_CHARS));


if (isset($_GET['pageid'])) {
  $prev_pageid = trim(filter_input(INPUT_GET, "pageid", FILTER_SANITIZE_FULL_SPECIAL_CHARS));
  $current_place = trim(filter_input(INPUT_GET, "currentplace", FILTER_SANITIZE_FULL_SPECIAL_CHARS)) + 1;
  $sql = "select min(id) from pages where quiz_id = (SELECT id FROM quizzes WHERE quizzes.name = '$quiz_name') and pages.id>$prev_pageid;";
} else {
  $sql = "select min(id) from pages where quiz_id = (SELECT id FROM quizzes WHERE quizzes.name = '$quiz_name');";
  $current_place = 1;
}

$records = exec_sql_query($db, $sql)->fetchAll();
foreach ($records as $record) {
  $page_number = $record['min(id)'];
}

$sql = "select * from pages where quiz_id = (SELECT id FROM quizzes WHERE quizzes.name = '$quiz_name');";
$records = exec_sql_query($db, $sql)->fetchAll();
$number_pages = 0;
foreach ($records as $record) {
  $number_pages = $number_pages+1;
}


// $records = exec_sql_query($db, $sql)->fetchAll();
// foreach ($records as $record) {
//   $page_number = $record['min(id)'];
// }

?>
  <!DOCTYPE html>
  <html>

  <head>
    <meta charset="UTF-8">
    <title>Fact or Myth</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
    <script src="Reply.js" type="text/javascript"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>


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
      $file_id = $record["id"];
      $file_ext = $record["file_ext"];
      $alt_text = $record["alt_text"];
    }
    $sql = "SELECT * FROM questions WHERE id = $question_id;";
    $records = exec_sql_query($db, $sql)->fetchAll();
    foreach($records as $record){
      $question = $record["question"];
      $answer = $record["answer"];
      $feedback = $record["feedback"];
    }
    ?>
    <div class="center">
      <?php
      $place = 0;
      while ($place < $current_place){
        echo "<i class='fas fa-circle'></i>";
        $place = $place + 1;
      }
      while ($place < $number_pages){
        echo "<i class='far fa-circle'></i>";
        $place = $place + 1;
      }
       ?>
     </div>

      <div class="row">

        <div class="column">
          <?php echo "<img src=img/$file_id.$file_ext class=questionimage alt=$alt_text> ";?>
        </div>
        <div class="column">
          <div class="white_square">
            <div class="internal_container">
              <?php
              echo "<div class=question id=question> $question </div>";
              $sql = "select max(id) from pages where quiz_id = (SELECT id FROM quizzes WHERE quizzes.name = '$quiz_name');";
              $records = exec_sql_query($db, $sql)->fetchAll();
              foreach ($records as $record){
                $last_page = $record["max(id)"];
              };
              $score=0;
              echo "<div id='score' value=$score <p1> $score </p1></div>";
              if ($last_page == $page_number) {
                // echo "<script> final(); </script>";
                echo "<form method=get action=Result1.html>";

              } else {
                echo "<form method=get id='my_form' action=quiz.php>";
              }
              ?>
              <?php
                echo "<button class='fact_button fact' id='fact_button' value='fact' onclick=checkfact('$answer')>Fact</button>";
                echo "<button class='myth_button myth' id='myth_button' value='myth' onclick=checkmyth('$answer')>Myth</button>";
              ?>
                <?php
                echo "<input type=hidden id=pageid name=pageid value=$page_number> ";
                echo "<input type=hidden id=chooseAQuiz name=chooseAQuiz value=$quiz_name> ";
                echo "<input type=hidden id=currentplace name=currentplace value=$current_place> ";
                ?>
                <?php
                echo "<div id='reply' <p1> $feedback </p1></div>";
                 ?>
                <div id = "correct_pic">
                  <img src = "correct.png" id = "correct">
                </div>
                <div id = "wrong_pic">
                  <img src = "wrong.png" id="wrong">
                </div>
            </div>
          </div>
        </div>
      </div>
      <script>
      function checkfact (answer) {
      $('form').submit( function(event) {
          var formId = this.id,
              form = this;
              factcheck(answer);


          event.preventDefault();

          setTimeout( function () {
              form.submit();
          }, 2000);
      });
    }

    function checkmyth (answer) {
    $('form').submit( function(event) {
        var formId = this.id,
            form = this;
            mythcheck(answer);


        event.preventDefault();

        setTimeout( function () {
            form.submit();
        }, );
    });
  }

      </script>
  </body>

  </html>
