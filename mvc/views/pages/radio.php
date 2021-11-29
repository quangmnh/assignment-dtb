<link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<div class="row">
  <div class="col"><h3>Manage Radio channel</h3></div>
  <div class="col">
    <div class="text-end">
      <!-- Button trigger modal -->
      <button
        type="button"
        class="btn btn-primary"
        data-mdb-toggle="modal"
        data-mdb-target="#createRadioModal"
      >
        Create New Radio Channel
      </button>
    </div>
  </div>
</div>
<?php
  if ( isset($data["radio_res"]) ) {
    echo '<div class="table-responsive">';
    echo '<table class="table table-hover table-striped">';
    echo '<thead>';
    echo '<tr>';
    echo '<th scope="col">Radio channel</th>';
    echo '<th scope="col">Frequency</th>';
    echo '<th scope="col">Producer</th>';
    echo '<th scope="col">Action</th>';
    echo '</tr>';
    echo '</thead>';
    echo '<tbody>';
    foreach ($data["radio_res"] as $row) {
        echo '<tr>';
        
        echo '<td>'.$row['Name'].'</td>';
        echo '<td>'.$row['Frequency'].'</td>';
        echo '<td>'.$row['Producer'].'</td>';
        echo '<td class="col-3">';
        echo '<input id="hidden-radio-id" type="hidden" value="'.$row["Radio_ID"].'" />';
        echo '<input id="hidden-radio-name" type="hidden" value="'.$row["Name"].'" />';
        echo '<input id="hidden-radio-frequency" type="hidden" value="'.$row["Frequency"].'" />';
        echo '<input id="hidden-radio-r-producer-id" type="hidden" value="'.$row["R_Producer_ID"].'" />';
        echo '<a data-mdb-toggle="modal" class="edit-radio-btn" data-mdb-target="#editRadioModal"><i class="fas fa-pencil-alt text-warning fa-1x mx-2"></i></a>';
        echo '<a data-mdb-toggle="modal" class="del-radio-btn" data-mdb-target="#deleteRadioModal"><i class="fas fa-trash-alt text-danger fa-1x mx-2"></i></a>';
        echo '</td>';
        echo '</tr>';
    }
    echo '</ tbody>';
    echo '</table>';
    echo '</div>';
  }
?>

<div class="row">
  <div class="col-lg-3 col-sm-6">
      <button
        type="button"
        class="btn btn-secondary"
        data-mdb-toggle="collapse"
        data-mdb-target="#genreCollapse"
        aria-expanded="true"
      >
        Genre List
      </button>
  </div>
  <div class="col-lg-3 col-sm-6">
      <button
        type="button"
        class="btn btn-secondary"
        data-mdb-toggle="collapse"
        data-mdb-target="#scheduleCollapse"
        aria-expanded="true"
      >
        Schedule List
      </button>
  </div>  
</div>

<div class="collapse mt-3" id="genreCollapse">
<div class="row">
    <div class="col"><h5>Manage Radio Genre</h5></div>
    <div class="col">
      <div class="text-end">
        <!-- Button trigger modal -->
        <button
          type="button"
          class="btn btn-primary"
          data-mdb-toggle="modal"
          data-mdb-target="#createGenreModal"
        >
          Add Genre
        </button>
      </div>
    </div>
  </div>

<?php
  if ( isset($data["genre_res"]) ) {
    echo '<div class="table-responsive">';
    echo '<table class="table table-hover table-striped">';
    echo '<thead>';
    echo '<tr>';
    echo '<th scope="col">Radio channel</th>';
    echo '<th scope="col">Genre</th>';
    echo '<th scope="col">Action</th>';
    echo '</tr>';
    echo '</thead>';
    echo '<tbody>';
    foreach ($data["genre_res"] as $row) {
        echo '<tr>';
        echo '<td>'.$row['Name'].'</td>';
        echo '<td>'.$row['Genre'].'</td>';
        echo '<td class="col-3">';
        echo '<input id="hidden-rg-radio-id" type="hidden" value="'.$row["RG_Radio_ID"].'" />';
        echo '<input id="hidden-radio-name" type="hidden" value="'.$row["Name"].'" />';
        echo '<input id="hidden-radio-genre" type="hidden" value="'.$row["Genre"].'" />';
        // echo '<a data-mdb-toggle="modal" class="edit-radio-btn" data-mdb-target="#editGenreModal"><i class="fas fa-pencil-alt text-warning fa-1x mx-2"></i></a>';
        echo '<a data-mdb-toggle="modal" class="del-genre-btn" data-mdb-target="#deleteGenreModal"><i class="fas fa-trash-alt text-danger fa-1x mx-2"></i></a>';
        echo '</td>';        
        echo '</tr>';
    }
    echo '</ tbody>';
    echo '</table>';
    echo '</div>';
  }
