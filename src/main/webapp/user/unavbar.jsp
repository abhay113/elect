<style>
    button .blue{
        background: #0dcaf0;
    }  
</style>
<nav class=" navbar navbar-expand-lg py-3 navbar-dark shadow-sm" style="
     background-color: #902bf5;">
    <div class="container">
        <a href="uhome.jsp" class="navbar-brand">
            <!-- Logo Image -->
            <img src="../img/logo.png" width="45" alt="" class="logo1 d-inline-block align-middle mr-2" style="
                 border: 2px solid #902bf5;
                 border-radius: 60%;">
            <span class=" font-weight-bold">  ElectroNet  </span>
        </a>
        <div id="navbarSupportedContent" class="collapse navbar-collapse">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <div class="dropdown">
                        <button class="btn btn-primary  ml-2 dropdown-toggle " type="button" data-bs-toggle="dropdown" aria-expanded="false">
                            My Info 
                        </button>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="myinfo.jsp">View Details</a></li>
                            <li><a class="dropdown-item" href="update.jsp"> Update Details</a></li>
                        </ul>
                    </div>
                </li><li class="nav-item">
                    <div class="dropdown">
                        <button class="btn btn-primary dropdown-toggle blue" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                            Bill
                        </button>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="paybill.jsp">Pay Bill</a></li>
                            <li><a class="dropdown-item" href="viewbill.jsp">View Bill</a></li>
                        </ul>
                    </div>
                </li>
                <li class="nav-item blue"><a href="complaint.jsp" class="nav-link">Complaints</a></li>
                <li class="nav-item blue"><a href="../Logout " class="nav-link">Log Out</a></li>
            </ul>
        </div>
    </div>
</nav>
