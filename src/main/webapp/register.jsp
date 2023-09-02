<%@include  file="/css/CSS.jsp" %>
<link rel="stylesheet" href="css/login.css">
<title>Register  |  ElectroNet  </title>
<style>
    .input{
        width: 100%;
        padding: 10px 0;
        margin: 2px 0;
        border-bottom: 1px solid#999;
        outline: none;
        letter-spacing: 2px;
        padding-left: 10px;
        border-radius: 10px

    }
    .logo{
        margin-top: 0px;
    }
    .logo-name{
        display: inline-block;
        margin-top: 11px;
    }
</style>
<body background="./img/bg.png" >
    <div class="loginform">
        <div class="logo">
            <img class="logo-img" src="./img/logo.png" alt="">
            <p class="logo-name" >ElectroNet.in</p>
        </div>
        <form id="user" class="register" action="register" method="post">
            <input type="text" class="input" placeholder="Enter Meter Number" name="meter" required="">
            <input type="text" class="input" placeholder="Enter Full Name" name="fullname" required="">
            <input type="text" class="input" placeholder="Enter Username" name="uname" required="">
            <input type="text" class="input" placeholder="Create a Password" name="upass" required="">
            <span style="    margin-top: 20px; font-size: larger;" >already user ?  <a href="index.jsp"> Login here </a></span><br>
            <input type="submit" class="btnsubp" value=REGISTER>
        </form>
    </div>
</body>