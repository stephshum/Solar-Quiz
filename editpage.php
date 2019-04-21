<?php

include('includes/init.php');

if (isset($_GET['chooseAQuiz'])) {
  $quiz_id = trim(filter_input(INPUT_GET, 'chooseAQuiz', FILTER_SANITIZE_NUMBER_INT));
} else {
  $sql = 'SELECT id, name FROM quizzes;';
  $records = exec_sql_query($db, $sql)->fetchAll();
  $quiz_id = $records[0]['id'];
}


if (isset($_GET['selectedpage'])) {
  $page_id = trim(filter_input(INPUT_GET, 'selectedpage', FILTER_SANITIZE_NUMBER_INT));
} elseif (isset($_POST['inputtedpage_id'])){
  $page_id = trim(filter_input(INPUT_POST, 'inputtedpage_id', FILTER_SANITIZE_NUMBER_INT));
} else {
  $sql = "SELECT * FROM pages where quiz_id = $quiz_id;";
  $records = exec_sql_query($db, $sql)->fetchAll();
  $page_id = $records[0]['id'];

}
$sql = 'SELECT * FROM pages where id = :page_id;';
$params = array(
  ":page_id" => $page_id,
);
$records = exec_sql_query($db, $sql, $params)->fetchAll();
$selected_question_id = $records[0]['question_id'];
$selected_photo_id = $records[0]['photo_id'];

$sql ="select * from questions where id = $selected_question_id;";
$records = exec_sql_query($db, $sql)->fetchAll();
$selectedquestion = $records[0]['question'];
$selectedanswer = $records[0]['answer'];
$selectedfeedback = $records[0]['feedback'];

$sql = "select * from photos where id = $selected_photo_id;";
$records = exec_sql_query($db, $sql)->fetchAll();
$selectedalt_text = $records[0]['alt_text'];
$selectedfile_ext = $records[0]['file_ext'];


if (isset($_POST['update'])){
  $question = filter_input(INPUT_POST, 'question', FILTER_SANITIZE_STRING);
  $selectedquestion = $question;
  $feedback = filter_input(INPUT_POST, 'feedback', FILTER_SANITIZE_STRING);
  $selectedfeedback = $feedback;
  $answer = filter_input(INPUT_POST, 'answer', FILTER_SANITIZE_STRING);
  $selectedanswer = $answer;
  $inputtedquestionid = filter_input(INPUT_POST, 'inputtedquestionid', FILTER_SANITIZE_STRING);
  $inputtedphoto_id = filter_input(INPUT_POST, 'inputtedphoto_id', FILTER_SANITIZE_STRING);
  $inputtedfile_ext = filter_input(INPUT_POST, 'inputtedfile_ext', FILTER_SANITIZE_STRING);
  $inputtedpage_id = filter_input(INPUT_POST, 'inputtedpage_id', FILTER_SANITIZE_STRING);

  if (isset($_FILES['uploadImage'])) {
    $upload_file = $_FILES['uploadImage'];
    if ($_FILES['uploadImage']['error'] === UPLOAD_ERR_OK){
      $alt_text = filter_input(INPUT_POST, 'alt_text', FILTER_SANITIZE_STRING);
      $selectedalt_text = $alt_text;
      unlink("img/".$inputtedphoto_id.".".$inputtedfile_ext);
      $sql = "DELETE from photos WHERE id = $inputtedphoto_id;";
      exec_sql_query($db, $sql);

      $file_extension = strtolower(pathinfo($upload_file['name'], PATHINFO_EXTENSION));
      $file_name = preg_replace("/[^a-zA-Z0-9]+/", "", (basename($upload_file["name"])));
      $sql = "INSERT INTO photos (file_name, file_ext, alt_text) VALUES (:file_name, :file_extension, :alt_text);";
      $params = array(
        ":file_name" => $file_name,
        ":file_extension" => $file_extension,
        ":alt_text" => $alt_text
      );
      if (exec_sql_query($db, $sql, $params)){
          $file_id = $db->lastInsertId("id");
          move_uploaded_file($upload_file["tmp_name"], GALLERY_UPLOADS_PATH.$file_id.".$file_extension");
          echo("<p>Your file was uploaded!<p>") ;
          $sql = "UPDATE pages set photo_id=:file_id where id = $inputtedpage_id;";
          // $sql = "INSERT INTO pages (question_id, photo_id, quiz_id) VALUES (:question_id, :file_id, :quiz_id);";
          $params = array(
            ":file_id" => $file_id,
          );
          exec_sql_query($db, $sql, $params);
        } else {
          echo("<p>Your file was not uploaded. Try again with a smaller file.</p>") ;
        }



      } else {
        echo("<p>Your file was not uploaded. Try again with a smaller file.</p>") ;
      }
  }
  $sql = "UPDATE questions set question = :question, answer = :answer, feedback = :feedback where id = $inputtedquestionid;";

  $params = array(
    ":question" => $question,
    ":answer" => $answer,
    ":feedback" => $feedback
  );
  // $question_id = $db->lastInsertId("id");
  exec_sql_query($db, $sql, $params);


}

 ?>


