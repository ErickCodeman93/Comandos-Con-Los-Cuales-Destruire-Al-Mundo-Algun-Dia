<?php

$servername = "localhost";
$username = "root";
$password = "";
$dbname = '';

$conn = null;

try {
    $conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
    // set the PDO error mode to exception
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
   // echo "Connected successfully"; 
    }
catch(PDOException $e)
    {
    echo "Connection failed: " . $e->getMessage();
    }

$sql = "SELECT 
moodle_estigmas.mdl_forum.name AS curso,
moodle_estigmas.mdl_forum_posts.subject AS asunto,
moodle_estigmas.mdl_forum_posts.message AS mensaje,
concat(moodle_estigmas.mdl_user.firstname, ' ', moodle_estigmas.mdl_user.lastname) AS alumno
FROM 
moodle_estigmas.mdl_forum, 
moodle_estigmas.mdl_forum_discussions, 
moodle_estigmas.mdl_forum_posts, 
moodle_estigmas.mdl_user  
WHERE mdl_forum.id=mdl_forum_discussions.forum 
and 
mdl_forum_discussions.id=mdl_forum_posts.discussion 
and 
mdl_user.id=mdl_forum_discussions.userid;";

$result = $conn->query($sql);

 if( $result -> rowCount() > 0 ){
        $rows = $result -> fetchAll( PDO::FETCH_ASSOC );
      
    $csv = '"curso","asunto","mensaje","alumno"'. PHP_EOL;
    foreach( $rows as &$row ){
        $csv .=
        '"' . trim( $row[ 'curso' ] ). '",' .
        '"' . trim( $row[ 'asunto' ] ). '",' .
        '"' . trim( strip_tags( $row[ 'mensaje' ] ) ). '",' .
        '"' . trim( $row[ 'alumno' ] ). '"' . PHP_EOL;
     } //end foreach
     file_put_contents( '/var/www/html/code/page/mypage/csv/foros.csv', $csv );

    }//end if
    else 
    echo 'error';   