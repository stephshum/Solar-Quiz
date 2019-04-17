<?php
include('includes/init.php');

if (isset($_GET['chooseAQuiz'])) {
  $quiz = trim(filter_input(INPUT_GET, 'chooseAQuiz', FILTER_SANITIZE_STRING));
} else {
  $sql = 'SELECT id, name FROM quizzes;';
  $records = exec_sql_query($db, $sql)->fetchAll();
  $quiz = $records[0]['id'];
}



if (isset($_POST['submit'])){
  $question = filter_input(INPUT_POST, 'question', FILTER_SANITIZE_STRING);
  $feedback = filter_input(INPUT_POST, 'feedback', FILTER_SANITIZE_STRING);
  $upload_file = $_FILES['uploadImage'];
  // $sql = "INSERT INTO questions ()"
  if ($_FILES['uploadImage']['error'] === UPLOAD_ERR_OK){
    $file_name = basename($upload_file["name"]);
    $file_extension = strtolower(pathinfo($upload_file['name'], PATHINFO_EXTENSION));
    $sql = "INSERT INTO photos (file_name, file_ext, alt_text) VALUES (:file_name, :file_extension, :file_name);";
    $params = array(
      ":file_name" => $file_name,
      ":file_extension" => $file_extension,
      ":file_name" => $file_name
    );
    if (exec_sql_query($db, $sql, $params)){
        $file_id = $db->lastInsertId("id");
        move_uploaded_file($upload_file["tmp_name"], GALLERY_UPLOADS_PATH.$file_id.".$file_extension");
        record_general_message("Your file was uploaded!") ;
      } else {
        record_general_message("Your file was not uploaded. Try again.") ;
      }
    } else {
      record_general_message("Your file was not uploaded. Try again.") ;
    }

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
    <script src="main.js"></script>
  </head>
  <body>
    <h1>User Dashboard</h1>

    <form method = 'get' action="add-deletepage.php">
    <?php
      echo "<select class='selectQuiz' name='chooseAQuiz' onchange='if(this.value != $quiz) { this.form.submit(); }'>";

        $sql = 'SELECT id, name FROM quizzes;';
        $records = exec_sql_query($db, $sql)->fetchAll();
        foreach ($records as $record) {
          $quizid = $record['id'];
          $quizname = $record['name'];
          if ($quiz == $quizid){
            echo "<option value=$quizid selected>$quizname</option>";
          } else {
            echo "<option value=$quizid>$quizname</option>";
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
              <form name="factormyth" action="" method="post">
              <input type="radio" name = "fact/myth" value="fact" /> Fact
              <input type="radio" name = "fact/myth" value="myth" /> Myth
              </form>
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
            class="saveChanges"
            type="submit"
            name="submit"
            value="Save changes"
            id="submit"
          />
        </div>
      </form>
      <form>
        <div>
          <h3>Delete a Page</h3>
          <div class="selectElts">
            <label for="deletePage"></label>
            <select name="deletePage">
              <option value="selectPage">-- Select a page --</option>
              <option value="p1">p1</option>
              <option value="p2">p2</option>
              <option value="p3">p3</option>
              <option value="p4">p4</option>
              <option value="p5">p5</option>
            </select>
          </div>
          <div>
            <input
              class="saveChanges"
              type="submit"
              name="submit"
              value="Save changes"
              id="submit"
            />
          </div>
        </div>
      </form>
    </div>
  </body>
</html>
