<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Water Quality Survey</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            color: #333;
            margin: 0;
            padding: 20px;
            justify-content: center;
            position: relative;
        }

        h1 {
            text-align: center;
            color: #5a9;
        }

        p {
            text-align: center;
            font-size: 1.2em;
            margin-bottom: 30px;
        }

        form {
            margin: auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 600px;
        }

        fieldset {
            border: none;
            margin-bottom: 20px;
        }

        legend {
            font-size: 1.5em;
            color: #5a9;
            margin: auto;
        }

        label {
            display: block;
            margin-bottom: 10px;
        }

        input[type="text"],
        input[type="email"],
        textarea,
        select {
            width: calc(100% - 22px);
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 1em;
        }

        input[type="radio"],
        input[type="checkbox"] {
            margin-right: 10px;
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
            margin: 20px auto 0;
        }

        input[type="submit"]:hover {
            background-color: #48a;
        }
    </style>
</head>
<body>
<h1>Water Quality Survey</h1>
<br>
<p>We appreciate your participation in this survey about the water quality in your area. Your feedback is valuable and will help us improve our services.</p>
<br>
<form action="/submit-survey" method="POST">
    <fieldset>
        <label for="location">Location:</label>
        <input type="text" id="location" name="location" required>
    </fieldset>
    <br>
    <fieldset>
        <legend>Water Quality Questions</legend>

        <p>1. How would you rate the overall quality of the tap water in your area?</p>
        <label><input type="radio" name="overall_quality" value="excellent"> Excellent</label>
        <label><input type="radio" name="overall_quality" value="good"> Good</label>
        <label><input type="radio" name="overall_quality" value="fair"> Fair</label>
        <label><input type="radio" name="overall_quality" value="poor"> Poor</label>

        <p>2. Have you noticed any unusual taste or odor in the tap water?</p>
        <label><input type="checkbox" name="issues[]" value="taste"> Unusual taste</label>
        <label><input type="checkbox" name="issues[]" value="odor"> Unusual odor</label>
        <label><input type="checkbox" name="issues[]" value="none"> No issues</label>

        <p>3. How frequently do you use tap water for drinking?</p>
        <select name="frequency">
            <option value="always">Always</option>
            <option value="often">Often</option>
            <option value="sometimes">Sometimes</option>
            <option value="rarely">Rarely</option>
            <option value="never">Never</option>
        </select>

        <p>4. Do you use any water filtration systems at home?</p>
        <label><input type="radio" name="filtration" value="yes"> Yes</label>
        <label><input type="radio" name="filtration" value="no"> No</label>

        <p>5. If yes, what type of filtration system do you use?</p>
        <textarea name="filtration_details" rows="4" cols="50" placeholder="Please specify the type of filtration system"></textarea>
    </fieldset>

    <fieldset>
        <legend>Additional Comments</legend>
        <label for="comments">Do you have any additional comments or suggestions?</label>
        <textarea id="comments" name="comments" rows="4" cols="50"></textarea>
    </fieldset>

    <input type="submit" value="Submit Survey">
</form>
</body>
</html>



