function create-css() {
  mkdir $1
  touch "$1/styles.css"
  echo "<!DOCTYPE html> 
<html lang=\"en\">
<head>
  <meta charset=\"UTF-8\">
  <title>$1</title>
  <link rel=\"stylesheet\" href=\"styles.css\">
</head>
<body>
</body>
</html>" > "$1/index.html"
  cd $1
  live-server --port=8081
}

function create-js() {
  mkdir $1
  touch "$1/styles.css"
  touch "$1/main.js"
  echo "<!DOCTYPE html> 
<html lang=\"en\">
<head>
  <meta charset=\"UTF-8\">
  <title>$1</title>
  <link rel=\"stylesheet\" href=\"styles.css\">
  <script src=\"main.js\"></script>
</head>
<body>
</body>
</html>" > "$1/index.html"
  cd $1
  live-server --port=8083
}

create-project-help() {
    echo "\n${COLOR_YELLOW}  Create Projects:";
    echo "${COLOR_BLUE}  create-js <app-name> ${COLOR_GREEN}- create js project with name <app-name>"
    echo "${COLOR_BLUE}  create-css <app-name> ${COLOR_GREEN}- create css project with name <app-name>"
}
