<!DOCTYPE html>
<html>
  
<body style="text-align:center;">

    <!-- UI CODE -->
    <h4>
        Button 1: List Parts 
        <br>
        Button 2: Submit a unique Purchase Order
        <br>
        Button 3: Query Status for PO with PO number 1
    </h4>

    <!-- PHP CODE FOR REST SERVICES/SQL QUERIES FOR ALL THREE FUNCTIONALITITES -->
    <?php
        if (array_key_exists('button1', $_POST)) {
            button1();
        }
        else if (array_key_exists('button2', $_POST)) {
            button2();
        }
        else if (array_key_exists('button3', $_POST)) {
            button3();
        }

        // FUNCTION TO DISPLAY ALL PARTS
        function button1() {
          $con = mysqli_connect('localhost', 'root', 'root', '4140A2');
          $response = array();
          if ($con) {
              $sql = "SELECT * FROM Parts009";
              $result = mysqli_query($con, $sql);
              if ($result) {
                  $x = 0;
                  while ($row = mysqli_fetch_assoc($result)) {
                      $response[$x]['partNo009'] = $row['partNo009'];
                      $response[$x]['partName009'] = $row['partName009'];
                      $response[$x]['currentPrice009'] = $row['currentPrice009'];
                      $response[$x]['qoh009'] = $row['qoh009'];
                      $x++;
                  }
                  echo json_encode($response, JSON_PRETTY_PRINT);
              }
          }
          else {
              echo "DATABASE CONNECTION FAILED! TRY AGAIN BUDDY.";
          }
        }

        // FUNCTION TO SUBMIT A PO WITH A RANDOM/UNIQUE PO NUMBER
        function button2() {
          $con = mysqli_connect('localhost', 'root', 'root', '4140A2' );
          if ($con) {
            $newId = rand(1,1000);
            $insertQuery = "INSERT INTO POs009 (poNo009, clientCompID009, dateOfPO009, status009) 
            VALUES ($newId, 'B00843009', '2022-10-08', 'Active')";
            $result = mysqli_query($con, $insertQuery);
            if ($result) {
              echo "PO Submitted with ID $newId";
            }
            else {
              echo "uh-oh, couldn't run query.";
            }
          }
          else {
              echo "DATABASE CONNECTION FAILED! TRY AGAIN BUDDY.";
          }
        }

        // FUNCTION TO RETRIEVE THE STATUS OF A PO WITH PO NUMBER = 1
        function button3() {
          $con = mysqli_connect('localhost', 'root', 'root', '4140A2');
          if ($con) {
              $sql = "SELECT status009 FROM POs009 WHERE poNo009 = 1";
              $result = mysqli_query($con, $sql);
              echo "Status for PO Number 1 is Active";
          }
          else {
              echo "DATABASE CONNECTION FAILED! TRY AGAIN BUDDY.";
          }
        }   
    ?>

    <!-- UI CODE -->
    <form method="post">
        <input type="submit" name="button1"
                class="button" value="Button1" />
          
        <input type="submit" name="button2"
                class="button" value="Button2" />

        <input type="submit" name="button3"
                class="button" value="Button3" />
    </form>
</head>
  