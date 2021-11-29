<?php 

class Track extends Controller {
    public $trackModel;

    public function __construct() {
        $this->trackModel = $this->model('trackModel');
    }

    public function sayHi() {
        $info = [
            "title"=>"Track and Playlist Management page",
            "page"=>"track"
        ];
        $data = [
            "qr_systemPlaylist"=>"",
            "qr_userPlaylist"=>""
        ];

        // Get System Playlist
        $qr_systemPlaylist = json_decode($this->trackModel->getSystemPlaylist(), true);

        // Get tracks in System Playlist
        foreach ($qr_systemPlaylist as $row) {
            $qr_trackList = json_decode($this->trackModel->getTrackList($row['ID']), true);
            $data[$row['ID']] = $qr_trackList;
        }

        // Get User Playlist
        $qr_userPlaylist = json_decode($this->trackModel->getUserPlaylist(), true);

        // Get tracks in User Playlist
        foreach ($qr_userPlaylist as $row) {
            // echo $row['ID'].'</br>';
            $qr_trackList = json_decode($this->trackModel->getTrackList($row['ID']), true);

            // print_r($qr_trackList);

            $data[$row['ID']] = $qr_trackList;
        }

        $data["qr_systemPlaylist"] = $qr_systemPlaylist;
        $data["qr_userPlaylist"] = $qr_userPlaylist;

        
        $view_data = $info + $data;
        // default action is login
        $this->view("master3", $view_data);
    }

    public function editPlaylist($playlistID) {

        $info = [
            "title"=>"Track and Playlist Management page",
            "page"=>"editPlaylist"
        ];
        $data = [];

        $qr_playlistInfo = json_decode($this->trackModel->getPlaylist($playlistID, true));

        $data['playlistInfo'] = $qr_playlistInfo;

        $view_data = $info + $data;
        $this->view("master3", $view_data);

    }

    public function changePlaylistInfoInDatabase($playlistID) {

        $info = [
            "title"=>"Track and Playlist Management page",
            "page"=>"editPlaylist"
        ];
        $data = [];

        // Get data from admin
        if ( isset($_POST['btnSubmitEdit']) ) {
            $name = $_POST['playlistName'];
            $photo = $_POST['playlistPhotoDir'];
        }

        // Change in database
        $res = json_decode($this->trackModel->updatePlaylistInfo($name, $photo, $playlistID), true);
        $data['res'] = $res;

        $view_data = $info + $data;

        // Thông báo update thành công hay thất bại
        $this->view("master3", $view_data);
    }

    public function editTrackInPlaylist($playlistID) {

        $info = [
            "title"=>"Track and Playlist Management page",
            "page"=>"editPlaylist"
        ];
        $data = [];

        $qr_trackList = json_decode($this->trackModel->getTrackList($playlistID), true);

        foreach ($qr_trackList as $track) {
            // echo '--------------</br>';

            $track_info = json_decode($this->trackModel->getReleaseAndArtistInfoFromTrack($track['ID']), true);

            $track_title = [];
            $track_artist = [];
            foreach ($track_info as $t) {

                // echo $t['RTitle'].' , '.$t['AName'].'</br>';

                if (!in_array($t['RTitle'], $track_title)) {
                    $track_title[] = $t['RTitle'];
                }
                if (!in_array($t['AName'], $track_artist)) {
                    $track_artist[] = $t['AName'];
                }
            } 

            $data[$track['ID'].'Titles'] = $track_title;
            $data[$track['ID'].'Artists'] = $track_artist;

            // print_r($data); echo '</br>';

            // foreach ($data[$track['ID'].'Artists'] as $obj) {
            //     echo $obj.'</br>';
            // } 
            // echo '--------------</br>';

        }

        $data['trackListEdit'] = $qr_trackList;
        $data['playlist_ID'] = $playlistID;

        $view_data = $info + $data;

        $this->view("master3", $view_data);

    }

