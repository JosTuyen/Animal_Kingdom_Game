<?php
  //create connection
  $connec = mysqli_connect('localhost', 'root', '123abc', 'cratedb');

  //Check connection
  if (mysqli_connect_errno()) {
    //Connection fail
    echo 'Failed to connect to Cratedb'. mysqli_connect_errno();
  }

  $puzzQuery = 'SELECT * FROM puzzles';
  $userQuery = 'SELECT * FROM users';

  $puzzResult = mysqli_query($connec, $puzzQuery);
  $userResult = mysqli_query($connec, $userQuery);

  $puzzData = mysqli_fetch_all($puzzResult, MYSQLI_ASSOC);
  $userData = mysqli_fetch_all($userResult, MYSQLI_ASSOC);

  mysqli_free_result($puzzResult);
  mysqli_free_result($userResult);

  mysqli_close($connec);
?>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Show the MySQL Data List</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
    rel="stylesheet" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
    crossorigin="anonymous">
    <link rel="stylesheet" href="css/styles.css?v=1.0">
  </head>
  <body>
    <div class="container">
      <h1>Puzzle List</h1>
      <table class="table">
        <thead class="thead-dark">
          <tr>
            <th>Seedlev</th>
            <th>Puzzle Name</th>
            <th>Name</th>
            <th>Recname</th>
            <th>Score</th>
            <th>When</th>
          </tr>
        </thead>
        <tbody>
          <?php foreach ($puzzData as $row) :?>
          <tr>
            <th scope="row"><?php echo $row['seedlev']; ?></th>
            <td><?php echo $row['puzname']; ?></td>
            <td><?php echo $row['name']; ?></td>
            <td><?php echo $row['recname']; ?></td>
            <td><?php echo $row['score']; ?></td>
            <td><?php echo $row['when']; ?></td>
          </tr>
          <?php endforeach; ?>
        </tbody>
      </table>
      <h1>User List</h1>
      <table class="table">
        <thead class="thead-dark">
          <tr>
            <th>Tag</th>
            <th>Info</th>
            <th>Password</th>
            <th>Email</th>
          </tr>
        </thead>
        <tbody>
          <?php foreach ($userData as $row) :?>
          <tr>
            <td><?php echo $row['tag']; ?></td>
            <td><?php echo $row['info']; ?></td>
            <td><?php echo $row['password']; ?></td>
            <td><?php echo $row['email']; ?></td>
          </tr>
          <?php endforeach; ?>
        </tbody>
      </table>
    </div>
  </body>
</html>
