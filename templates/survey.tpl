<br>
<p>We appreciate your participation in this survey about the water quality in your area. Your feedback is valuable and will help us improve our services.</p>
<br>
<form action="/submit-survey" method="POST">
    <form action="index.php" method="POST">
        <fieldset>
            <label for="location">Location:</label>
            <input type="text" id="location" name="location" required>
            @@ -102,41 +102,61 @@
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

            <input type="submit" value="Submit Survey">
            <input type="submit" value="Submit_Survey">
        </form>
</form>
</body>
</html>