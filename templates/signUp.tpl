
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign up</title>
    <link href="https://cdn.jsdelivr.net/npm/daisyui@4.10.1/dist/full.min.css" rel="stylesheet" type="text/css" />
    <script src="https://cdn.tailwindcss.com"></script>

    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        td, th{
            font-size: 15px;
        }
        #form {
            padding: 20px;
            height: 650px;
            width: 400px;
            margin: auto;
            border: black 4px solid;
            border-radius: 10px;
            background-color: white;
        }
        .label{
            font-size: 18px;
            color: black;
        }
        .error-message2 {
            display: none;
            background-color: #F87171;
            color: white;
            padding: 10px;
            border-radius: 5px;
            margin-top: 10px;
            max-width: 400px; /* Imposta la larghezza massima desiderata */
            width: auto; /* Imposta la larghezza automaticamente in base al contenuto */
            margin-left: auto; /* Centra il messaggio orizzontalmente */
            margin-right: auto;
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

        #form {
            position: relative;
            margin-top: 20px; /* Aggiunge spazio sopra il form */
            margin-left: auto; /* Allinea il form al centro */
            margin-right: auto; /* Allinea il form al centro */
        }




    </style>
</head>
<body>
<div id = "container">
    <form class="form" id="form" action="index.php" method="post" onsubmit="return validateForm()">

        <label class="label">Create an account</label>
        <label class="input input-bordered flex items-center gap-2">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" fill="currentColor" class="w-4 h-4 opacity-70"><path fill-rule="evenodd" d="M14 6a4 4 0 0 1-4.899 3.899l-1.955 1.955a.5.5 0 0 1-.353.146H5v1.5a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1-.5-.5v-2.293a.5.5 0 0 1 .146-.353l3.955-3.955A4 4 0 1 1 14 6Zm-4-2a.75.75 0 0 0 0 1.5.5.5 0 0 1 .5.5.75.75 0 0 0 1.5 0 2 2 0 0 0-2-2Z" clip-rule="evenodd" /></svg>
            <input type="text" class="grow" id="username" placeholder="E-mail" name="CreateEmail" required/>
        </label>
        <br>

        <label class="input input-bordered flex items-center gap-2">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" fill="currentColor" class="w-4 h-4 opacity-70"><path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6ZM12.735 14c.618 0 1.093-.561.872-1.139a6.002 6.002 0 0 0-11.215 0c-.22.578.254 1.139.872 1.139h9.47Z" /></svg>
            <input type="text" class="grow" id="username" placeholder="Username" name="CreateUsername" required/>
        </label>
        <br>
        <label class="input input-bordered flex items-center gap-2">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" fill="currentColor" class="w-4 h-4 opacity-70"><path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6ZM12.735 14c.618 0 1.093-.561.872-1.139a6.002 6.002 0 0 0-11.215 0c-.22.578.254 1.139.872 1.139h9.47Z" /></svg>
            <input type="text" class="grow" id="username" placeholder="Name" name="CreateName" required/>
        </label>
        <br>
        <label class="input input-bordered flex items-center gap-2">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" fill="currentColor" class="w-4 h-4 opacity-70"><path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6ZM12.735 14c.618 0 1.093-.561.872-1.139a6.002 6.002 0 0 0-11.215 0c-.22.578.254 1.139.872 1.139h9.47Z" /></svg>
            <input type="text" class="grow" id="username" placeholder="Surname" name="CreateSurname" required/>
        </label>
        <br>
        <label class="input input-bordered flex items-center gap-2">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" fill="currentColor" class="w-4 h-4 opacity-70"><path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6ZM12.735 14c.618 0 1.093-.561.872-1.139a6.002 6.002 0 0 0-11.215 0c-.22.578.254 1.139.872 1.139h9.47Z" /></svg>
            <input type="date" class="grow" id="username" placeholder="Date of birth" name="CreateDateOfBirth" required/>
        </label>
        <br>
        <label class="input input-bordered flex items-center gap-2">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" fill="currentColor" class="w-4 h-4 opacity-70"><path fill-rule="evenodd" d="M14 6a4 4 0 0 1-4.899 3.899l-1.955 1.955a.5.5 0 0 1-.353.146H5v1.5a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1-.5-.5v-2.293a.5.5 0 0 1 .146-.353l3.955-3.955A4 4 0 1 1 14 6Zm-4-2a.75.75 0 0 0 0 1.5.5.5 0 0 1 .5.5.75.75 0 0 0 1.5 0 2 2 0 0 0-2-2Z" clip-rule="evenodd" /></svg>
            <input type="password" class="grow" id="password" placeholder="Password" name="CreatePassword" required/>
        </label>
        <br>
        <label class="input input-bordered flex items-center gap-2">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" fill="currentColor" class="w-4 h-4 opacity-70"><path fill-rule="evenodd" d="M14 6a4 4 0 0 1-4.899 3.899l-1.955 1.955a.5.5 0 0 1-.353.146H5v1.5a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1-.5-.5v-2.293a.5.5 0 0 1 .146-.353l3.955-3.955A4 4 0 1 1 14 6Zm-4-2a.75.75 0 0 0 0 1.5.5.5 0 0 1 .5.5.75.75 0 0 0 1.5 0 2 2 0 0 0-2-2Z" clip-rule="evenodd" /></svg>
            <input type="password" class="grow" id="confirm_password" placeholder="Confirm password" name="confirm_password" required/>
        </label>
        <br>
        <div class="float-right">
            <input class="" type="submit" value="Create account">
        </div>

    </form>
    <br>
    <br>


    <?php if (isset($successful) && !$successful): ?>
    <div hidden="hidden" id = "successful"><?=$successful?></div>
    <div id="error-alert" role="alert" class="rounded border-s-4 border-red-500 bg-red-50 p-4" style="position: absolute; top: 0; left: 50%; transform: translateX(-50%); max-width: 400px; margin-left: -200px;">    <div class="flex items-center gap-2 text-red-800">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" class="h-5 w-5" style="flex-shrink: 0;">
                <path
                        fill-rule="evenodd"
                        d="M9.401 3.003c1.155-2 4.043-2 5.197 0l7.355 12.748c1.154 2-.29 4.5-2.599 4.5H4.645c-2.309 0-3.752-2.5-2.598-4.5L9.4 3.003zM12 8.25a.75.75 0 01.75.75v3.75a.75.75 0 01-1.5 0V9a.75.75 0 01.75-.75zm0 8.25a.75.75 0 100-1.5.75.75 0 000 1.5z"
                        clip-rule="evenodd"
                />
            </svg>

            <strong class="block font-medium" style="flex-grow: 1;"> Something went wrong </strong>
        </div>

        <p class="mt-2 text-sm text-red-700" style="flex-grow: 1; margin-bottom: 0;">
            An account already exists with this email address. If this is you, log in!
        </p>
    </div>
    <?php endif; ?>

</div>
<div class="error-message2" id="password-error">Passwords do not match</div>
</body>
</html>
<script>
    function validateForm() {
        var password = document.getElementById("password").value;
        var confirm_password = document.getElementById("confirm_password").value;
        var errorMessage = document.getElementById("password-error");
        var successful = document.getElementById("successful");
        if (password !== confirm_password) {
            errorMessage.style.display = "block";
            document.getElementById("form").style.marginTop = 2000px
            return false;
        }
        if (successful == false){
            document.getElementById("form").style.marginTop = 2000px

        }

        errorMessage.style.display = "none";
        return true;
    }

</script>
