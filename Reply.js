

function factcheck(answer){
  document.getElementById("fact_button").style.visibility="collapse";
  document.getElementById("myth_button").style.visibility="collapse";
  document.getElementById("reply").style.visibility="visible";
  document.getElementById("question").style.visibility = "collapse"
  var count=parseInt(sessionStorage.getItem("count"));
  count=count+1;
  sessionStorage.setItem("count", count);
  if('fact' == answer){
    document.getElementById("correct").style.visibility="visible";
    document.body.style.border="7.5px solid #148a18";
    var score=parseInt(sessionStorage.getItem("score"));
    // if(typeof window.score !== 'undefined'){
    //   window.score=0;
    // }
    // else{
    //     window.score=window.score+1;
    // }
    score=score+1;
    sessionStorage.setItem("score", score);
    final(1);
  }
  else{
    document.getElementById("wrong").style.visibility="visible";
    document.body.style.border="7.5px solid #f11230";
    final(0);
  }
}
function mythcheck(answer){
  document.getElementById("fact_button").style.visibility="collapse";
  document.getElementById("myth_button").style.visibility="collapse";
  document.getElementById("reply").style.visibility="visible";
  document.getElementById("question").style.visibility = "collapse"
  var count=parseInt(sessionStorage.getItem("count"));
  count=count+1;
  sessionStorage.setItem("count", count);
  if('myth' == answer){
    document.getElementById("correct").style.visibility="visible";
    document.body.style.border="7.5px solid #148a18";
    var score=parseInt(sessionStorage.getItem("score"));
    // if(typeof window.score !== 'undefined'){
    //   window.score=0;
    // }
    // else{
    //     window.score=window.score+1;
    // }
    score=score+1;
    sessionStorage.setItem("score", score);
    final(1);

  }
  else{
    document.getElementById("wrong").style.visibility="visible";
    document.body.style.border="7.5px solid #f11230";
    final(0);
  }


//
// var form = document.getElementById("my_form"), button = document.getElementById("fact_button");
// my_form.onsubmit = function() {
//     return false;
// }
//
// var form = document.getElementById("my_form"), button = document.getElementById("myth_button");
// my_form.onsubmit = function() {
//     return false;
// }
//
//
// button.onclick = function() {
//  setTimeout(function() {
//     form.submit();
//  }, 5000);
//    return false;
// }
//
//
// $('form').submit( function(event) {
//     var formId = this.id,
//         form = this;
//     mySpecialFunction(formId);
//
//     event.preventDefault();
//
//     setTimeout( function () {
//         form.submit();
//     }, 300);
// });
}

function final(score){
  // element1 = document.getElementById("score");
  // if(element1 == null)
  // {
  //   document.getElementById("score").value = 0;
  // }
  // else{
  //   document.getElementById("score").value += score;
  // }
  document.getElementById("score").visibility = "hidden";
  document.getElementById("question").visibility = "hidden";
  var score=parseInt(sessionStorage.getItem("score"));
  console.log(score);
  var count=parseInt(sessionStorage.getItem("count"));
  console.log(count);
}
