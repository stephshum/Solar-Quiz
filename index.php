<?php
include('includes/init.php');
?>
<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <title>title</title>
  <link rel="stylesheet" type="text/css" href="styles.css">
</head>

<body>
  <div class="row">
    <div class="column">
      <div class="intro_title"> Fact or Myth </div>
      <div class="intro_description"> Are you aware of the common misconceptions regarding solar energy? What is true or false?</div>
      <form method="get" action="quiz.php">
        <button class="intro_button">
          <div class="intro_button_text">Let’s Find Out </div>
        </button>
        <input type="hidden" id="pageid" name="pageid" value="1">
    </form>
    </div>
    <div class="column">
      <img src="img/fact-vs-myth-image.png" class="image" alt="Fact vs Myth">
    </div>
  </div>
</body>

</html>
