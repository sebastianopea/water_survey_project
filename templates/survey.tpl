<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/daisyui@4.10.1/dist/full.min.css" rel="stylesheet" type="text/css" />
    <script src="https://cdn.tailwindcss.com"></script>
    <title>Water Quality Survey</title>
    <style>
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
            font-size: 2em;
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
<a class="block text-teal-600" style="" href="index.php?dash">
    <span class="sr-only">Home</span>
    <svg class="h-8" viewBox="0 0 28 24" fill="none" xmlns="http://www.w3.org/2000/svg">
        <path
                d="M0.41 10.3847C1.14777 7.4194 2.85643 4.7861 5.2639 2.90424C7.6714 1.02234 10.6393 0 13.695 0C16.7507 0 19.7186 1.02234 22.1261 2.90424C24.5336 4.7861 26.2422 7.4194 26.98 10.3847H25.78C23.7557 10.3549 21.7729 10.9599 20.11 12.1147C20.014 12.1842 19.9138 12.2477 19.81 12.3047H19.67C19.5662 12.2477 19.466 12.1842 19.37 12.1147C17.6924 10.9866 15.7166 10.3841 13.695 10.3841C11.6734 10.3841 9.6976 10.9866 8.02 12.1147C7.924 12.1842 7.8238 12.2477 7.72 12.3047H7.58C7.4762 12.2477 7.376 12.1842 7.28 12.1147C5.6171 10.9599 3.6343 10.3549 1.61 10.3847H0.41ZM23.62 16.6547C24.236 16.175 24.9995 15.924 25.78 15.9447H27.39V12.7347H25.78C24.4052 12.7181 23.0619 13.146 21.95 13.9547C21.3243 14.416 20.5674 14.6649 19.79 14.6649C19.0126 14.6649 18.2557 14.416 17.63 13.9547C16.4899 13.1611 15.1341 12.7356 13.745 12.7356C12.3559 12.7356 11.0001 13.1611 9.86 13.9547C9.2343 14.416 8.4774 14.6649 7.7 14.6649C6.9226 14.6649 6.1657 14.416 5.54 13.9547C4.4144 13.1356 3.0518 12.7072 1.66 12.7347H0V15.9447H1.61C2.39051 15.924 3.154 16.175 3.77 16.6547C4.908 17.4489 6.2623 17.8747 7.65 17.8747C9.0377 17.8747 10.392 17.4489 11.53 16.6547C12.1468 16.1765 12.9097 15.9257 13.69 15.9447C14.4708 15.9223 15.2348 16.1735 15.85 16.6547C16.9901 17.4484 18.3459 17.8738 19.735 17.8738C21.1241 17.8738 22.4799 17.4484 23.62 16.6547ZM23.62 22.3947C24.236 21.915 24.9995 21.664 25.78 21.6847H27.39V18.4747H25.78C24.4052 18.4581 23.0619 18.886 21.95 19.6947C21.3243 20.156 20.5674 20.4049 19.79 20.4049C19.0126 20.4049 18.2557 20.156 17.63 19.6947C16.4899 18.9011 15.1341 18.4757 13.745 18.4757C12.3559 18.4757 11.0001 18.9011 9.86 19.6947C9.2343 20.156 8.4774 20.4049 7.7 20.4049C6.9226 20.4049 6.1657 20.156 5.54 19.6947C4.4144 18.8757 3.0518 18.4472 1.66 18.4747H0V21.6847H1.61C2.39051 21.664 3.154 21.915 3.77 22.3947C4.908 23.1889 6.2623 23.6147 7.65 23.6147C9.0377 23.6147 10.392 23.1889 11.53 22.3947C12.1468 21.9165 12.9097 21.6657 13.69 21.6847C14.4708 21.6623 15.2348 21.9135 15.85 22.3947C16.9901 23.1884 18.3459 23.6138 19.735 23.6138C21.1241 23.6138 22.4799 23.1884 23.62 22.3947Z"
                fill="currentColor"
        />
    </svg>
</a>
<div class="dashboard-button">
    <a href="index.php?dash" class="btn">Dashboard</a>
</div>
<br>
<br>
<div>
    <h1 style="font-size: 2.5rem;font-weight: bold"><?=$title?></h1>
    <br>
    <p><?=$description?></p>
    <br>
</div>

<form action="index.php" method="post" onsubmit="return validateForm()">
<?php if($nSurvey === 1): ?>
<fieldset>
    <label for="location">Location:</label>
    <input type="text" id="location" name="location" required>
</fieldset>
<?php endif; ?>

<br>
<fieldset>
    <legend><?=$title?> Questions</legend>

    <?php foreach ($questions as $question):
            $questionId = $question['id'];
            $questionText = $question['questionText'];
            $questionType = $question['questionType'];
            if ($questionId != 7):
                if ($questionId == 6): ?>
    <legend>Additional Comments</legend>
    <label for="comments">Do you have any additional comments or suggestions?</label>
    <textarea id="comments" name="question_6" rows="4" cols="50"></textarea><br>
    <?php else: ?>
    <p><?= htmlspecialchars($questionText) ?></p>
    <br>
    <?php
                    // Fetch options for the current question
                    $options = Model\SurveyRepository::getOptionsByQuestionId($questionId);

                    // Generate input fields based on question type
                    switch ($questionType):
                        case 1: // Radio button example
                            if (!empty($options)):
                                foreach ($options as $option): ?>
    <label>
        <input type="radio" required name="question_<?= $questionId ?>" value="<?= htmlspecialchars($option['optionText']) ?>">
        <?= htmlspecialchars($option['optionText']) ?>
    </label><br>
    <?php endforeach;
                            endif;
                            break;
                        case 2: // Checkbox example
                            if (!empty($options)):
                                foreach ($options as $option): ?>
    <label>
        <input type="checkbox" name="question_<?= $questionId ?>[]" value="<?= htmlspecialchars($option['optionText']) ?>">
        <?= htmlspecialchars($option['optionText']) ?>
    </label><br>
    <?php endforeach;
                            endif;
                            break;
                        case 3: // Select dropdown example
                            if (!empty($options)): ?>
    <select name="question_<?= $questionId ?>">
        <?php foreach ($options as $option): ?>
        <option value="<?= htmlspecialchars($option['optionText']) ?>"><?= htmlspecialchars($option['optionText']) ?></option>
        <?php endforeach; ?>
    </select><br>
    <?php endif;
                            break;
                        case 4: // Textarea example
                            $placeholder = !empty($options) ? htmlspecialchars($options[0]['optionText']) : 'Please specify...'; ?>
    <textarea name="question_<?= $questionId ?>" rows="4" cols="50" placeholder="<?= $placeholder ?>"></textarea><br>
    <?php break;
                        default:
                            // Handle other types if necessary
                            break;
                    endswitch; ?>
    <?php endif;
            endif;
        endforeach; ?>
</fieldset>
<input type="hidden" value="<?= $this->e($nSurvey) ?>" name="surveySubmit">
<input type="submit" value="Submit survey">
</form>
<script>
    function validateForm() {
        errorMessage.style.display = "none";
        return true;
    }
</script>
</body>
</html>