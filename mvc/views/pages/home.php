  <section>
    <div class="row">
      <div class="col-sm-6 col-12 mb-4">
        <div class="card">
          <div class="card-body">
            <div class="d-flex justify-content-between px-md-1">
              <div class="align-self-center">
                <i class="fas fa-users text-info fa-3x"></i>
              </div>
              <div class="text-end">
                <h3> <?php echo $data['user'] ?> </h3>
                <p class="mb-0">Total users</p>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="col-sm-6 col-12 mb-4">
        <div class="card">
          <div class="card-body">
            <div class="d-flex justify-content-between px-md-1">
              <div class="align-self-center">
                <i class="fas fa-broadcast-tower text-warning fa-3x"></i>
              </div>
              <div class="text-end">
                <h3> <?php echo $data['radio_channel'] ?> </h3>
                <p class="mb-0">Total Radio channels</p>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="col-sm-6 col-12 mb-4">
        <div class="card">
          <div class="card-body">
            <div class="d-flex justify-content-between px-md-1">
              <div class="align-self-center">
                <i class="fas fa-music text-danger fa-3x"></i>
              </div>
              <div class="text-end">
                <h3> <?php echo $data['track'] ?> </h3>
                <p class="mb-0">Total tracks</p>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="col-sm-6 col-12 mb-4">
        <div class="card">
          <div class="card-body">
            <div class="d-flex justify-content-between px-md-1">
              <div class="align-self-center">
                <i class="far fa-comments text-success fa-3x"></i>
              </div>
              <div class="text-end">
                <h3> <?php echo $data['ticket'] ?> </h3>
                <p class="mb-0">Total ticket</p>
              </div>
            </div>
          </div>
        </div>
      </div>            
    </div>
  </section>
