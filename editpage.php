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
    <select class="selectQuiz" name="chooseAQuiz">
      <option value="selectOption">-- Select a quiz --</option>
      <option value="thermal">Thermal</option>
      <option value="lighting">Lighting</option>
      <option value="window">Window</option>
      <option value="solar">Solar</option>
      <option value="heating">Heating</option>
    </select>
    <div class="topnav">
      <a class="selectedPage" href="editpage.php">Edit Page</a>
      <a href="add-deletepage.php">Add/Delete Page</a>
    </div>
    <div>
      <form action="???.php" method="post">
        <div>
          <div id="pageSelect">
            <h2>Page</h2>
          </div>
          <div class="selectElts">
            <label for="selectPage"></label>
            <select name="selectPage">
              <option value="selectPage">-- Select a page --</option>
              <option value="p1">p1.jpg</option>
              <option value="p2">p2.jpg</option>
              <option value="p3">p3.jpg</option>
              <option value="p4">p4.jpg</option>
              <option value="p5">p5.jpg</option>
            </select>
          </div>
        </div>

        <div>
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
            <div>
              <label for="uploadImage"
                >Image (*Note: If no file is selected, current image will remain
                unchanged)
              </label>
              <br>
            </div>
            <br />
            <div>
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
              <textarea name="alt_text"></textarea>
            </div>
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
