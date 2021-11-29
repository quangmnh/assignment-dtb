<!DOCTYPE html>
<html lang="en">
<head>
  <base href="http://localhost/assignment-dtb/">  <!--  Fix the domain when deploy on the server -->
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title> <?php echo $data['title']?> </title>
  <!-- Font Awesome -->
  <link
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css"
    rel="stylesheet"
  />
  <!-- Google Fonts -->
  <link
    href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
    rel="stylesheet"
  />
  <!-- MDB -->
  <link
    href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.6.0/mdb.min.css"
    rel="stylesheet"
  />
  <link 
    href="./public/css/main.css"
    rel="stylesheet" 
  />
  <link 
    href="./public/css/admin.css"
    rel="stylesheet" 
  />
  
</head>
<body>
  <header>
    <!-- nav bar -->
    <?php require_once "./mvc/views/blocks/navbar.php"; ?>
    <!-- side bar -->
    <?php require_once "./mvc/views/blocks/sidebar.php"; ?>  
  </header>
  
  <div class="container">
  <!-- Contents -->
    <main>
      <?php require_once "./mvc/views/pages/".$data["page"].".php"; ?>
    </main>
  </div>
  
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.6.0/mdb.min.js"></script>
  <!-- Lazy load: to use this put img src in data-src attributes nad use class "lazy" -->
  <script src="https://cdn.jsdelivr.net/npm/vanilla-lazyload@17.5.0/dist/lazyload.min.js"></script>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
</body>
</html>