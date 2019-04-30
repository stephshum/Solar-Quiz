<?php
include('includes/init.php');
if (isset($_GET['chooseAQuiz'])) {
  $quiz_id = trim(filter_input(INPUT_GET, 'chooseAQuiz', FILTER_SANITIZE_NUMBER_INT));
} else {
  $sql = 'SELECT id, name FROM quizzes;';
  $records = exec_sql_query($db, $sql)->fetchAll();
  $quiz_id = $records[0]['id'];
}



if (isset($_POST['add'])){
  $question = filter_input(INPUT_POST, 'question', FILTER_SANITIZE_STRING);
  $feedback = filter_input(INPUT_POST, 'feedback', FILTER_SANITIZE_STRING);
  $alt_text = filter_input(INPUT_POST, 'alt_text', FILTER_SANITIZE_STRING);
  $answer = filter_input(INPUT_POST, 'answer', FILTER_SANITIZE_STRING);
  $upload_file = $_FILES['uploadImage'];
  if ($_FILES['uploadImage']['error'] === UPLOAD_ERR_OK){
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
        echo("<p class='alert alert-success' role='alert'>Your file was uploaded!</p>") ;
      } else {
        echo("<p class='alert alert-danger' role='alert'>Your file was not uploaded. Try again with a smaller file.</p>") ;
      }
    $sql = "INSERT INTO questions (question, answer, feedback) VALUES (:question, :answer, :feedback);";
    $params = array(
      ":question" => $question,
      ":answer" => $answer,
      ":feedback" => $feedback
    );
    $question_id = $db->lastInsertId("id");

    exec_sql_query($db, $sql, $params);
    $sql = "INSERT INTO pages (question_id, photo_id, quiz_id) VALUES (:question_id, :file_id, :quiz_id);";
    $params = array(
      ":question_id" => $question_id,
      ":file_id" => $file_id,
      ":quiz_id" => $quiz_id
    );
    exec_sql_query($db, $sql, $params);


    } else {
      echo("<p class='alert alert-danger' role='alert'>Your file was not uploaded. Try again with a smaller file.</p>") ;
    }

}

if (isset($_POST['delete'])){
  $deletedpage = filter_input(INPUT_POST, 'deletedpage', FILTER_SANITIZE_NUMBER_INT);
  $sql = "select * from pages where id = :deletedpage;";
  $params = array(
    ":deletedpage" => $deletedpage,

  );
  $records = exec_sql_query($db, $sql, $params)->fetchAll();
  $question_id = $records[0]['question_id'];
  $sql = "DELETE from questions WHERE id = $question_id;";
  exec_sql_query($db, $sql);

  $photo_id = $records[0]['photo_id'];
  $sql = "select * from photos where id = $photo_id;";
  $records = exec_sql_query($db, $sql)->fetchAll();
  $file_ext = $records[0]['file_ext'];
  unlink("img/".$photo_id.".".$file_ext);
  $sql = "DELETE from photos WHERE id = $photo_id;";
  exec_sql_query($db, $sql);

  $sql = "DELETE from pages WHERE id = $deletedpage;";
  exec_sql_query($db, $sql);

  echo("<p class='alert alert-success' role='alert'>File successfully deleted.</p>") ;

}


?>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>Add/Delete Page</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" type="text/css" href="dstyles.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <script src="main.js">  </script>
  </head>
  <body>
    <h1>User Dashboard</h1>

    <form method = 'get' action="add-deletepage.php">
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
      <a href="editpage.php">Edit Page</a>
      <a class="selectedPage" href="add-deletepage.php">Add/Delete Page</a>
    </div>
    <div>
      <form action="add-deletepage.php" method="post" enctype="multipart/form-data">
        <div>
          <h3>Add a Page</h3>
          <input type = "hidden" name = "MAX_FILE_SIZE" value = "1000000">

          <div>
            <label for="question">Question</label>
            <br />
            <textarea name="question"> </textarea>
          </div>
          <div>
            <label for="factormyth"></label>
            <div>
              <input type="radio" name = "answer" value="fact" /> Fact
              <input type="radio" name = "answer" value="myth" /> Myth
            </div>
            <br>
          </div>
          <div>
            <label for="feedback">Feedback</label>
            <br />
            <textarea name="feedback"> </textarea>
          </div>
          <div id="addPageImageLabel">
            <label for="uploadImage">Image</label>
          </div>
          <input
            type="file"
            name="uploadImage"
            accept="image/png, image/jpeg, image/jpg, image/HEIC"
          />
          <div>
            <br>
            <label id = "alt_textlabel" for="alt_text">Alt text (image description)</label>
            <textarea name="alt_text"></textarea>
          </div>
          <input
            class="saveChanges btn btn-success"
            type="submit"
            name="add"
            value="Add Page"
          />
        </div>
      </form>
        <form onsubmit="return confirm('Are you sure you want to delete this page?');" action="add-deletepage.php" method="post" enctype="multipart/form-data">
          <h3>Delete a Page</h3>
          <div class="selectElts">
            <label for="deletePage"></label>

                <?php
                $sql = "select * from pages where quiz_id = $quiz_id;";
                $records = exec_sql_query($db, $sql)->fetchAll();
                foreach ($records as $record){
                  $page_id = $record['id'];

                  $photo_id = $record['photo_id'];
                  $sql = "select * from photos where id = $photo_id;";
                  $photorecords = exec_sql_query($db, $sql)->fetchAll();
                  $file_ext = $photorecords[0]['file_ext'];
                  $alt_text = $photorecords[0]['alt_text'];

                  $question_id = $record['question_id'];
                  $sql = "select * from questions where id = $question_id;";
                  $questionrecords = exec_sql_query($db, $sql)->fetchAll();
                  $question = $questionrecords[0]['question'];
                  echo"<input type='radio' name='deletedpage' value=$page_id>
                      <img src='img/$photo_id.$file_ext' class=image alt='$alt_text'>
                      <div>$question</div>
                      <br>
                  ";
                }

                 ?>



          </div>
          <div>
            <input
              class="saveChanges btn btn-danger"
              type="submit"
              name="delete"
              value="Delete Page"
            />
          </div>
        </div>
      </form>
    </div>
  </body>
</html>
