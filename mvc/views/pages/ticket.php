<link rel="stylesheet" href="./public/css/ticket.css?v=<?php echo time(); ?>">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<div class="row">
    <div class="col col-lf-6">
        <form action="" method='POST'>
            <div class="form-group">
                <label for="issue"><b>Search:</b> </label>
                <input type="text" class="form-control" id="search" placeholder="Enter word to seach" name='searchname'>
            </div>
            <br>
            <button type="submit" class="btn btn-primary">Search</button>
        </form>
    </div>
    <div class="col col-lf-6">
        <form action="" method='POST'>
            <div class="form-group">
                <label for="issue"><b>Issue:</b> </label>
                <input type="text" class="form-control" id="issue" placeholder="Enter your issue" name='issue'>
            </div>
            <br>
            <button type="submit" class="btn btn-primary">Create</button>
        </form>
    </div>
</div>

<br>

<?php 
  if ( isset($data["qr_res"]) ) {
      ?>

<table class="table table-hover table-striped" id="TicketTable">
    <thead>
        <tr>
            <th scope="col">Number</th>
            <th scope="col">User</th>
            <th scope="col">Issue</th>
            <th scope="col">Date</th>
            <th scope="col">Time</th>
            <th scope="col">Status</th>
            <th scope="col">Action</th>
        </tr>

        <?php
  $i = 1;
  foreach ($data["qr_res"] as $row) {
      $splitTimeStamp = explode(" ",$row['TicketTimestamp']);
      $date = $splitTimeStamp[0];
      $time = $splitTimeStamp[1]; 
      if($row['Status'] == 1) {
        $status = 'Resolved';
      } else {
        $status = 'Unresolved';
      }
      ?>

        <tr>
            <td><?php echo $i?></td>
            <td><?php echo $row['Name']?></td>
            <td><?php echo $row['Issue']?></td>
            <td><?php echo $date?></td>
            <td><?php echo $time?></td>
            <td><?php echo $status?></td>

            <td class="col-3">
                <div class="row">
                    <div class="col col-lg-6">
                        <div class="form-popup" id=<?php echo "form-".$i ?>>
                            <form action="" method="post" class="form-container">
                                <label for="reissue"><b>Issue:</b> </label>
                                <input type="text" class="form-control" id="reissue" value="<?php echo $row['Issue']?>"
                                    name="reissue">
                                <input type="text" class="form-control hide" name="Ticket_ID" id="getid"
                                    value="<?php echo $row['Ticket_ID']?>">
                                <input type="text" class="form-control hide" name="TicketTimestamp" id="tt"
                                    value="<?php echo $row['TicketTimestamp']?>">

                                <label for="status"><b>Status:</b> </label>
                                <input type="text" class="form-control" id="status" value="<?php echo $row['Status']?>"
                                    name="status">
                                <br>
                                <button type="submit" class="btn btn-success">Update</button>
                                <button type="button" class="btn btn-light"
                                    onclick="closeForm(<?php echo $i?>)">Close</button>
                            </form>
                        </div>
                        <button type="button" class="btn btn-success" onclick="openForm(<?php echo $i?>)">EDIT</button>
                    </div>
                    <div class="col col-lg-6">
                        <form action="" method="post">
                            <button type="submit" class="btn btn-danger" name="delete"
                                value="<?php echo $row['Ticket_ID']?>">DELETE</button>
                        </form>
                    </div>
                </div>
            </td>
        </tr>

        <?php
      $i++;      
  }
  ?>
</table>
<?php } ?>

<script src="./public/js/ticket.js?v=<?php echo time(); ?>"></script>