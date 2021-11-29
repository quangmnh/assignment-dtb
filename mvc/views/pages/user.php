<link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">


<div class="row">
  <div class="col"><h3>User Management</h3></div>
</div>

<div class="row">
  <div class="col-3">
    <div class="text-start">
      <!-- Button trigger modal -->
      <button type="button" class="btn btn-primary" data-mdb-toggle="modal" data-mdb-target="#createUserModal">
        Add user
      </button>
    </div>
  </div>
  <div class="col-6">
  <form method="post" action="./user/userSearch" id="form-search-user">
    <div class="input-group">
    <div class="form-outline">
      <input id="keyword" name = "keyword" type="search"  class="form-control" />
      <label class="form-label" for="keyword">Search</label>
    </div>
    </div>
  </form>
  </div>
  <div class="col-3">
    <form action="./user/sayHi" method="post" id="form-refresh-user">
        <button type="submit" class="btn btn-info btn-sm" id ="refresh">
          <span class="glyphicon glyphicon-refresh"></span> Refresh
        </button>
    </form>
  </div>
</div>


<?php
// photo, name, email, country
  if (isset($data["keyword"])){
    echo '<script> document.getElementByID("search-input").placeholder = '.$data["keyword"].'</script>)';
  }
  if ( isset($data["userl"]) ) {
    echo '<div class="table-responsive">';
    echo '<table id = "usertable" class="table table-striped table-bordered table-sm">';
    echo '<thead>';
    echo '<tr>';
    echo '<th class="th-sm">Photo</th>';
    echo '<th class="th-sm">Username</th>';
    echo '<th class="th-sm">Name</th>';
    echo '<th class="th-sm">Email</th>';
    echo '<th class="th-sm">Country</th>';
    echo '<th class="th-sm">Action</th>';
    echo '</tr>';
    echo '</thead>';
    echo '<tbody>';
    foreach ($data["userl"] as $row) {
        echo '<tr>';
        echo '<td><img src="'.$row['photo'].'" width="50" height="50" /></td>';
        echo '<td>'.$row['username'].'</td>';
        echo '<td>'.$row['name'].'</td>';
        echo '<td>'.$row['email'].'</td>';
        echo '<td>'.$row['country'].'</td>'; 
        echo '<td class = "col-3">';
        echo '<input id="hidden-user-photo" type="hidden" value="'.$row["photo"].'" />';
        echo '<input id="hidden-user-username" type="hidden" value="'.$row["username"].'" />';
        echo '<input id="hidden-user-email" type="hidden" value="'.$row["email"].'" />';
        echo '<input id="hidden-user-country" type="hidden" value="'.$row["country"].'" />';
        echo '<input id="hidden-user-name" type="hidden" value="'.$row["name"].'" />';
        echo '<input id="hidden-user-userid" type="hidden" value="'.$row["user_id"].'" />';
        echo '<input id="hidden-user-uccid" type="hidden" value="'.$row["u_cc_id"].'" />';
        echo '<input id="hidden-user-passwordhash" type="hidden" value="'.$row["passwordHash"].'" />';

        echo '<button type="button" class="btn btn-success btn-sm edit-user-btn" data-mdb-toggle="modal" data-mdb-target="#editUserModal">Edit</button> ';
        echo '<button type="button" class="btn btn-secondary btn-sm newpass-user-btn" data-mdb-toggle="modal" data-mdb-target="#newpassUserModal">Password</button>';
        echo '<button type="button" class="btn btn-danger btn-sm delete-user-btn" data-mdb-toggle="modal" data-mdb-target="#deleteUserModal">Delete</button> ';
        echo '<button type="button" class="btn btn-warning btn-sm detail-user-btn" data-mdb-toggle="modal" data-mdb-target="#detailUserModal">Detail</button></td>';
        
        echo '</tr>';
    }
    echo '</ tbody>';
    echo '</table>';
    echo '</div>';
  }
?>


