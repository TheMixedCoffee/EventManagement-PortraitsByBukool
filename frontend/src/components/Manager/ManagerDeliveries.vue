<template>
    <div class="wrapper d-flex align-items-stretch">
        <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="../../pages/css/style.css">
        <nav id="sidebar" style="background-color: #001a33;">
            <div class="p-4">
                <h1><a href="" class="logo"><img src="../../../public/pages/img/sunlogo(original).png" width="100%" alt=""></a></h1>
                <div class="mb-5">
                    <ul class="list-unstyled components mb-5">
                        <li>
                            <a href="/manager/events"><span class="fa fa-calendar mr-3"></span> Events</a>
                        </li>
                        <li>
                            <a href="/manager/suppliers"><span class="fa fa-handshake-o mr-3"></span>Suppliers</a>
                        </li>
                        <li class="active">
                            <a href="/manager/deliveries"><span class="fa fa-truck mr-3"></span> Deliveries</a>
                        </li>
                        <li>
                            <a href="/manager/employees"><span class="fa fa-users mr-3"></span> Employees</a>
                        </li>
                        <li>
                            <a href="/manager/inbox"><span class="fa fa-inbox mr-3"></span>  Inbox</a>
                        </li>
                    </ul>
                </div>
                <div class="footer">
                    <ul class="list-unstyled components mb-5">
                        <li>
                            <a href="/"><span class="fa fa-sign-out mr-3"></span> Logout</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- Page Content  -->
    <div id="content" class="p-4 p-md-5 pt-5">
        <div>
          <h1>Deliveries</h1>
        </div>
      </div>
  </div>
</template>