?>
</div>

<div class="collapse mt-3" id="scheduleCollapse">
  <div class="row">
    <div class="col"><h5>Manage Radio schedule</h5></div>
    <div class="col">
      <div class="text-end">
        <!-- Button trigger modal -->
        <button
          type="button"
          class="btn btn-primary"
          data-mdb-toggle="modal"
          data-mdb-target="#createScheduleModal"
        >
          Add Schedule
        </button>
      </div>
    </div>
  </div>

<form action="./radio" method="POST">
  <div class="my-2 row">
    <div class="col-4">
      <?php
        if ( isset($data["R_radio_res"]) ) {
          echo '<select class="form-select mb-3" id="RG_Radio_ID" aria-label="categorySelect" name="filter_sched_Radio_ID">';
          foreach ($data["R_radio_res"] as $row) {
            echo '<option value="'.$row['Radio_ID'].'">'.$row['Name'].'</option>';
          }
          echo "</select>";
        }
      ?>
    </div>
    <div class="col-4">
      <button type="submit" class="btn btn-primary">Go</button>
    </div>
  </div>
</form>
<div class="col-4">
  <a href="./radio" class=""><button class="btn btn-primary">Reset</button></a>
</div>

<?php
  if ( isset($data["schedule_res"]) ) {
    echo '<div class="table-responsive">';
    echo '<table class="table table-hover table-striped">';
    echo '<thead>';
    echo '<tr>';
    echo '<th scope="col">Radio channel</th>';
    echo '<th scope="col">Date</th>';
    echo '<th scope="col">Time Start</th>';
    echo '<th scope="col">Time End</th>';
    echo '<th scope="col">Languages</th>';
    echo '<th scope="col">Action</th>';
    echo '</tr>';
    echo '</thead>';
    echo '<tbody>';
    foreach ($data["schedule_res"] as $row) {
        echo '<tr>';
        echo '<td>'.$row['Name'].'</td>';
        echo '<td>'.$row['Date'].'</td>';
        echo '<td>'.$row['TimeStart'].'</td>';
        echo '<td>'.$row['TimeEnd'].'</td>';
        echo '<td>'.$row['Languages'].'</td>';
        echo '<td class="col-3">';
        echo '<input id="hidden-rs-radio-id" type="hidden" value="'.$row["RS_Radio_ID"].'" />';
        echo '<input id="hidden-radio-name" type="hidden" value="'.$row["Name"].'" />';
        echo '<input id="hidden-schedule-time-start" type="hidden" value="'.$row["TimeStart"].'" />';
        echo '<input id="hidden-schedule-time-end" type="hidden" value="'.$row["TimeEnd"].'" />';
        echo '<input id="hidden-schedule-date" type="hidden" value="'.$row["Date"].'" />';
        echo '<input id="hidden-schedule-languages" type="hidden" value="'.$row["Languages"].'" />';
        
        echo '<a data-mdb-toggle="modal" class="del-schedule-btn" data-mdb-target="#deleteScheduleModal"><i class="fas fa-trash-alt text-danger fa-1x mx-2"></i></a>';
        echo '</td>';
        echo '</tr>';
    }
    echo '</ tbody>';
    echo '</table>';
    echo '</div>';
  }
?>
</div>

<div class="row mt-5">
  <div class="col"><h3>Manage Producer</h3></div>
  <div class="col">
    <div class="text-end">
      <!-- Button trigger modal -->
      <button
        type="button"
        class="btn btn-primary"
        data-mdb-toggle="modal"
        data-mdb-target="#createProducerModal"
      >
        Create New Producer
      </button>
    </div>
