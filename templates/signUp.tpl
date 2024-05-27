
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
        .error-message {
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
        .successful-message {
            background-color: #3fcb07;
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

    </style>
</head>
<body>
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
<div class="error-message" style="display:block" id="error">User already exists</div>
<?php endif; ?>
<div class="error-message2" id="password-error">Passwords do not match</div>
</body>
</html>
<script>
    function validateForm() {
        resetPopUp();
        var password = document.getElementById("password").value;
        var confirm_password = document.getElementById("confirm_password").value;
        console.log(password,confirm_password)
        var errorMessage = document.getElementById("password-error");
        if (password !== confirm_password) {
            errorMessage.style.display = "block";
            return false;
        }

        errorMessage.style.display = "none";
        return true;
    }
    function resetPopUp() {
        var errorMessage = document.getElementById("error");
        var successfulMessage = document.getElementById("successful");
        if (errorMessage !== null) {
            errorMessage.style.display = "none";
        }

        if (successfulMessage !== null) {
            successfulMessage.style.display = "none";
        }
    }
</script>