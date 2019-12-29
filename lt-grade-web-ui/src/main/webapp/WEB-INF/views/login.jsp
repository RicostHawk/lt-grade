<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

    <!-- Loding font -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:300,700" rel="stylesheet">

    <!-- Custom Styles -->
    <link rel="stylesheet" type="text/css" href="/static/assets/css/usercommit.css">

    <title>登录 - 风叶</title>
</head>
<body>

<!-- Backgrounds -->

<div id="login-bg" class="container-fluid">

    <div class="bg-login"></div>
    <div class="bg-color"></div>
</div>

<!-- End Backgrounds -->

<div class="container" id="login">
    <div class="row justify-content-center">
        <div class="col-lg-8">
            <div class="login">

                <h1>登 录</h1>

                <!-- Loging form -->
                <form action="/login" method="post">
                    <div class="form-group">
                        <input type="email" class="form-control" id="exampleInputEmail1" name="email" aria-describedby="emailHelp" placeholder="Enter email" value="${email}">

                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control" id="exampleInputPassword1" name="password" placeholder="Password" value="${password}">
                    </div>

                    <div class="form-check">

                        <label class="switch">
                            <input type="checkbox" name="isRemember" ${isRemember == true ? "checked" : ""}>
                            <span class="slider round"></span>
                        </label>
                        <p class="">记住我</p>
                        <br>
                        <label class="forgot-password"><a href="/forget">忘记密码</a></label>

                    </div>

                    <br>
                    <button type="submit" class="btn btn-lg btn-block btn-success">登录</button>
                </form>
                <!-- End Loging form -->
                <hr>
                <div class="text-center">
                    <a class="small" href="/register">没有账号？注册</a>
                </div>
            </div>More Templates
        </div>
    </div>
</div>


</body>
</html>