</div>

<?php
  if ( isset($data["producer_res"]) ) {
    echo '<div class="table-responsive">';
    echo '<table class="table table-hover table-striped">';
    echo '<thead>';
    echo '<tr>';
    echo '<th scope="col">Producer</th>';
    echo '<th scope="col">Time Start</th>';
    echo '<th scope="col">Time End</th>';
    echo '<th scope="col">Cost</th>';
    echo '<th scope="col">Action</th>';
    echo '</tr>';
    echo '</thead>';
    echo '<tbody>';
    foreach ($data["producer_res"] as $row) {
      echo '<tr>';
      echo '<td>'.$row['Name'].'</td>';
      echo '<td>'.date('m/d/Y', strtotime($row["TimeStart"])).'</td>';
      echo '<td>'.date('m/d/Y', strtotime($row["TimeEnd"])).'</td>';
      echo '<td>'.$row['Cost'].'</td>';
      echo '<td class="col-3">';
      echo '<input id="hidden-producer-name" type="hidden" value="'.$row["Name"].'" />';
      echo '<input id="hidden-producer-time-start" type="hidden" value="'.date('m/d/Y', strtotime($row["TimeStart"])).'" />';
      echo '<input id="hidden-producer-time-end" type="hidden" value="'.date('m/d/Y', strtotime($row["TimeEnd"])).'" />';
      echo '<input id="hidden-producer-cost" type="hidden" value="'.$row["Cost"].'" />';
      echo '<input id="hidden-producer-address" type="hidden" value="'.$row["Address"].'" />';
      echo '<input id="hidden-producer-phonenumber" type="hidden" value="'.$row["PhoneNumber"].'" />';
      echo '<input id="hidden-producer-id" type="hidden" value="'.$row["Producer_ID"].'" />';
      echo '<a data-mdb-toggle="modal" class="edit-producer-btn" data-mdb-target="#editProducerModal"><i class="fas fa-pencil-alt text-warning fa-1x mx-2"></i></a>';
      echo '<a data-mdb-toggle="modal" class="del-producer-btn" data-mdb-target="#deleteProducerModal"><i class="fas fa-trash-alt text-danger fa-1x mx-2"></i></a>';
      echo '</td>';
      echo '</tr>';
    }
    echo '</ tbody>';
    echo '</table>';
    echo '</div>';
  }
?>



<!-- Create Radio Modal -->
<div
  class="modal fade"
  id="createRadioModal"
  tabindex="-1"
  aria-labelledby="createRadioModalLabel"
  aria-hidden="true"
>
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="createRadioModalLabel">Create new radio channel</h5>
        <button
          type="button"
          class="btn-close"
          data-mdb-dismiss="modal"
          aria-label="Close"
        ></button>
      </div>
      <form action="./radio/ad_add_radio" method="post" id="form-admin-add-radio">
        <div class="modal-body">
          <div class="form-outline mb-3">
            <input required type="text" id="radioName" name="radioName" class="form-control" />
            <label class="form-label" for="radioName">Name</label>
          </div>
          <?php
            if ( isset($data["producer_res"]) ) {
              echo '<select class="form-select mb-3" id="radioProducer" aria-label="categorySelect" name="radioProducer">';
              foreach ($data["producer_res"] as $row) {
                echo '<option value="'.$row['Producer_ID'].'">'.$row['Name'].'</option>';
              }
              echo "</select>";
            }
          ?>
          <div class="form-outline mb-3">
            <input required type="number" step="0.1" min="87.5" max="108" id="radioFrequency" name="radioFrequency" class="form-control" />
            <label class="form-label" for="radioFrequency">Frequency</label>
          </div>
        </div>

        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-mdb-dismiss="modal">
            Close
          </button>
          <button type="submit" class="btn btn-primary">Create</button>
        </div>
      </form>
      

    </div>
  </div>
</div>


<!-- Edit Radio Modal -->
<div
  class="modal fade"
  id="editRadioModal"
  tabindex="-1"
  aria-labelledby="editRadioModalLabel"
  aria-hidden="true"