<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>Edit Page</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" type="text/css" href="dstyles.css" />
    <script src="main.js"></script>
  </head>
  <body>
    <h1>User Dashboard</h1>
    <form method = 'get' action="editpage.php">
    <?php
      echo "<select class='selectQuiz' name='chooseAQuiz' onchange='if(this.value != $quiz_id) { this.form.submit(); }'>";

        $sql = 'SELECT id, name FROM quizzes;';
        $records = exec_sql_query($db, $sql)->fetchAll();
        foreach ($records as $record) {
          $thisquizid = $record['id'];
          $quizname = $record['name'];
          if ($quiz_id == $thisquizid){
            echo "<option value=$thisquizid selected>$quizname</option>";
          } else {
            echo "<option value=$thisquizid>$quizname</option>";
          }
        }
        ?>
      </select>
    </form>
    <div class="topnav">
      <a class="selectedPage" href="editpage.php">Edit Page</a>
      <a href="add-deletepage.php">Add/Delete Page</a>
    </div>
    <div>
      <form action="editpage.php" method="get">
        <div>
          <div id="pageSelect">
            <h2>Page</h2>
          </div>
          <div class="selectElts">
            <label for="selectPage"></label>
            <?php
            $sql = "select * from pages where quiz_id = $quiz_id;";
            $records = exec_sql_query($db, $sql)->fetchAll();
            foreach ($records as $record){
              $thispage_id = $record['id'];

              $photo_id = $record['photo_id'];
              $sql = "select * from photos where id = $photo_id;";
              $photorecords = exec_sql_query($db, $sql)->fetchAll();
              $file_ext = $photorecords[0]['file_ext'];
              $alt_text = $photorecords[0]['alt_text'];

              $question_id = $record['question_id'];
              $sql = "select * from questions where id = $question_id;";
              $questionrecords = exec_sql_query($db, $sql)->fetchAll();
              $question = $questionrecords[0]['question'];
              if ($thispage_id == $page_id) {

                echo"<input type='radio' name='selectedpage' value=$thispage_id checked='checked' onchange ='if(this.value != $page_id) { this.form.submit(); }'>
                    <img src='img/$photo_id.$file_ext' class=image alt='$alt_text'>
                    <div>$question</div>
                    <br>
                ";

              } else {
                echo"<input type='radio' name='selectedpage' value=$thispage_id onchange ='if(this.value != $page_id) { this.form.submit(); }'>
                    <img src='img/$photo_id.$file_ext' class=image alt='$alt_text'>
                    <div>$question</div>
                    <br>
                ";
              }

            }
             ?>
          </div>
        </div>
      </form>
      <form action="editpage.php" method="post" enctype="multipart/form-data">

          <input type = "hidden" name = "MAX_FILE_SIZE" value = "1000000">
          <div>
            <label for="question">Question</label>
            <br>

            <textarea name="question"><?php echo $selectedquestion; ?></textarea>
          </div>
          <div>
            <label for="factormyth"></label>
            <div>
              <?php
              if ($selectedanswer == "myth"){
                echo '<input type="radio" name = "answer" value="fact" /> Fact';
                echo '<input type="radio" name = "answer" value="myth" checked/> Myth';
              } else {
                echo '<input type="radio" name = "answer" value="fact" checked/> Fact';
                echo '<input type="radio" name = "answer" value="myth" /> Myth';
              }
               ?>
            </div>
            <br>
          </div>
          <div>
            <label for="feedback">Feedback</label>
            <br>
            <textarea name="feedback"><?php echo $selectedfeedback; ?></textarea>
          </div>
            <div>
              <label for="uploadImage"
                >Image (*Note: If no file is selected, current image will remain
                unchanged)
              </label>
              <br>
            </div>
            <br>
            <div>
              <?php
              echo "<input type=hidden id=inputtedquestionid name=inputtedquestionid value=$selected_question_id> ";
              echo "<input type=hidden id=inputtedphoto_id name=inputtedphoto_id value=$selected_photo_id> ";
              echo "<input type=hidden id=inputtedfile_ext name=inputtedfile_ext value=$selectedfile_ext> ";
              echo "<input type=hidden id=inputtedpage_id name=inputtedpage_id value=$page_id> ";

              ?>
              <input
                class="submitImage"
                type="file"
                name="uploadImage"
                accept="image/png, image/jpeg, image/jpg, image/HEIC"
              />
            </div>
            <div>
              <br>
              <label id = "alt_textlabel" for="alt_text">Alt text (image description)</label>
              <textarea name="alt_text"><?php echo $selectedalt_text;?></textarea>
            </div>
          <div>
            <input
              class="saveChanges"
              type="submit"
              name="update"
              value="Save changes"
            />
          </div>
      </form>
    </div>
  </body>
</html>
