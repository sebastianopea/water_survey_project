<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/daisyui@4.10.1/dist/full.min.css" rel="stylesheet" type="text/css" />
    <script src="https://cdn.tailwindcss.com"></script>

    <style>
        body {
            justify-content: center;
            align-items: center;
            height: 100vh;
            position: relative;
        }

        .dashboard-button {
            position: absolute;
            top: 20px;
            right: 20px;
        }

        .btn {
            background-color: #5a9;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            font-size: 1em;
            cursor: pointer;
            text-decoration: none;
        }

        .btn:hover {
            background-color: #3a6;
        }

        form {
            padding: 20px;
            height: 270px;
            width: 400px;
            margin: auto;
            margin-bottom: 50px;
            background-color: white;
            position: absolute;
            border: black 4px solid;
            border-radius: 10px;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
        }

        .label {
            font-size: 18px;
            color: black;
        }

        .bottom {
            position: absolute;
            top: calc(80% + 30px);
            left: 50%;
            transform: translateX(-50%);
            text-align: center;
            padding: 20px;
            background-color: #f0f0f0;
            border-top: 1px solid #ddd;
        }

        .bottom a {
            color: #5a9;
            text-decoration: none;
            font-weight: bold;
            margin: 0 10px;
            transition: color 0.3s ease, border-bottom 0.3s ease;
        }

        .bottom a:hover {
            color: #3a6;
            border-bottom: 2px solid #3a6;
        }

        .bottom label {
            color: #777;
            margin: 0 5px;
        }

        .error-message {
            background-color: #F87171;
            color: white;
            padding: 10px;
            border-radius: 5px;
            margin-top: 60px;
            max-width: 400px;
            position: absolute;
            top: 70%;
            left: 50%;
            transform: translate(-50%, -70%);
        }

        input[type="submit"] {
            background-color: #5a9;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            font-size: 1em;
            cursor: pointer;
            display: block;
            width: 100%;
            max-width: 200px;
        }

        input[type="submit"]:hover {
            background-color: #3a6;
        }
    </style>
</head>
<body>
<a class="block text-teal-600" href="index.php?login">
    <span class="sr-only">Home</span>
    <svg class=xmlns="http://www.w3.org/2000/svg" style="padding-top: 25px; padding-left: 25px">
        <path
                d="M0.41 10.3847C1.14777 7.4194 2.85643 4.7861 5.2639 2.90424C7.6714 1.02234 10.6393 0 13.695 0C16.7507 0 19.7186 1.02234 22.1261 2.90424C24.5336 4.7861 26.2422 7.4194 26.98 10.3847H25.78C23.7557 10.3549 21.7729 10.9599 20.11 12.1147C20.014 12.1842 19.9138 12.2477 19.81 12.3047H19.67C19.5662 12.2477 19.466 12.1842 19.37 12.1147C17.6924 10.9866 15.7166 10.3841 13.695 10.3841C11.6734 10.3841 9.6976 10.9866 8.02 12.1147C7.924 12.1842 7.8238 12.2477 7.72 12.3047H7.58C7.4762 12.2477 7.376 12.1842 7.28 12.1147C5.6171 10.9599 3.6343 10.3549 1.61 10.3847H0.41ZM23.62 16.6547C24.236 16.175 24.9995 15.924 25.78 15.9447H27.39V12.7347H25.78C24.4052 12.7181 23.0619 13.146 21.95 13.9547C21.3243 14.416 20.5674 14.6649 19.79 14.6649C19.0126 14.6649 18.2557 14.416 17.63 13.9547C16.4899 13.1611 15.1341 12.7356 13.745 12.7356C12.3559 12.7356 11.0001 13.1611 9.86 13.9547C9.2343 14.416 8.4774 14.6649 7.7 14.6649C6.9226 14.6649 6.1657 14.416 5.54 13.9547C4.4144 13.1356 3.0518 12.7072 1.66 12.7347H0V15.9447H1.61C2.39051 15.924 3.154 16.175 3.77 16.6547C4.908 17.4489 6.2623 17.8747 7.65 17.8747C9.0377 17.8747 10.392 17.4489 11.53 16.6547C12.1468 16.1765 12.9097 15.9257 13.69 15.9447C14.4708 15.9223 15.2348 16.1735 15.85 16.6547C16.9901 17.4484 18.3459 17.8738 19.735 17.8738C21.1241 17.8738 22.4799 17.4484 23.62 16.6547ZM23.62 22.3947C24.236 21.915 24.9995 21.664 25.78 21.6847H27.39V18.4747H25.78C24.4052 18.4581 23.0619 18.886 21.95 19.6947C21.3243 20.156 20.5674 20.4049 19.79 20.4049C19.0126 20.4049 18.2557 20.156 17.63 19.6947C16.4899 18.9011 15.1341 18.4757 13.745 18.4757C12.3559 18.4757 11.0001 18.9011 9.86 19.6947C9.2343 20.156 8.4774 20.4049 7.7 20.4049C6.9226 20.4049 6.1657 20.156 5.54 19.6947C4.4144 18.8757 3.0518 18.4472 1.66 18.4747H0V21.6847H1.61C2.39051 21.664 3.154 21.915 3.77 22.3947C4.908 23.1889 6.2623 23.6147 7.65 23.6147C9.0377 23.6147 10.392 23.1889 11.53 22.3947C12.1468 21.9165 12.9097 21.6657 13.69 21.6847C14.4708 21.6623 15.2348 21.9135 15.85 22.3947C16.9901 23.1884 18.3459 23.6138 19.735 23.6138C21.1241 23.6138 22.4799 23.1884 23.62 22.3947Z"
                fill="currentColor"
        />
    </svg>