>
  <div class="modal-dialog">
    <div class="modal-content">

      <div class="modal-header">
        <h5 class="modal-title" id="editRadioModalLabel">Edit Radio</h5>
        <button
          type="button"
          class="btn-close"
          data-mdb-dismiss="modal"
          aria-label="Close"
        ></button>
      </div>
      <form action="./radio/ad_edit_radio" method="post" id="form-admin-add-radio">
      <input type="hidden" id="radioID-edit" name="radioID-edit" />
        <div class="modal-body">
          <div class="form-outline mb-3">
            <input type="text" id="radioName1" name="radioName1"  class="form-control" />
            <label class="form-label" for="radioName1">Name</label>
          </div>
          <div class="form-outline mb-3">
            <input type="number" step="0.1" min="87.5" max="108" id="radioFrequency1" name="radioFrequency1" class="form-control" />
            <label class="form-label" for="radioFrequency">Frequency</label>
          </div>
        </div>
      

      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-mdb-dismiss="modal">
          Close
        </button>
        <button type="submit" class="btn btn-primary">Save changes</button>
      </div>
      </form>
    </div>
  </div>
</div>


<!-- Delete Radio Modal -->
<div
  class="modal fade"
  id="deleteRadioModal"
  tabindex="-1"
  aria-labelledby="deleteModalLabel"
  aria-hidden="true"
>
  <div class="modal-dialog">
    <div class="modal-content">

      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Delete Radio</h5>
        <button
          type="button"
          class="btn-close"
          data-mdb-dismiss="modal"
          aria-label="Close"
        ></button>
      </div>
      <form method="post" action="./radio/ad_delete_radio" id="form-delete-radio">
      <input type="hidden" id="radioID-delete" name="radioID-delete" />
      <div class="modal-body">
        <p>Are you sure you want to delete this record?</p>
        <p class="text-warning"><small>This action cannot be undone.</small></p>
      </div>

      <div class="modal-footer">
        <button type="button" class="btn btn-white" data-mdb-dismiss="modal">
          Close
        </button>
        <button type="submit" class="btn btn-danger">Delete</button>
      </div>
      </form>
    </div>
  </div>
</div>



<!-- Create Producer Modal -->
<div
  class="modal fade"
  id="createProducerModal"
  tabindex="-1"
  aria-labelledby="createProducerModalLabel"
  aria-hidden="true"
>
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="createProducerModalLabel">Create New Producer</h5>
        <button
          type="button"
          class="btn-close"
          data-mdb-dismiss="modal"
          aria-label="Close"
        ></button>
      </div>
      <form action="./radio/ad_add_producer" method="post" id="form-admin-add-producer">
        <div class="modal-body">
          <div class="form-outline mb-3">
            <input required type="text" id="producerName" name="producerName" class="form-control" />
            <label class="form-label" for="producerName">Name</label>
          </div>
          <div class="form-outline mb-3">
            <input type="text" id="producerAddress" name="producerAddress" class="form-control" />
            <label class="form-label" for="producerAddress">Address</label>
          </div>
          <div class="form-outline mb-3">
            <input type="tel" pattern="[0-9]{3}.[0-9]{3}.[0-9]{4}" id="producerPhoneNumber" name="producerPhoneNumber" class="form-control" />
            <label class="form-label" for="producerPhoneNumber">Phone Number</label>
          </div>
          Time Start
          <div class="form-outline mb-3">
            <input required type="text" id="from-producer" name="producerTimeStart" class="form-control" />
            <!-- <label class="form-label" for="producerTimeStart">Time Start</label> -->
          </div>
          Time End
          <div class="form-outline mb-3">
            <input required type="text" id="to-producer" name="producerTimeEnd" class="form-control" />
            <!-- <label class="form-label" for="producerTo">Time End</label> -->
          </div>
          <div class="form-outline mb-3">
            <input required type="number" min="100000" max="1000000000" id="producerCost" name="producerCost" class="form-control" />
            <label class="form-label" for="producerCost">Cost</label>
          </div>
        </div>

        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-mdb-dismiss="modal">
            Close
          </button>
          <button type="submit" class="btn btn-primary">Create</button>
        </div>
      </form>
      

    </div>
  </div>