<!-- Modal -->
<div class="modal fade" id="createUserModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Add a new user</h5>
        <button type="button" class="close" data-mdb-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      
      <form action="./user/add_user" method="post" id="form-add-user">
      <div class="modal-body">
          <div class="form-floating mb-3">
            <input type="text" id="user_username" name="user_username" class="form-control"/>
            <label class="form-label" for="user_username">Username</label>
          </div>
          <div class="form-floating mb-3">
            <input type="password" id="user_password" name="user_password" class="form-control" />
            <label class="form-label" for="user_password">Password</label>
          </div>
          <div id = "message1"></div>
          <div class="form-floating mb-3">
            <input type="password" id="user_passwordc" name="user_passwordc" class="form-control" />
            <label class="form-label" for="user_passwordc">Confirm New Password</label>
          </div>
          <div class="form-floating mb-3">
            <input type="text" id="user_name" name="user_name" class="form-control" />
            <label class="form-label" for="user_name">Name</label>
          </div>
          <div class="form-floating mb-3">
            <input type="email" id="user_email" name="user_email" class="form-control" />
            <label class="form-label" for="user_email">Email</label>
          </div>
          <div class="form-floating mb-3">
            <select name="user_country" id="user_country" form="form-add-user" class="form-select mb-3" aria-label="categorySelect">
                <option value="Afghanistan">Afghanistan</option>
                <option value="Åland Islands">Åland Islands</option>
                <option value="Albania">Albania</option>
                <option value="Algeria">Algeria</option>
                <option value="American Samoa">American Samoa</option>
                <option value="Andorra">Andorra</option>
                <option value="Angola">Angola</option>
                <option value="Anguilla">Anguilla</option>
                <option value="Antarctica">Antarctica</option>
                <option value="Antigua and Barbuda">Antigua and Barbuda</option>
                <option value="Argentina">Argentina</option>
                <option value="Armenia">Armenia</option>
                <option value="Aruba">Aruba</option>
                <option value="Australia">Australia</option>
                <option value="Austria">Austria</option>
                <option value="Azerbaijan">Azerbaijan</option>
                <option value="Bahamas">Bahamas</option>
                <option value="Bahrain">Bahrain</option>
                <option value="Bangladesh">Bangladesh</option>
                <option value="Barbados">Barbados</option>
                <option value="Belarus">Belarus</option>
                <option value="Belgium">Belgium</option>
                <option value="Belize">Belize</option>
                <option value="Benin">Benin</option>
                <option value="Bermuda">Bermuda</option>
                <option value="Bhutan">Bhutan</option>
                <option value="Bolivia">Bolivia</option>
                <option value="Bosnia and Herzegovina">Bosnia and Herzegovina</option>
                <option value="Botswana">Botswana</option>
                <option value="Bouvet Island">Bouvet Island</option>
                <option value="Brazil">Brazil</option>
                <option value="British Indian Ocean Territory">British Indian Ocean Territory</option>
                <option value="Brunei Darussalam">Brunei Darussalam</option>
                <option value="Bulgaria">Bulgaria</option>
                <option value="Burkina Faso">Burkina Faso</option>
                <option value="Burundi">Burundi</option>
                <option value="Cambodia">Cambodia</option>
                <option value="Cameroon">Cameroon</option>
                <option value="Canada">Canada</option>
                <option value="Cape Verde">Cape Verde</option>
                <option value="Cayman Islands">Cayman Islands</option>
                <option value="Central African Republic">Central African Republic</option>
                <option value="Chad">Chad</option>
                <option value="Chile">Chile</option>
                <option value="China">China</option>
                <option value="Christmas Island">Christmas Island</option>
                <option value="Cocos (Keeling) Islands">Cocos (Keeling) Islands</option>
                <option value="Colombia">Colombia</option>
                <option value="Comoros">Comoros</option>
                <option value="Congo">Congo</option>
                <option value="Congo, The Democratic Republic of The">Congo, The Democratic Republic of The</option>
                <option value="Cook Islands">Cook Islands</option>
                <option value="Costa Rica">Costa Rica</option>
                <option value="Cote D'ivoire">Cote D'ivoire</option>
                <option value="Croatia">Croatia</option>
                <option value="Cuba">Cuba</option>
                <option value="Cyprus">Cyprus</option>
                <option value="Czech Republic">Czech Republic</option>
                <option value="Denmark">Denmark</option>
                <option value="Djibouti">Djibouti</option>
                <option value="Dominica">Dominica</option>
                <option value="Dominican Republic">Dominican Republic</option>
                <option value="Ecuador">Ecuador</option>
                <option value="Egypt">Egypt</option>
                <option value="El Salvador">El Salvador</option>
                <option value="Equatorial Guinea">Equatorial Guinea</option>
                <option value="Eritrea">Eritrea</option>
                <option value="Estonia">Estonia</option>
                <option value="Ethiopia">Ethiopia</option>
                <option value="Falkland Islands (Malvinas)">Falkland Islands (Malvinas)</option>
                <option value="Faroe Islands">Faroe Islands</option>
                <option value="Fiji">Fiji</option>
                <option value="Finland">Finland</option>
                <option value="France">France</option>
                <option value="French Guiana">French Guiana</option>
                <option value="French Polynesia">French Polynesia</option>
                <option value="French Southern Territories">French Southern Territories</option>
                <option value="Gabon">Gabon</option>
                <option value="Gambia">Gambia</option>
                <option value="Georgia">Georgia</option>
                <option value="Germany">Germany</option>
                <option value="Ghana">Ghana</option>
                <option value="Gibraltar">Gibraltar</option>
                <option value="Greece">Greece</option>
                <option value="Greenland">Greenland</option>
                <option value="Grenada">Grenada</option>
                <option value="Guadeloupe">Guadeloupe</option>
                <option value="Guam">Guam</option>
                <option value="Guatemala">Guatemala</option>
                <option value="Guernsey">Guernsey</option>
                <option value="Guinea">Guinea</option>
                <option value="Guinea-bissau">Guinea-bissau</option>
                <option value="Guyana">Guyana</option>
                <option value="Haiti">Haiti</option>
                <option value="Heard Island and Mcdonald Islands">Heard Island and Mcdonald Islands</option>
                <option value="Holy See (Vatican City State)">Holy See (Vatican City State)</option>
                <option value="Honduras">Honduras</option>
                <option value="Hong Kong">Hong Kong</option>
                <option value="Hungary">Hungary</option>
                <option value="Iceland">Iceland</option>
                <option value="India">India</option>
                <option value="Indonesia">Indonesia</option>
                <option value="Iran, Islamic Republic of">Iran, Islamic Republic of</option>
                <option value="Iraq">Iraq</option>
                <option value="Ireland">Ireland</option>
                <option value="Isle of Man">Isle of Man</option>
                <option value="Israel">Israel</option>
                <option value="Italy">Italy</option>
                <option value="Jamaica">Jamaica</option>
                <option value="Japan">Japan</option>
                <option value="Jersey">Jersey</option>
                <option value="Jordan">Jordan</option>
                <option value="Kazakhstan">Kazakhstan</option>
                <option value="Kenya">Kenya</option>
                <option value="Kiribati">Kiribati</option>
                <option value="Korea, Democratic People's Republic of">Korea, Democratic People's Republic of</option>
                <option value="Korea, Republic of">Korea, Republic of</option>
                <option value="Kuwait">Kuwait</option>
                <option value="Kyrgyzstan">Kyrgyzstan</option>
                <option value="Lao People's Democratic Republic">Lao People's Democratic Republic</option>
                <option value="Latvia">Latvia</option>
                <option value="Lebanon">Lebanon</option>
                <option value="Lesotho">Lesotho</option>
                <option value="Liberia">Liberia</option>
                <option value="Libyan Arab Jamahiriya">Libyan Arab Jamahiriya</option>
                <option value="Liechtenstein">Liechtenstein</option>
                <option value="Lithuania">Lithuania</option>
                <option value="Luxembourg">Luxembourg</option>
                <option value="Macao">Macao</option>
                <option value="Macedonia, The Former Yugoslav Republic of">Macedonia, The Former Yugoslav Republic of</option>
                <option value="Madagascar">Madagascar</option>
                <option value="Malawi">Malawi</option>
                <option value="Malaysia">Malaysia</option>
                <option value="Maldives">Maldives</option>
                <option value="Mali">Mali</option>
                <option value="Malta">Malta</option>
                <option value="Marshall Islands">Marshall Islands</option>
                <option value="Martinique">Martinique</option>
                <option value="Mauritania">Mauritania</option>
                <option value="Mauritius">Mauritius</option>
                <option value="Mayotte">Mayotte</option>
                <option value="Mexico">Mexico</option>
                <option value="Micronesia, Federated States of">Micronesia, Federated States of</option>
                <option value="Moldova, Republic of">Moldova, Republic of</option>
                <option value="Monaco">Monaco</option>
                <option value="Mongolia">Mongolia</option>
                <option value="Montenegro">Montenegro</option>
                <option value="Montserrat">Montserrat</option>
                <option value="Morocco">Morocco</option>
                <option value="Mozambique">Mozambique</option>
                <option value="Myanmar">Myanmar</option>
                <option value="Namibia">Namibia</option>
                <option value="Nauru">Nauru</option>
                <option value="Nepal">Nepal</option>
                <option value="Netherlands">Netherlands</option>
                <option value="Netherlands Antilles">Netherlands Antilles</option>
                <option value="New Caledonia">New Caledonia</option>
                <option value="New Zealand">New Zealand</option>
                <option value="Nicaragua">Nicaragua</option>
                <option value="Niger">Niger</option>
                <option value="Nigeria">Nigeria</option>
                <option value="Niue">Niue</option>
                <option value="Norfolk Island">Norfolk Island</option>
                <option value="Northern Mariana Islands">Northern Mariana Islands</option>
                <option value="Norway">Norway</option>
                <option value="Oman">Oman</option>
                <option value="Pakistan">Pakistan</option>
                <option value="Palau">Palau</option>
                <option value="Palestinian Territory, Occupied">Palestinian Territory, Occupied</option>
                <option value="Panama">Panama</option>
                <option value="Papua New Guinea">Papua New Guinea</option>
                <option value="Paraguay">Paraguay</option>
                <option value="Peru">Peru</option>
                <option value="Philippines">Philippines</option>
                <option value="Pitcairn">Pitcairn</option>
                <option value="Poland">Poland</option>
                <option value="Portugal">Portugal</option>
                <option value="Puerto Rico">Puerto Rico</option>
                <option value="Qatar">Qatar</option>
                <option value="Reunion">Reunion</option>
                <option value="Romania">Romania</option>
                <option value="Russian Federation">Russian Federation</option>
                <option value="Rwanda">Rwanda</option>
                <option value="Saint Helena">Saint Helena</option>
                <option value="Saint Kitts and Nevis">Saint Kitts and Nevis</option>
                <option value="Saint Lucia">Saint Lucia</option>
                <option value="Saint Pierre and Miquelon">Saint Pierre and Miquelon</option>
                <option value="Saint Vincent and The Grenadines">Saint Vincent and The Grenadines</option>
                <option value="Samoa">Samoa</option>
                <option value="San Marino">San Marino</option>
                <option value="Sao Tome and Principe">Sao Tome and Principe</option>
                <option value="Saudi Arabia">Saudi Arabia</option>
                <option value="Senegal">Senegal</option>
                <option value="Serbia">Serbia</option>
                <option value="Seychelles">Seychelles</option>
                <option value="Sierra Leone">Sierra Leone</option>
                <option value="Singapore">Singapore</option>
                <option value="Slovakia">Slovakia</option>
                <option value="Slovenia">Slovenia</option>
                <option value="Solomon Islands">Solomon Islands</option>
                <option value="Somalia">Somalia</option>
                <option value="South Africa">South Africa</option>
                <option value="South Georgia and The South Sandwich Islands">South Georgia and The South Sandwich Islands</option>
                <option value="Spain">Spain</option>
                <option value="Sri Lanka">Sri Lanka</option>
                <option value="Sudan">Sudan</option>
                <option value="Suriname">Suriname</option>
                <option value="Svalbard and Jan Mayen">Svalbard and Jan Mayen</option>
                <option value="Swaziland">Swaziland</option>
                <option value="Sweden">Sweden</option>
                <option value="Switzerland">Switzerland</option>
                <option value="Syrian Arab Republic">Syrian Arab Republic</option>
                <option value="Taiwan">Taiwan</option>
                <option value="Tajikistan">Tajikistan</option>
                <option value="Tanzania, United Republic of">Tanzania, United Republic of</option>
                <option value="Thailand">Thailand</option>
                <option value="Timor-leste">Timor-leste</option>
                <option value="Togo">Togo</option>
                <option value="Tokelau">Tokelau</option>
                <option value="Tonga">Tonga</option>
                <option value="Trinidad and Tobago">Trinidad and Tobago</option>
                <option value="Tunisia">Tunisia</option>
                <option value="Turkey">Turkey</option>
                <option value="Turkmenistan">Turkmenistan</option>
                <option value="Turks and Caicos Islands">Turks and Caicos Islands</option>
                <option value="Tuvalu">Tuvalu</option>
                <option value="Uganda">Uganda</option>
                <option value="Ukraine">Ukraine</option>
                <option value="United Arab Emirates">United Arab Emirates</option>
                <option value="United Kingdom">United Kingdom</option>
                <option value="United States">United States</option>
                <option value="United States Minor Outlying Islands">United States Minor Outlying Islands</option>
                <option value="Uruguay">Uruguay</option>
                <option value="Uzbekistan">Uzbekistan</option>
                <option value="Vanuatu">Vanuatu</option>
                <option value="Venezuela">Venezuela</option>
                <option value="Vietnam" selected="selected">Viet Nam</option>
                <option value="Virgin Islands, British">Virgin Islands, British</option>
                <option value="Virgin Islands, U.S.">Virgin Islands, U.S.</option>
                <option value="Wallis and Futuna">Wallis and Futuna</option>
                <option value="Western Sahara">Western Sahara</option>
                <option value="Yemen">Yemen</option>
                <option value="Zambia">Zambia</option>
                <option value="Zaun">Zaun</option>
                <option value="Zimbabwe">Zimbabwe</option>
            </select>
            <label class="form-label" for="user_country">Choose your region</label>
          </div>
          <div class="form-floating mb-3">
            <input type="text" id="user_photo" name="user_photo" class="form-control" />
            <label class="form-label" for="user_photo">Photo URL</label>
          </div>
        </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-mdb-dismiss="modal">Cancel</button>
        <button type="submit" class="btn btn-primary">Add user</button>
      </div>
      </form>
    </div>
  </div>
