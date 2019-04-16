<?php
include('includes/init.php');

//if a new photo is submitted, add the file to the uploads/photos file, and
//insert it into the photos database
if (isset($_POST['uploadImage'])){
  if (isset($_POST['question'])){
    $question = filter_input(INPUT_POST, 'question', FILTER_SANITIZE_STRING);
  } else {
    $question = "";
  }
  $upload_file = $_FILES['uploadImage'];
  if ($_FILES['uploadImage']['error'] === UPLOAD_ERR_OK){
    $file_name = basename($upload_file["name"]);
    $file_extension = strtolower(pathinfo($upload_file['name'], PATHINFO_EXTENSION));
    $sql = "INSERT INTO photos (file_name, file_ext, alt_text) VALUES (:file_name, :file_ext, :alt_text);";
    $params = array(
      ":file_name" => $file_name,
      ":file_ext" => $file_ext,
      ":alt_text" => $alt_text
  );
  echo 'here';
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
  echo 'lalala';
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
    <select class="selectQuiz" name="chooseAQuiz">
      <?php
      $sql_for_quizzes = 'SELECT name FROM quizzes;';
      $quizzes = exec_sql_query($db, $sql_for_quizzes)->fetchAll();
      foreach ($quizzes as $quiz) {
        $quizname = $quiz['name'];
        echo "<option value=$quizname>$quizname</option>";
      }
      ?>

    </select>
    <div class="topnav">
      <a href="editpage.html">Edit Page</a>
      <a class="selectedPage" href="add-deletepage.html">Add/Delete Page</a>
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
          <br />
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