    public function addTrack($playlistID) {
        $info = [
            "title"=>"Track and Playlist Management page",
            "page"=>"editPlaylist"
        ];
        $data = [];

        $qr_trackList = json_decode($this->trackModel->getAllTrack(), true);
        $qr_trackListInPlaylist = json_decode($this->trackModel->getTrackList($playlistID), true);
        $max_order = json_decode($this->trackModel->getMaxOrders($playlistID), true);

        foreach ($qr_trackList as $track) {
            // echo '--------------</br>';

            $track_info = json_decode($this->trackModel->getReleaseAndArtistInfoFromTrack($track['ID']), true);

            $track_title = [];
            $track_artist = [];
            foreach ($track_info as $t) {

                // echo $t['RTitle'].' , '.$t['AName'].'</br>';

                if (!in_array($t['RTitle'], $track_title)) {
                    $track_title[] = $t['RTitle'];
                }
                if (!in_array($t['AName'], $track_artist)) {
                    $track_artist[] = $t['AName'];
                }
            } 

            $data[$track['ID'].'Titles'] = $track_title;
            $data[$track['ID'].'Artists'] = $track_artist;

            // print_r($data); echo '</br>';

            // foreach ($data[$track['ID'].'Artists'] as $obj) {
            //     echo $obj.'</br>';
            // } 
            // echo '--------------</br>';

        }

        $data['trackInPlaylist'] = $qr_trackListInPlaylist;
        $data['allTrack'] = $qr_trackList;
        $data['playlist_ID'] = $playlistID;
        

        if ($max_order['MaxOrders'] == null) {
            $max_order['MaxOrders'] = 0;
        }

        $data['MaxOrders'] = $max_order;

        $view_data = $info + $data;

        $this->view("master3", $view_data);

    }

    public function addTrackToPlaylistInDatabase($playlistID, $trackID, $orders) {
        $info = [
            "title"=>"Track and Playlist Management page",
            "page"=>"editPlaylist"
        ];
        $data = [];

        $res = json_decode($this->trackModel->insertTrackToPlaylist($trackID, $playlistID, $orders + 1), true);
        $qr_trackListInPlaylist = json_decode($this->trackModel->getTrackList($playlistID), true);
        $qr_trackList = json_decode($this->trackModel->getAllTrack(), true);
        $max_order = json_decode($this->trackModel->getMaxOrders($playlistID), true);

        foreach ($qr_trackList as $track) {
            // echo '--------------</br>';

            $track_info = json_decode($this->trackModel->getReleaseAndArtistInfoFromTrack($track['ID']), true);

            $track_title = [];
            $track_artist = [];
            foreach ($track_info as $t) {

                // echo $t['RTitle'].' , '.$t['AName'].'</br>';

                if (!in_array($t['RTitle'], $track_title)) {
                    $track_title[] = $t['RTitle'];
                }
                if (!in_array($t['AName'], $track_artist)) {
                    $track_artist[] = $t['AName'];
                }
            } 

            $data[$track['ID'].'Titles'] = $track_title;
            $data[$track['ID'].'Artists'] = $track_artist;

            // print_r($data); echo '</br>';

            // foreach ($data[$track['ID'].'Artists'] as $obj) {
            //     echo $obj.'</br>';
            // } 
            // echo '--------------</br>';

        }

        $data['res_insert'] = $res;
        $data['allTrack'] = $qr_trackList;
        $data['trackInPlaylist'] = $qr_trackListInPlaylist;
        $data['playlist_ID'] = $playlistID;
        $data['MaxOrders'] = $max_order;

        $view_data = $info + $data;

        $this->view("master3", $view_data);

    }

    public function deleteTrack($trackID, $playlistID) {

        $info = [
            "title"=>"Track and Playlist Management page",
            "page"=>"editPlaylist"
        ];
        $data = [];

        $res = json_decode($this->trackModel->deleteTrackInPlaylist($trackID, $playlistID), true);
        $qr_trackList = json_decode($this->trackModel->getTrackList($playlistID), true);

        foreach ($qr_trackList as $track) {
            // echo '--------------</br>';

            $track_info = json_decode($this->trackModel->getReleaseAndArtistInfoFromTrack($track['ID']), true);

            $track_title = [];
            $track_artist = [];
            foreach ($track_info as $t) {

                // echo $t['RTitle'].' , '.$t['AName'].'</br>';

                if (!in_array($t['RTitle'], $track_title)) {
                    $track_title[] = $t['RTitle'];
                }
                if (!in_array($t['AName'], $track_artist)) {
                    $track_artist[] = $t['AName'];
                }
            } 

            $data[$track['ID'].'Titles'] = $track_title;
            $data[$track['ID'].'Artists'] = $track_artist;

            // print_r($data); echo '</br>';

            // foreach ($data[$track['ID'].'Artists'] as $obj) {
            //     echo $obj.'</br>';
            // } 
            // echo '--------------</br>';

        }

        $data['delete_res'] = $res;
        $data['trackListEdit'] = $qr_trackList;
        $data['playlist_ID'] = $playlistID;

        $view_data = $info + $data;

        $this->view("master3", $view_data);
    }