</div>

<!-- Edit Producer Modal -->
<div
  class="modal fade"
  id="editProducerModal"
  tabindex="-1"
  aria-labelledby="editProducerModalLabel"
  aria-hidden="true"
>
  <div class="modal-dialog">
    <div class="modal-content">

      <div class="modal-header">
        <h5 class="modal-title" id="editProducerModalLabel">Edit Producer</h5>
        <button
          type="button"
          class="btn-close"
          data-mdb-dismiss="modal"
          aria-label="Close"
        ></button>
      </div>
      <form action="./radio/ad_edit_producer" method="post" id="form-admin-edit-producer">
      <input type="hidden" id="producerID-edit" name="producerID-edit" />
      <div class="modal-body">
          <div class="form-outline mb-3">
            <input type="text" id="producerName1" name="producerName1" class="form-control" />
            <label class="form-label" for="producerName1">Name</label>
          </div>
          <div class="form-outline mb-3">
            <input type="text" id="producerAddress1" name="producerAddress1" class="form-control" />
            <label class="form-label" for="producerAddress1">Address</label>
          </div>
          <div class="form-outline mb-3">
            <input type="tel" pattern="[0-9]{3}.[0-9]{3}.[0-9]{4}" id="producerPhoneNumber1" name="producerPhoneNumber1" class="form-control" />
            <label class="form-label" for="producerPhoneNumber1">Phone Number</label>
          </div>
          Time Start
          <div class="form-outline mb-3">
            <input type="text" id="from-producer1" name="producerTimeStart1" class="form-control" />
            <!-- <label class="form-label" for="producerTimeStart">Time Start</label> -->
          </div>
          Time End
          <div class="form-outline mb-3">
            <input type="text" id="to-producer1" name="producerTimeEnd1" class="form-control" />
            <!-- <label class="form-label" for="producerTo">Time End</label> -->
          </div>
          <div class="form-outline mb-3">
            <input type="number" min="100000" max="1000000000" id="producerCost1" name="producerCost1" class="form-control" />
            <label class="form-label" for="producerCost1">Cost</label>
          </div>
        </div>      

      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-mdb-dismiss="modal">
          Close
        </button>
        <button type="submit" class="btn btn-primary">Save changes</button>
      </div>
      </form>
    </div>
  </div>
</div>


<!-- Delete Producer Modal -->
<div
  class="modal fade"
  id="deleteProducerModal"
  tabindex="-1"
  aria-labelledby="deleteProducerModalLabel"
  aria-hidden="true"
>
  <div class="modal-dialog">
    <div class="modal-content">

      <div class="modal-header">
        <h5 class="modal-title" id="deleteProducerModalLabel">Delete producer</h5>
        <button
          type="button"
          class="btn-close"
          data-mdb-dismiss="modal"
          aria-label="Close"
        ></button>
      </div>
      <form method="post" action="./radio/ad_delete_producer" id="form-delete-producer">
      <input type="hidden" id="producerID-delete" name="producerID-delete" />
      <div class="modal-body">
        <p>Are you sure you want to delete this record?</p>
        <p class="text-warning"><small>This action cannot be undone.</small></p>
      </div>

      <div class="modal-footer">
        <button type="button" class="btn btn-white" data-mdb-dismiss="modal">
          Close
        </button>
        <button type="submit" class="btn btn-danger">Delete</button>
      </div>
      </form>
    </div>
  </div>
</div>


<!-- Create Genre Modal -->
<div
  class="modal fade"
  id="createGenreModal"
  tabindex="-1"
  aria-labelledby="createGenreModalLabel"
  aria-hidden="true"
