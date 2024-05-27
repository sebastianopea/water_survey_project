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
        .label{
            font-size: 18px;
            color: black;
        }
        .bottom {
            position: absolute;
            top: 70%;
            left: 50%;
            transform: translate(-50%, -70%);
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
    </style>

</head>
<body>


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
    <label> or go to </label><a href="index.php?dash">Dashboard</a>
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