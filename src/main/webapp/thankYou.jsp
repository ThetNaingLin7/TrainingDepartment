<jsp:useBean id="register_course" class="model.Course" scope="request"/>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thank You Page</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
        integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />

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

        /* Nav bar start */

        header {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            padding: 20px 100px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            z-index: 99;
        }

        .logo {
            font-size: 2rem;
            color: #fff;
            user-select: none;
        }

        .navigation a {
            position: relative;
            font-size: 1.1em;
            text-decoration: none;
            margin-left: 40px;
            color: #fff;
            font-weight: 1000;
        }

        .navigation a::after {
            content: '';
            position: absolute;
            left: 0;
            bottom: -7px;
            width: 100%;
            height: 3px;
            background: #fff;
            border-radius: 5px;
            transform-origin: right;
            transform: scaleX(0);
            transition: transform .5s;
        }

        .navigation a:hover::after {
            transform-origin: left;
            transform: scaleX(1);
        }

        /* Nav Bar end  */
    </style>

</head>

<body>

    <header>
        <h2 class="logo"><i class="fa-solid fa-graduation-cap fa-xl"></i></h2>
        <nav class="navigation">
            <a href="home.html">Home</a>
            <a href="training">Course Registration</a>
        </nav>
    </header>

    <div class="w-75">

        <div class="text-white text-center">
            <h2>Thanks for Registration</h2>
            <h4>We will send details information about the selected course to your registered email.
                Have a nice day.</h4>
        </div>

        <table class="table table-striped table-dark table-hover table-bordered mt-5">
            <thead>
                <tr>
                    <th scope="col">Register Name</th>
                    <th scope="col">Register Course</th>
                    <th scope="col">Register City</th>
                    <th scope="col">Register Email</th>
                </tr>
            </thead>
            <tbody class="table-group-divider">
                <tr>
                    <td>
                        <jsp:getProperty name="register_course" property="userName" />
                    </td>
                    <td>
                        <jsp:getProperty name="register_course" property="selectedCourse" />
                    </td>
                    <td>
                        <jsp:getProperty name="register_course" property="userCity" />
                    </td>
                    <td>
                        <jsp:getProperty name="register_course" property="userEmail" />
                    </td>
                </tr>
            </tbody>
        </table>
        
        <div class="col-3 mx-auto mt-5">
            <a class="btn btn-info btn-lg" href="home.html" role="button">Back to Home Page</a>
        </div>
    </div>

</body>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
    crossorigin="anonymous"></script>

</html>