</a>

<div class="dashboard-button">
    <a href="index.php?dash" class="btn">Dashboard</a>
</div>

<form class="form" action="index.php" method="post">
    <input type="hidden" name="login_attempt" value="1">
    <label class="label">Login</label>

    <label class="input input-bordered flex items-center gap-2">
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" fill="currentColor" class="w-4 h-4 opacity-70"><path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6ZM12.735 14c.618 0 1.093-.561.872-1.139a6.002 6.002 0 0 0-11.215 0c-.22.578.254 1.139.872 1.139h9.47Z" /></svg>
        <input type="text" class="grow" id="username" placeholder="Username" name="username" />
    </label>

    <br>

    <label class="input input-bordered flex items-center gap-2">
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" fill="currentColor" class="w-4 h-4 opacity-70"><path fill-rule="evenodd" d="M14 6a4 4 0 0 1-4.899 3.899l-1.955 1.955a.5.5 0 0 1-.353.146H5v1.5a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1-.5-.5v-2.293a.5.5 0 0 1 .146-.353l3.955-3.955A4 4 0 1 1 14 6Zm-4-2a.75.75 0 0 0 0 1.5.5.5 0 0 1 .5.5.75.75 0 0 0 1.5 0 2 2 0 0 0-2-2Z" clip-rule="evenodd" /></svg>
        <input type="password" class="grow" placeholder="Password" name="password"/>
    </label>

    <br>

    <div class="float-right">
        <input class="" type="submit" value="Invia credenziali">
    </div>
</form>

<div class="bottom">
    <a href="index.php?signUp">Create an account</a>
    <label> or </label>
    <a href="index.php?recover-password">Recover password</a>
</div>

<br><br><br>

<?php if (isset($successful) && $successful): ?>
<div id="success-alert" role="alert" class="rounded-lg border border-gray-100 bg-white p-2 max-w-xs mx-auto">
    <div class="flex items-start gap-2">
        <span class="text-green-600">
            <svg
                    xmlns="http://www.w3.org/2000/svg"
                    fill="none"
                    viewBox="0 0 24 24"
                    stroke-width="1.5"
                    stroke="currentColor"
                    class="h-4 w-4"
            >
                <path
                        stroke-linecap="round"
                        stroke-linejoin="round"
                        d="M9 12.75L11.25 15 15 9.75M21 12a9 9 0 11-18 0 9 9 0 0118 0z"
                />
            </svg>
        </span>

        <div class="flex-1">
            <strong class="block font-medium text-gray-900">Account created successfully</strong>
        </div>

        <button class="text-gray-500 transition hover:text-gray-600" onclick="document.getElementById('success-alert').style.display='none'">
            <span class="sr-only">Dismiss popup</span>

            <svg
                    xmlns="http://www.w3.org/2000/svg"
                    fill="none"
                    viewBox="0 0 24 24"
                    stroke-width="1.5"
                    stroke="currentColor"
                    class="h-4 w-4"
            >
                <path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12" />
            </svg>
        </button>
    </div>
</div>

<script>
    setTimeout(function() {
        document.getElementById('success-alert').style.display = 'none';
    }, 3000); // 3000 milliseconds = 3 seconds
</script>
<?php endif; ?>


<?php if(isset($login_fallito)):?>
<div class="error-message" style="display:block" id="error">Credenziali non corrette , riprova</div>
<?php endif; ?>

</body>
</html>