</div>

<!-- Modal -->
<div class="modal fade" id="editUserModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel"> Update Information</h5>
        <button type="button" class="close" data-mdb-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      
      <form action="./user/edit_user" method="post" id="form-edit-user">
      <div class="modal-body">
          <div class="form-floating mb-3">
            <input type="text" id="user_username1" name="user_username1" class="form-control"/>
            <label class="form-label" for="user_username1">Username</label>
          </div>
          <div class="form-floating mb-3">
            <input type="text" id="user_name1" name="user_name1" class="form-control" />
            <label class="form-label" for="user_name1">Name</label>
          </div>
          <div class="form-floating mb-3">
            <input type="email1" id="user_email1" name="user_email1" class="form-control" />
            <label class="form-label" for="user_email1">Email</label>
          </div>
          <div class="form-floating mb-3">
            <input type="hidden" id="user_userid" name="user_userid" class="form-control" />
          </div>
          <div class="form-floating mb-3">
            <input type="hidden" id="user_country2" name="user_country2" class="form-control" />
          </div>
          <div class="form-floating mb-3">
            <select name="user_country1" id="user_country1" form="form-add-user" class="form-select mb-3" aria-label="categorySelect">
                <option value="Afghanistan">Afghanistan</option>
                <option value="Åland Islands">Åland Islands</option>
                <option value="Albania">Albania</option>
                <option value="Algeria">Algeria</option>
                <option value="American Samoa">American Samoa</option>
                <option value="Andorra">Andorra</option>
                <option value="Angola">Angola</option>
                <option value="Anguilla">Anguilla</option>
                <option value="Antarctica">Antarctica</option>
                <option value="Antigua and Barbuda">Antigua and Barbuda</option>
                <option value="Argentina">Argentina</option>
                <option value="Armenia">Armenia</option>
                <option value="Aruba">Aruba</option>
                <option value="Australia">Australia</option>
                <option value="Austria">Austria</option>
                <option value="Azerbaijan">Azerbaijan</option>
                <option value="Bahamas">Bahamas</option>
                <option value="Bahrain">Bahrain</option>
                <option value="Bangladesh">Bangladesh</option>
                <option value="Barbados">Barbados</option>
                <option value="Belarus">Belarus</option>
                <option value="Belgium">Belgium</option>
                <option value="Belize">Belize</option>
                <option value="Benin">Benin</option>
                <option value="Bermuda">Bermuda</option>
                <option value="Bhutan">Bhutan</option>
                <option value="Bolivia">Bolivia</option>
                <option value="Bosnia and Herzegovina">Bosnia and Herzegovina</option>
                <option value="Botswana">Botswana</option>
                <option value="Bouvet Island">Bouvet Island</option>
                <option value="Brazil">Brazil</option>
                <option value="British Indian Ocean Territory">British Indian Ocean Territory</option>
                <option value="Brunei Darussalam">Brunei Darussalam</option>
                <option value="Bulgaria">Bulgaria</option>
                <option value="Burkina Faso">Burkina Faso</option>
                <option value="Burundi">Burundi</option>
                <option value="Cambodia">Cambodia</option>
                <option value="Cameroon">Cameroon</option>
                <option value="Canada">Canada</option>
                <option value="Cape Verde">Cape Verde</option>
                <option value="Cayman Islands">Cayman Islands</option>
                <option value="Central African Republic">Central African Republic</option>
                <option value="Chad">Chad</option>
                <option value="Chile">Chile</option>
                <option value="China">China</option>
                <option value="Christmas Island">Christmas Island</option>
                <option value="Cocos (Keeling) Islands">Cocos (Keeling) Islands</option>
                <option value="Colombia">Colombia</option>
                <option value="Comoros">Comoros</option>
                <option value="Congo">Congo</option>
                <option value="Congo, The Democratic Republic of The">Congo, The Democratic Republic of The</option>
                <option value="Cook Islands">Cook Islands</option>
                <option value="Costa Rica">Costa Rica</option>
                <option value="Cote D'ivoire">Cote D'ivoire</option>
                <option value="Croatia">Croatia</option>
                <option value="Cuba">Cuba</option>
                <option value="Cyprus">Cyprus</option>
                <option value="Czech Republic">Czech Republic</option>
                <option value="Denmark">Denmark</option>
                <option value="Djibouti">Djibouti</option>
                <option value="Dominica">Dominica</option>
                <option value="Dominican Republic">Dominican Republic</option>
                <option value="Ecuador">Ecuador</option>
                <option value="Egypt">Egypt</option>
                <option value="El Salvador">El Salvador</option>
                <option value="Equatorial Guinea">Equatorial Guinea</option>
                <option value="Eritrea">Eritrea</option>
                <option value="Estonia">Estonia</option>
                <option value="Ethiopia">Ethiopia</option>
                <option value="Falkland Islands (Malvinas)">Falkland Islands (Malvinas)</option>
                <option value="Faroe Islands">Faroe Islands</option>
                <option value="Fiji">Fiji</option>
                <option value="Finland">Finland</option>
                <option value="France">France</option>
                <option value="French Guiana">French Guiana</option>
                <option value="French Polynesia">French Polynesia</option>
                <option value="French Southern Territories">French Southern Territories</option>
                <option value="Gabon">Gabon</option>
                <option value="Gambia">Gambia</option>
                <option value="Georgia">Georgia</option>
                <option value="Germany">Germany</option>
                <option value="Ghana">Ghana</option>
                <option value="Gibraltar">Gibraltar</option>
                <option value="Greece">Greece</option>
                <option value="Greenland">Greenland</option>
                <option value="Grenada">Grenada</option>
                <option value="Guadeloupe">Guadeloupe</option>
                <option value="Guam">Guam</option>
                <option value="Guatemala">Guatemala</option>
                <option value="Guernsey">Guernsey</option>
                <option value="Guinea">Guinea</option>
                <option value="Guinea-bissau">Guinea-bissau</option>
                <option value="Guyana">Guyana</option>
                <option value="Haiti">Haiti</option>
                <option value="Heard Island and Mcdonald Islands">Heard Island and Mcdonald Islands</option>
                <option value="Holy See (Vatican City State)">Holy See (Vatican City State)</option>
                <option value="Honduras">Honduras</option>
                <option value="Hong Kong">Hong Kong</option>
                <option value="Hungary">Hungary</option>
                <option value="Iceland">Iceland</option>
                <option value="India">India</option>
                <option value="Indonesia">Indonesia</option>
                <option value="Iran, Islamic Republic of">Iran, Islamic Republic of</option>
                <option value="Iraq">Iraq</option>
                <option value="Ireland">Ireland</option>
                <option value="Isle of Man">Isle of Man</option>
                <option value="Israel">Israel</option>
                <option value="Italy">Italy</option>
                <option value="Jamaica">Jamaica</option>
                <option value="Japan">Japan</option>
                <option value="Jersey">Jersey</option>
                <option value="Jordan">Jordan</option>
                <option value="Kazakhstan">Kazakhstan</option>
                <option value="Kenya">Kenya</option>
                <option value="Kiribati">Kiribati</option>
                <option value="Korea, Democratic People's Republic of">Korea, Democratic People's Republic of</option>
                <option value="Korea, Republic of">Korea, Republic of</option>
                <option value="Kuwait">Kuwait</option>
                <option value="Kyrgyzstan">Kyrgyzstan</option>
                <option value="Lao People's Democratic Republic">Lao People's Democratic Republic</option>
                <option value="Latvia">Latvia</option>
                <option value="Lebanon">Lebanon</option>
                <option value="Lesotho">Lesotho</option>
                <option value="Liberia">Liberia</option>
                <option value="Libyan Arab Jamahiriya">Libyan Arab Jamahiriya</option>
                <option value="Liechtenstein">Liechtenstein</option>
                <option value="Lithuania">Lithuania</option>
                <option value="Luxembourg">Luxembourg</option>
                <option value="Macao">Macao</option>
                <option value="Macedonia, The Former Yugoslav Republic of">Macedonia, The Former Yugoslav Republic of</option>
                <option value="Madagascar">Madagascar</option>
                <option value="Malawi">Malawi</option>
                <option value="Malaysia">Malaysia</option>
                <option value="Maldives">Maldives</option>
                <option value="Mali">Mali</option>
                <option value="Malta">Malta</option>
                <option value="Marshall Islands">Marshall Islands</option>
                <option value="Martinique">Martinique</option>
                <option value="Mauritania">Mauritania</option>
                <option value="Mauritius">Mauritius</option>
                <option value="Mayotte">Mayotte</option>
                <option value="Mexico">Mexico</option>
                <option value="Micronesia, Federated States of">Micronesia, Federated States of</option>
                <option value="Moldova, Republic of">Moldova, Republic of</option>
                <option value="Monaco">Monaco</option>
                <option value="Mongolia">Mongolia</option>
                <option value="Montenegro">Montenegro</option>
                <option value="Montserrat">Montserrat</option>
                <option value="Morocco">Morocco</option>
                <option value="Mozambique">Mozambique</option>
                <option value="Myanmar">Myanmar</option>
                <option value="Namibia">Namibia</option>
                <option value="Nauru">Nauru</option>
                <option value="Nepal">Nepal</option>
                <option value="Netherlands">Netherlands</option>
                <option value="Netherlands Antilles">Netherlands Antilles</option>
                <option value="New Caledonia">New Caledonia</option>
                <option value="New Zealand">New Zealand</option>
                <option value="Nicaragua">Nicaragua</option>
                <option value="Niger">Niger</option>
                <option value="Nigeria">Nigeria</option>
                <option value="Niue">Niue</option>
                <option value="Norfolk Island">Norfolk Island</option>
                <option value="Northern Mariana Islands">Northern Mariana Islands</option>
                <option value="Norway">Norway</option>
                <option value="Oman">Oman</option>
                <option value="Pakistan">Pakistan</option>
                <option value="Palau">Palau</option>
                <option value="Palestinian Territory, Occupied">Palestinian Territory, Occupied</option>
                <option value="Panama">Panama</option>
                <option value="Papua New Guinea">Papua New Guinea</option>
                <option value="Paraguay">Paraguay</option>
                <option value="Peru">Peru</option>
                <option value="Philippines">Philippines</option>
                <option value="Pitcairn">Pitcairn</option>
                <option value="Poland">Poland</option>
                <option value="Portugal">Portugal</option>
                <option value="Puerto Rico">Puerto Rico</option>
                <option value="Qatar">Qatar</option>
                <option value="Reunion">Reunion</option>
                <option value="Romania">Romania</option>
                <option value="Russian Federation">Russian Federation</option>
                <option value="Rwanda">Rwanda</option>
                <option value="Saint Helena">Saint Helena</option>
                <option value="Saint Kitts and Nevis">Saint Kitts and Nevis</option>
                <option value="Saint Lucia">Saint Lucia</option>
                <option value="Saint Pierre and Miquelon">Saint Pierre and Miquelon</option>
                <option value="Saint Vincent and The Grenadines">Saint Vincent and The Grenadines</option>
                <option value="Samoa">Samoa</option>
                <option value="San Marino">San Marino</option>
                <option value="Sao Tome and Principe">Sao Tome and Principe</option>
                <option value="Saudi Arabia">Saudi Arabia</option>
                <option value="Senegal">Senegal</option>
                <option value="Serbia">Serbia</option>
                <option value="Seychelles">Seychelles</option>
                <option value="Sierra Leone">Sierra Leone</option>
                <option value="Singapore">Singapore</option>
                <option value="Slovakia">Slovakia</option>
                <option value="Slovenia">Slovenia</option>
                <option value="Solomon Islands">Solomon Islands</option>
                <option value="Somalia">Somalia</option>
                <option value="South Africa">South Africa</option>
                <option value="South Georgia and The South Sandwich Islands">South Georgia and The South Sandwich Islands</option>
                <option value="Spain">Spain</option>
                <option value="Sri Lanka">Sri Lanka</option>
                <option value="Sudan">Sudan</option>
                <option value="Suriname">Suriname</option>
                <option value="Svalbard and Jan Mayen">Svalbard and Jan Mayen</option>
                <option value="Swaziland">Swaziland</option>
                <option value="Sweden">Sweden</option>
                <option value="Switzerland">Switzerland</option>
                <option value="Syrian Arab Republic">Syrian Arab Republic</option>
                <option value="Taiwan">Taiwan</option>
                <option value="Tajikistan">Tajikistan</option>
                <option value="Tanzania, United Republic of">Tanzania, United Republic of</option>
                <option value="Thailand">Thailand</option>
                <option value="Timor-leste">Timor-leste</option>
                <option value="Togo">Togo</option>
                <option value="Tokelau">Tokelau</option>
                <option value="Tonga">Tonga</option>
                <option value="Trinidad and Tobago">Trinidad and Tobago</option>
                <option value="Tunisia">Tunisia</option>
                <option value="Turkey">Turkey</option>
                <option value="Turkmenistan">Turkmenistan</option>
                <option value="Turks and Caicos Islands">Turks and Caicos Islands</option>
                <option value="Tuvalu">Tuvalu</option>
                <option value="Uganda">Uganda</option>
                <option value="Ukraine">Ukraine</option>
                <option value="United Arab Emirates">United Arab Emirates</option>
                <option value="United Kingdom">United Kingdom</option>
                <option value="United States">United States</option>
                <option value="United States Minor Outlying Islands">United States Minor Outlying Islands</option>
                <option value="Uruguay">Uruguay</option>
                <option value="Uzbekistan">Uzbekistan</option>
                <option value="Vanuatu">Vanuatu</option>
                <option value="Venezuela">Venezuela</option>
                <option value="Vietnam" selected="selected">Viet Nam</option>
                <option value="Virgin Islands, British">Virgin Islands, British</option>
                <option value="Virgin Islands, U.S.">Virgin Islands, U.S.</option>
                <option value="Wallis and Futuna">Wallis and Futuna</option>
                <option value="Western Sahara">Western Sahara</option>
                <option value="Yemen">Yemen</option>
                <option value="Zambia">Zambia</option>
                <option value="Zaun">Zaun</option>
                <option value="Zimbabwe">Zimbabwe</option>
            </select>
            <label class="form-label" for="user_country1">Choose your region</label>
          </div>
          <div class="form-floating mb-3">
            <input type="text" id="user_photo1" name="user_photo1" class="form-control" />
            <label class="form-label" for="user_photo1">Photo URL</label>
          </div>
        </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-mdb-dismiss="modal">Cancel</button>
        <button type="submit" class="btn btn-primary">Update</button>
      </div>
      </form>
    </div>
  </div>
