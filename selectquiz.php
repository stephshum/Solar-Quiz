<?php
include('includes/init.php');
?>
<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <title>Fact or Myth</title>
  <link rel="stylesheet" type="text/css" href="styles.css">
  <script>
    function autoSubmit()
    {
        var formObject = document.forms['quizform'];
        formObject.submit();
    }
</script>
</head>
<body>
  <div class="formgrouping">
  <div class="selectquiztitle"> Choose a quiz category </div> </br>
  <form method="get" action="quiz.php" id="quizform" name='quizform'>
    <div class="topicrow">
    <label>
      <input type="radio" name="chooseAQuiz" value="solar" onchange ='autoSubmit()'>
      <img class="quizselect" src="img/Category_DIY.png">
    </label>
    <label>
      <input type="radio" name="chooseAQuiz" value="solar" onchange ='autoSubmit()'>
      <img class="quizselect" src="img/Category_Insulation.png">
    </label>
    <label>
      <input type="radio" name="chooseAQuiz" value="solar" onchange ='autoSubmit()'>
      <img class="quizselect" src="img/Category_Lighting.png">
    </label>
  </div>
  <div class="topicrow">
    <label>
      <input type="radio" name="chooseAQuiz" value="solar" onchange ='autoSubmit()'>
      <img class="quizselect" src="img/Category_RenewableHeating.png">
    </label>
    <label>
      <input type="radio" name="chooseAQuiz" value="solar" onchange ='autoSubmit()'>
      <img class="quizselect" src="img/Category_Solar.png">
    </label>
    <label>
      <input type="radio" name="chooseAQuiz" value="window" onchange ='autoSubmit()'>
      <img class="quizselect" src="img/Category_Windows.png">
    </label>
  </form>
</div>
</body>