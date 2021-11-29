<!-- Sidebar -->
<nav
      id="sidebarMenu"
      class="collapse d-lg-block sidebar collapse bg-white"
      >
  <div class="position-sticky">
    <div class="list-group list-group-flush mx-3 mt-4">
      <a
          href="."
          class="list-group-item list-group-item-action py-2 ripple <?php if ($data['page'] === 'home') echo 'active'?>"
          aria-current="true"
          >
        <i class="fas fa-tachometer-alt fa-fw me-3"></i><span>Main dashboard</span>
      </a>
      <a
          href="./user"
          class="list-group-item list-group-item-action py-2 ripple <?php if ($data['page'] === 'user') echo 'active'?>"
          aria-current="true"
          >
        <i class="fas fa-users fa-fw me-3"></i><span>User</span>
      </a>
      <a
          href="./track"
          class="list-group-item list-group-item-action py-2 ripple <?php if ($data['page'] === 'track') echo 'active'?>"
          >
        <i class="fas fa-music fa-fw me-3"></i><span>Track & Playlist</span>
      </a>
      <a
          href="./radio"
          class="list-group-item list-group-item-action py-2 ripple <?php if ($data['page'] === 'radio') echo 'active'?>"
          >
        <i class="fas fa-broadcast-tower fa-fw me-3"></i><span>Radio & Producer</span>
      </a>
      <a
          href="./ticket"
          class="list-group-item list-group-item-action py-2 ripple <?php if ($data['page'] === 'ticket') echo 'active'?>"
          >
        <i class="fas fa-comments fa-fw me-3"></i><span>Ticket</span>
      </a>
    </div>
  </div>
</nav>
<!-- Sidebar -->