</div>

<div class="modal fade" id="deleteUserModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">

      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Delete Radio</h5>
        <button type="button" class="btn-close" data-mdb-dismiss="modal" aria-label="Close"></button>
      </div>
      <form method="post" action="./user/delete_user" id="form-delete-user">
      <input type="hidden" id="user_id_delete" name="user_id_delete" />
      <div class="modal-body">
        <p>Delete confirmation</p>
      </div>

      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-mdb-dismiss="modal">Cancel</button>
        <button type="submit" class="btn btn-danger">Delete</button>
      </div>
      </form>
    </div>
  </div>
</div>


<!-- Modal -->
<div class="modal fade" id="detailUserModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">User Detail</h5>
        <button type="button" class="close" data-mdb-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      
      <div class="modal-body">
        <div class="container mt-4 mb-4 p-3 d-flex justify-content-center">
        <div class="card p-4">
            <div class=" image d-flex flex-column justify-content-center align-items-center"><img id = "profile-avatar" src="" height="300" width="300" />
          </button> <span id = "user_name_avatar"class="name mt-3"></span> <span id="user_id_avatar" class="idd"></span></div>
        </div>
        </div>
        <dl class="row">
          <dt class="col-sm-3">User ID</dt>
          <dd class="col-sm-9" id = "user-detail-userid"></dd>
          <dt class="col-sm-3">Email</dt>
          <dd class="col-sm-9" id = "user-detail-email"></dd>
          <dt class="col-sm-3">Name</dt>
          <dd class="col-sm-9" id = "user-detail-name"></dd>
          <dt class="col-sm-3">Username</dt>
          <dd class="col-sm-9" id = "user-detail-username"></dd>
          <dt class="col-sm-3">Country</dt>
          <dd class="col-sm-9" id = "user-detail-country"></dd>
        </dl>
        <dl class="row">
          <dt id = "current_playing" class="col-sm-12">
          </dt>
        </dl>  
        <dl class="row">
          <dt id = "playback_list" class="col-sm-12">
          </dt>
        </dl> 
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-mdb-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="newpassUserModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel"> Reset Password</h5>
        <button type="button" class="close" data-mdb-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      
      <form action="./user/user_reset_password" method="post" id="form-reset-user">
      <div class="modal-body">
          <div class="form-floating mb-3">
            <input type="password" id="user_password1" name="user_password1" class="form-control"/>
            <label class="form-label" for="user_password1">Password</label>
          </div>
          <div id = "message2"></div>
          <div class="form-floating mb-3">
            <input type="password" id="user_password2" name="user_password2" class="form-control"/>
            <label class="form-label" for="user_password2">Confirm New Password</label>
          </div>
          <div class="form-floating mb-3">
            <input type="hidden" id="user_userid1" name="user_userid1" class="form-control" />
          </div>
        </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-mdb-dismiss="modal">Cancel</button>
        <button type="submit" class="btn btn-primary">Reset Password</button>
      </div>
      </form>
    </div>
  </div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


