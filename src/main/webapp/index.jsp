<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

<style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background: url('./background.jpg') no-repeat;
            background-size: cover;
            background-position: center;
        }

        /* Login form start  */

        .wrapper {
            position: relative;
            width: 400px;
            height: 440px;
            background: transparent;
            border: 2px solid rgba(255, 255, 255, .5);
            border-radius: 20px;
            backdrop-filter: blur(20px);
            box-shadow: 0 0 30px rgba(0, 0, 0, .5);
            display: flex;
            justify-content: center;
            align-items: center;
            color: #fff;
        }

        .wrapper .form-box {
            width: 100%;
            padding: 40px;
        }


        .form-box h2 {
            font-size: 2em;
            color: #fff;
            text-align: center;
        }

        .input-box {
            position: relative;
            width: 100%;
            height: 50px;
            border-bottom: 2px solid #fff;
            margin: 30px 0;
        }

        .input-box label {
            position: absolute;
            top: 50%;
            left: 5px;
            transform: translateY(-50%);
            font-size: 1em;
            color: #fff;
            pointer-events: none;
            transition: .5s;
        }

        .input-box input:focus~label,
        .input-box input:valid~label {
            top: -5px;
        }

        .input-box input {
            width: 100%;
            height: 100%;
            background: transparent;
            border: none;
            outline: none;
            color: #fff;
            font-size: 1em;
            font-weight: 700;
            padding: 0 35px 0 5px;
        }

        .input-box .icon {
            position: absolute;
            right: 8px;
            font-size: 1.2em;
            color: #fff;
            line-height: 57px;
        }


        .btn {
            width: 100%;
            height: 45px;
            background: #162938;
            outline: none;
            border: none;
            border-radius: 5px;
            color: #fff;
            font-size: 1em;
            font-weight: 700;
            cursor: pointer;
        }
    </style>
</head>

<body>

<div class="wrapper">
        <div class="form-box login">

            <h2>Login</h2>

            <form action = "login" method = "post">
                <div class="input-box">
                   <span class="icon"><ion-icon name="mail"></ion-icon></span>
                    <input type="text" name = "userName" required>
                    <label>Name</label>
                </div>

                <div class="input-box">
                  <span class="icon"><ion-icon name="lock-closed"></ion-icon></span>
                    <input type="password" name = "userPassword" required>
                    <label>Password</label>
                </div>

                <button type="submit" class="btn">Login</button>
				
				<br><br>
				<p class="text-center text-danger">Note - You can enter as user by entering anything in text box! (Admin account is already set up)</p>
				
            </form>
        </div>
</div>


</body>
</html>