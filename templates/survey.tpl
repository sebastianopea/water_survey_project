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
<form action="index.php" method="post">
    <fieldset>
        <label for="location">Location:</label>
        <input type="text" id="location" name="location" required>
    </fieldset>
    <br>
    <fieldset>
        <legend>Water Quality Questions</legend>

        <?php
        foreach ($questions as $question) {
            $questionId = $question['id'];
            $questionText = $question['questionText'];
            $questionType = $question['questionType'];
            if ($questionId == 6) {
                echo '<legend>Additional Comments</legend>';
        echo '<label for="comments">Do you have any additional comments or suggestions?</label>';
        echo '<textarea id="comments" name="comments" rows="4" cols="50"></textarea><br>';
        } else {
        echo '<p>' . htmlspecialchars($questionText) . '</p>';

        // Fetch options for the current question
        $options =Model\SurveyRepository::getOptionsByQuestionId($questionId);

        // Generate input fields based on question type
        switch ($questionType) {
        case 1: // Radio button example
        if (!empty($options)) {
        foreach ($options as $option) {
        echo '<label><input type="radio" name="question_' . $questionId . '" value="' . htmlspecialchars($option['optionText']) . '"> ' . htmlspecialchars($option['optionText']) . '</label><br>';
        }
        }
        break;
        case 2: // Checkbox example
        if (!empty($options)) {
        foreach ($options as $option) {
        echo '<label><input type="checkbox" name="question_' . $questionId . '[]" value="' . htmlspecialchars($option['optionText']) . '"> ' . htmlspecialchars($option['optionText']) . '</label><br>';
        }
        }
        break;
        case 3: // Select dropdown example
        if (!empty($options)) {
        echo '<select name="question_' . $questionId . '">';
            foreach ($options as $option) {
            echo '<option value="' . htmlspecialchars($option['optionText']) . '">' . htmlspecialchars($option['optionText']) . '</option>';
            }
            echo '</select><br>';
        }
        break;
        case 4: // Textarea example
        $placeholder = !empty($options) ? htmlspecialchars($options[0]['optionText']) : 'Please specify...';
        echo '<textarea name="question_' . $questionId . '" rows="4" cols="50" placeholder="' . $placeholder . '"></textarea><br>';
        break;
        default:
        // Handle other types if necessary
        break;
        }
        }
        }
        ?>
    </fieldset>

    <input type="submit" value="Submit_Survey">
</form>
</body>
</html>