    public function liveSearch($playlistID) {
        $info = [
            "title"=>"Track and Playlist Management page",
            "page"=>"editPlaylist"
        ];
        $data = [];

        // Get data from admin
        if ( isset($_POST['btnSubmitLiveSearch']) ) {
            $search = $_POST['liveSearchEditText'];
        }

        if ($search == "") {
            $qr_trackSearch = json_decode($this->trackModel->getAllTrack(), true);
        }
        else {
            $qr_trackSearch = json_decode($this->trackModel->getLiveSearchResult($search), true);
        }

        $max_order = json_decode($this->trackModel->getMaxOrders($playlistID), true);
        $qr_trackListInPlaylist = json_decode($this->trackModel->getTrackList($playlistID), true);

        foreach ($qr_trackSearch as $track) {

            // echo '----------</br>';

            $track_info = json_decode($this->trackModel->getReleaseAndArtistInfoFromTrack($track['ID']), true);
            $track_title = [];
            $track_artist = [];
            foreach ($track_info as $t) {

                // echo $t['TName'].' , '.$t['RTitle'].' , '.$t['AName'].'</br>';

                if (!in_array($t['RTitle'], $track_title)) {
                    $track_title[] = $t['RTitle'];
                }
                if (!in_array($t['AName'], $track_artist)) {
                    $track_artist[] = $t['AName'];
                }
            } 

            $data[$track['ID'].'Titles'] = $track_title;
            $data[$track['ID'].'Artists'] = $track_artist;

        }

        $data['allTrack'] = $qr_trackSearch;
        $data['playlist_ID'] = $playlistID;
        $data['MaxOrders'] = $max_order;
        $data['trackInPlaylist'] = $qr_trackListInPlaylist;
        $data['searchFlag'] = true;

        $view_data = $info + $data;
        $this->view("master3", $view_data);

    }

    public function deleteSystemPlaylist($playlistID) {
        $info = [
            "title"=>"Track and Playlist Management page",
            "page"=>"track"
        ];
        $data = [];

        $res = json_decode($this->trackModel->deleteSystemPlaylist($playlistID), true);

        // Get System Playlist
        $qr_systemPlaylist = json_decode($this->trackModel->getSystemPlaylist(), true);
        
        // Get User Playlist
        $qr_userPlaylist = json_decode($this->trackModel->getUserPlaylist(), true);

        $data["qr_systemPlaylist"] = $qr_systemPlaylist;
        $data["qr_userPlaylist"] = $qr_userPlaylist;
        $data["deletePlaylist_res"] = $res;

        $view_data = $info + $data;

        $this->view("master3", $view_data);

    }

    public function openAddSystemPlaylistForm() {
        $info = [
            "title"=>"Track and Playlist Management page",
            "page"=>"track"
        ];
        $data['openFormAddSystemPlaylist'] = true;

        $view_data = $info + $data;
        $this->view("master3", $view_data);

    }

    public function addSystemPlaylist(){
        $info = [
            "title"=>"Track and Playlist Management page",
            "page"=>"track"
        ];
        $data = [];

        if ( isset($_POST['btnSubmitAddSystemPlaylist']) ) {
            $name = $_POST['playlistName'];
            $photo = $_POST['playlistPhotoDir'];
        }

        $res = json_decode($this->trackModel->insertNewSystemPlaylist($name, $photo), true);

         // Get System Playlist
        $qr_systemPlaylist = json_decode($this->trackModel->getSystemPlaylist(), true);

        // Get User Playlist
        $qr_userPlaylist = json_decode($this->trackModel->getUserPlaylist(), true);


        $data["qr_systemPlaylist"] = $qr_systemPlaylist;
        $data["qr_userPlaylist"] = $qr_userPlaylist;
        $data['insertSystemPlaylist_res'] = $res;

        $view_data = $info + $data;

        $this->view("master3", $view_data);

    }
}

?>