>
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="createGenreModalLabel">Create Genre</h5>
        <button
          type="button"
          class="btn-close"
          data-mdb-dismiss="modal"
          aria-label="Close"
        ></button>
      </div>
      <form action="./radio/ad_add_genre" method="post" id="form-admin-add-radio">
        <div class="modal-body">
          <?php
            if ( isset($data["R_radio_res"]) ) {
              echo '<select class="form-select mb-3" id="RG_Radio_ID" aria-label="categorySelect" name="RG_Radio_ID">';
              foreach ($data["R_radio_res"] as $row) {
                echo '<option value="'.$row['Radio_ID'].'">'.$row['Name'].'</option>';
              }
              echo "</select>";
            }
          ?>
          <div class="form-outline mb-3">
            <input required type="text" id="radioGenre" name="radioGenre" class="form-control" />
            <label class="form-label" for="radioGenre">Genre</label>
          </div>
        </div>

        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-mdb-dismiss="modal">
            Close
          </button>
          <button type="submit" class="btn btn-primary">Create</button>
        </div>
      </form>
      

    </div>
  </div>
</div>


<!-- Delete Genre Modal -->
<div
  class="modal fade"
  id="deleteGenreModal"
  tabindex="-1"
  aria-labelledby="deleteGenreModalLabel"
  aria-hidden="true"
>
  <div class="modal-dialog">
    <div class="modal-content">

      <div class="modal-header">
        <h5 class="modal-title" id="deleteGenreModalLabel">Delete Genre</h5>
        <button
          type="button"
          class="btn-close"
          data-mdb-dismiss="modal"
          aria-label="Close"
        ></button>
      </div>
      <form method="post" action="./radio/ad_delete_genre" id="form-delete-genre">
      <input type="hidden" id="RGradioID-delete" name="RGradioID-delete" />
      <input type="hidden" id="genre-delete" name="genre-delete" />
      <div class="modal-body">
        <p>Are you sure you want to delete this record?</p>
        <p class="text-warning"><small>This action cannot be undone.</small></p>
      </div>

      <div class="modal-footer">
        <button type="button" class="btn btn-white" data-mdb-dismiss="modal">
          Close
        </button>
        <button type="submit" class="btn btn-danger">Delete</button>
      </div>
      </form>
    </div>
  </div>
</div>


<!-- Delete Genre Modal -->
<div
  class="modal fade"
  id="deleteScheduleModal"
  tabindex="-1"
  aria-labelledby="deleteScheduleModalLabel"
  aria-hidden="true"
>
  <div class="modal-dialog">
    <div class="modal-content">

      <div class="modal-header">
        <h5 class="modal-title" id="deleteScheduleModalLabel">Delete Schedule</h5>
        <button
          type="button"
          class="btn-close"
          data-mdb-dismiss="modal"
          aria-label="Close"
        ></button>
      </div>
      <form method="post" action="./radio/ad_delete_schedule" id="form-delete-schedule">
      <input type="hidden" id="RSradioID-delete" name="RSradioID-delete" />
      <input type="hidden" id="date-delete" name="date-delete" />
      <input type="hidden" id="timeStart-delete" name="timeStart-delete" />
      <input type="hidden" id="timeEnd-delete" name="timeEnd-delete" />
      <input type="hidden" id="languages-delete" name="languages-delete" />
      <div class="modal-body">
        <p>Are you sure you want to delete this record?</p>
        <p class="text-warning"><small>This action cannot be undone.</small></p>
      </div>

      <div class="modal-footer">
        <button type="button" class="btn btn-white" data-mdb-dismiss="modal">
          Close
        </button>
        <button type="submit" class="btn btn-danger">Delete</button>
      </div>
      </form>
    </div>
  </div>
</div>

<!-- Create Schedule Modal -->
<div
  class="modal fade"
  id="createScheduleModal"
  tabindex="-1"
  aria-labelledby="createScheduleModalLabel"
  aria-hidden="true"