<script id="user">



$('#user_password1, #user_password2').on('keyup', function () {
  if ($('#user_password2').val()!='')
  if ($('#user_password1').val() == $('#user_password2').val()) {
    $('#message2').html('Password Matched').css('color', 'green');
  } else 
    $('#message2').html('Password not matching').css('color', 'red');
});

$('#user_password, #user_passwordc').on('keyup', function () {
  if ($('#user_passwordc').val()!='')
  if ($('#user_password').val() == $('#user_passwordc').val()) {
    $('#message1').html('Password Matched').css('color', 'green');
  } else 
    $('#message1').html('Password not matching').css('color', 'red');
});

$(document).ready(function() {
    $(".edit-user-btn").on("click", function() {
        $td = $(this).closest("td");
        var userName = $td.children("#hidden-user-name").val();
        var userUsername = $td.children("#hidden-user-username").val();
        var userphoto = $td.children("#hidden-user-photo").val();
        var useremail = $td.children("#hidden-user-email").val();
        var usercountry = $td.children("#hidden-user-country").val();
        var useruserid = $td.children("#hidden-user-userid").val();
        var useruccid = $td.children("#hidden-user-uccid").val();
        var userpasswordhash = $td.children("#hidden-user-passwordhash").val();
        document.getElementById("user_username1").value = String(userUsername);
        document.getElementById("user_userid").value = String(useruserid);
        document.getElementById("user_name1").value = String(userName);
        document.getElementById("user_email1").value = String(useremail);
        document.getElementById("user_photo1").value = String(userphoto);
        var sel = document.getElementById('user_country1');
        var opts = sel.options;
        for (var opt, j = 0; opt = opts[j]; j++) {
          if (opt.value == String(usercountry)) {
            sel.selectedIndex = j;
            break;
          }
        }
        document.getElementById("user_country2").value = String(usercountry);
    });

    $(".newpass-user-btn").on("click", function() {
        $td = $(this).closest("td");
        var useruserid = $td.children("#hidden-user-userid").val();
        document.getElementById("user_userid1").value = String(useruserid);
    });

    $(".delete-user-btn").on("click", function() {
        $td = $(this).closest("td");
        var useruserid = $td.children("#hidden-user-userid").val();
        document.getElementById("user_id_delete").value = String(useruserid);
    });

    $(".detail-user-btn").on("click", function() {
        
        $td = $(this).closest("td");
        var userName = $td.children("#hidden-user-name").val();
        var userUsername = $td.children("#hidden-user-username").val();
        var userphoto = $td.children("#hidden-user-photo").val();
        var useremail = $td.children("#hidden-user-email").val();
        var usercountry = $td.children("#hidden-user-country").val();
        var useruccid = $td.children("#hidden-user-uccid").val();
        var userpasswordhash = $td.children("#hidden-user-passwordhash").val();
        var useruserid = $td.children("#hidden-user-userid").val();
        temp = '<p class="font-weight-bold">' + String(userName) +'</p><p class="font-weight-normal"> is currently playing </p>';
        $.post('./user/playback_list', {user_id_pb:String(useruserid)}).done(function(response){
          if (response){
            const myArray = JSON.parse(response);
            temp_str = '<div class="table-responsive">\
                <table id = "playback" class="table table-striped table-bordered table-sm">\
                <thead><tr><th class="th-sm">Artist</th><th class="th-sm">Track</th><th class="th-sm">Order</th></tr>\
                </thead><tbody>';
            for(var i = 0; i < myArray.length; i++) {
                var obj = myArray[i];
                temp_str+='<tr><td>'+obj.artist+'</td><td>'+obj.track+'</td><td>'+obj.orders+'</td></tr>';
            }
            temp += myArray[0].track+' (' + myArray[0].artist + ')'; 
            temp_str+='</tbody></table></div>';
            document.getElementById("playback_list").innerHTML = temp_str;
            document.getElementById("current_playing").innerHTML = temp;
          }
          
        });
        
        document.getElementById("user_name_avatar").innerHTML = String(userName);
        document.getElementById("user_id_avatar").innerHTML = "@" + String(useruserid);
        document.getElementById("user-detail-username").innerHTML = String(userUsername);
        document.getElementById("user-detail-userid").innerHTML = String(useruserid);
        document.getElementById("user-detail-name").innerHTML = String(userName);
        document.getElementById("user-detail-email").innerHTML = String(useremail);
        document.getElementById("profile-avatar").src = String(userphoto);
        document.getElementById("user-detail-country").innerHTML = String(usercountry);
    });
    
});
</script>
