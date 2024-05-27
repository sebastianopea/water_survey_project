<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/daisyui@4.10.1/dist/full.min.css" rel="stylesheet" type="text/css" />
    <script src="https://cdn.tailwindcss.com"></script>
    <title>Thank You</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            color: #333;
            margin: 0;
            padding: 0;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .thank-you-container {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
            width: 100%;
            max-width: 600px;
            margin: auto;
        }

        h1 {
            color: #5a9;
        }

        p {
            font-size: 1.2em;
            margin-bottom: 30px;
        }

        .home-button {
            background-color: #5a9;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            font-size: 1em;
            cursor: pointer;
            text-decoration: none;
        }

        .home-button:hover {
            background-color: #48a;
        }
    </style>
</head>
<body>
<div class="thank-you-container">
    <h1>Thank You!</h1>
    <p>We appreciate your time and effort in completing the survey. Your feedback is valuable to us.</p>
    <br>
    <a href="index.php?dash" class="home-button">Return to Dashboard</a>
</div>
</body>
</html>