>
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="createScheduleModalLabel">Create Schedule</h5>
        <button
          type="button"
          class="btn-close"
          data-mdb-dismiss="modal"
          aria-label="Close"
        ></button>
      </div>
      <form action="./radio/ad_add_schedule" method="post" id="form-admin-add-schedule">
        <div class="modal-body">
          <?php
            if ( isset($data["R_radio_res"]) ) {
              echo '<select class="form-select mb-3" id="RS_Radio_ID" aria-label="categorySelect" name="RS_Radio_ID">';
              foreach ($data["R_radio_res"] as $row) {
                echo '<option value="'.$row['Radio_ID'].'">'.$row['Name'].'</option>';
              }
              echo "</select>";
            }
          ?>
          Date
          <div class="form-outline mb-3">
            <input required type="text" id="scheduleDate" name="scheduleDate" class="form-control" />
          </div>
          <div class="form-outline mb-3">
            <input required type="number" min="0" max="23" value="0" id="scheduleTimeStart" name="scheduleTimeStart" class="form-control" />
            <label class="form-label" for="scheduleTimeStart">Time Start (Hour)</label>
          </div>
          <div class="form-outline mb-3">
            <input required type="number" min="0" max="23" value="23" id="scheduleTimeEnd" name="scheduleTimeEnd" class="form-control" />
            <label class="form-label" for="radioGenre">Time End (Hour)</label>
          </div>
          <div class="form-outline mb-3">
            <input required type="text" maxlength="2" id="scheduleLanguages" name="scheduleLanguages" class="form-control" />
            <label class="form-label" for="scheduleLanguages">Languages</label>
          </div>
        </div>

        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-mdb-dismiss="modal">
            Close
          </button>
          <button type="submit" class="btn btn-primary">Create</button>
        </div>
      </form>
      

    </div>
  </div>
</div>


<!-- Delete Genre Modal -->
<div
  class="modal fade"
  id="deleteGenreModal"
  tabindex="-1"
  aria-labelledby="deleteGenreModalLabel"
  aria-hidden="true"
>
  <div class="modal-dialog">
    <div class="modal-content">

      <div class="modal-header">
        <h5 class="modal-title" id="deleteGenreModalLabel">Delete Schedule</h5>
        <button
          type="button"
          class="btn-close"
          data-mdb-dismiss="modal"
          aria-label="Close"
        ></button>
      </div>
      <form method="post" action="./radio/ad_delete_genre" id="form-delete-genre">
      <input type="hidden" id="RGradioID-delete" name="RGradioID-delete" />
      <input type="hidden" id="genre-delete" name="genre-delete" />
      <div class="modal-body">
        <p>Are you sure you want to delete this record?</p>
        <p class="text-warning"><small>This action cannot be undone.</small></p>
      </div>

      <div class="modal-footer">
        <button type="button" class="btn btn-white" data-mdb-dismiss="modal">
          Close
        </button>
        <button type="submit" class="btn btn-danger">Delete</button>
      </div>
      </form>
    </div>
  </div>
</div>



<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script id="radio">
$(document).ready(function() {
    $(".edit-radio-btn").on("click", function() {
        $td = $(this).closest("td");
        var radioId = $td.children("#hidden-radio-id").val();
        var radioName = $td.children("#hidden-radio-name").val();
        var radioFrequency = $td.children("#hidden-radio-frequency").val();

        document.getElementById("radioName1").value = String(radioName);
        document.getElementById("radioFrequency1").value = String(radioFrequency);
        document.getElementById("radioID-edit").value = radioId;
    });
    $(".del-radio-btn").on("click", function() {
        $td = $(this).closest("td");
        var radioId = $td.children("#hidden-radio-id").val();
        document.getElementById("radioID-delete").value = radioId;
    });
});
</script>

<script id="producer">
$(document).ready(function() {
    $(".edit-producer-btn").on("click", function() {
        $td = $(this).closest("td");
        var producerId = $td.children("#hidden-producer-id").val();
        var producerName = $td.children("#hidden-producer-name").val();
        var producerAddress = $td.children("#hidden-producer-address").val();
        var producerPhoneNumber = $td.children("#hidden-producer-phonenumber").val();
        var producerTimeStart = $td.children("#hidden-producer-time-start").val();
        var producerTimeEnd = $td.children("#hidden-producer-time-end").val();
        var producerCost = $td.children("#hidden-producer-cost").val();

        document.getElementById("producerName1").value = String(producerName);
        document.getElementById("producerAddress1").value = String(producerAddress);
        document.getElementById("producerCost1").value = producerCost;
        document.getElementById("producerPhoneNumber1").value = String(producerPhoneNumber);
        document.getElementById("from-producer1").value = String(producerTimeStart);
        document.getElementById("to-producer1").value = String(producerTimeEnd);

        document.getElementById("producerID-edit").value = producerId;
    });
    $(".del-producer-btn").on("click", function() {
        $td = $(this).closest("td");
        var producerId = $td.children("#hidden-producer-id").val();
        document.getElementById("producerID-delete").value = producerId;
    });
});
</script>

<script id="scheduleDate">
  $( function() {
    $( "#scheduleDate" ).datepicker();
  } );
</script>

<script id="scheduleDate-edit">
  $( function() {
    $( "#scheduleDate-edit" ).datepicker();
  } );
</script>

<script id="producer-picker">
  $( function() {
    var dateFormat = "mm/dd/yy",
      from = $( "#from-producer" )
        .datepicker({
          defaultDate: "+1w",
          changeMonth: true,
          numberOfMonths: 2
        })
        .on( "change", function() {
          to.datepicker( "option", "minDate", getDate( this ) );
        }),
      to = $( "#to-producer" ).datepicker({
        defaultDate: "+1w",
        changeMonth: true,
        numberOfMonths: 2
      })
      .on( "change", function() {
        from.datepicker( "option", "maxDate", getDate( this ) );
      });
 
    function getDate( element ) {
      var date;
      try {
        date = $.datepicker.parseDate( dateFormat, element.value );
      } catch( error ) {
        date = null;
      }
      return date;
    }
  } );
</script>

<script id="producer-picker-edit">
  $( function() {
    var dateFormat = "mm/dd/yy",
      from = $( "#from-producer1" )
        .datepicker({
          defaultDate: "+1w",
          changeMonth: true,
          numberOfMonths: 2
        })
        .on( "change", function() {
          to.datepicker( "option", "minDate", getDate( this ) );
        }),
      to = $( "#to-producer1" ).datepicker({
        defaultDate: "+1w",
        changeMonth: true,
        numberOfMonths: 2
      })
      .on( "change", function() {
        from.datepicker( "option", "maxDate", getDate( this ) );
      });
 
    function getDate( element ) {
      var date;
      try {
        date = $.datepicker.parseDate( dateFormat, element.value );
      } catch( error ) {
        date = null;
      }
      return date;
    }
  } );
</script>


<script id="genre">
$(document).ready(function() {
    $(".del-genre-btn").on("click", function() {
        $td = $(this).closest("td");
        var RGradioID = $td.children("#hidden-rg-radio-id").val();
        var genre = $td.children("#hidden-radio-genre").val();
        document.getElementById("RGradioID-delete").value = RGradioID;
        document.getElementById("genre-delete").value = genre;
    });
});
</script>

<script id="scheduleFromTo">
  $("#scheduleTimeStart").on("change", function() {
    var timestart = Number($("#scheduleTimeStart").val());
    var timeend = Number($("#scheduleTimeEnd").val());
    if (timestart >= timeend) {
      alert("Time start must smaller than time end");
      $("#scheduleTimeEnd").val(timestart + 1);
    }
  });
  $("#scheduleTimeEnd").on("change", function() {
    var timestart = Number($("#scheduleTimeStart").val());
    var timeend = Number($("#scheduleTimeEnd").val());
    if (timestart >= timeend) {
      alert("Time start must smaller than time end");
      $("#scheduleTimeEnd").val(timestart + 1);
    }
  });
</script>

<script id="schedule">
$(document).ready(function() {
    $(".del-schedule-btn").on("click", function() {
        $td = $(this).closest("td");
        var RSradioID = $td.children("#hidden-rs-radio-id").val();
        var SchedDate = $td.children("#hidden-schedule-date").val();
        var TimeStart = $td.children("#hidden-schedule-time-start").val();
        var TimeEnd = $td.children("#hidden-schedule-time-end").val();
        var Languages = $td.children("#hidden-schedule-languages").val();
        document.getElementById("RSradioID-delete").value = RSradioID;
        document.getElementById("date-delete").value = SchedDate;
        document.getElementById("timeStart-delete").value = TimeStart;
        document.getElementById("timeEnd-delete").value = TimeEnd;
        document.getElementById("languages-delete").value = Languages;
    });
});
</script>