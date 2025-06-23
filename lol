<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Fire Alarm Quiz</title>
  <style>
    body { font-family: Arial; padding: 20px; background: #f4f4f4; }
    .quiz-container {
      background: white;
      padding: 20px;
      max-width: 700px;
      margin: auto;
      border-radius: 10px;
      box-shadow: 0 0 10px #ccc;
    }
    .question { font-size: 1.2em; }
    .answers label { display: block; margin: 10px 0; }
    button {
      margin-top: 20px;
      padding: 10px 20px;
      background: #007BFF;
      color: white;
      border: none;
      border-radius: 5px;
      cursor: pointer;
    }
    #result { margin-top: 20px; font-weight: bold; }
  </style>
</head>
<body>
<div class="quiz-container">
  <div id="quiz">
    <div class="question" id="question">Loading...</div>
    <div class="answers" id="answers"></div>
    <button id="submit">Submit Answer</button>
    <div id="result"></div>
  </div>
</div>

<script>
const quizData = [
  {
    question: "What principle does a photoelectric smoke detector use to detect smoke?",
    options: ["Ionization of air particles", "Light scattering caused by smoke", "Temperature rise in a chamber", "Radioactive particle disruption"],
    answer: "Light scattering caused by smoke"
  },
  {
    question: "Which type of smoke detector is more effective for detecting fast-flaming fires like gasoline or alcohol fires?",
    options: ["Photoelectric smoke detector", "Ionization smoke detector", "Heat detector", "Flame detector"],
    answer: "Ionization smoke detector"
  },
  {
    question: "Why is a photoelectric smoke detector less effective for black smoke?",
    options: ["Black smoke ionizes the air too quickly", "Black smoke absorbs light instead of reflecting it", "Black smoke does not contain aerosols", "Black smoke triggers false alarms"],
    answer: "Black smoke absorbs light instead of reflecting it"
  },
  {
    question: "How does an ionization smoke detector sense smoke?",
    options: ["By measuring temperature changes", "By detecting reduced current flow due to ion disruption", "By reflecting light off smoke particles", "By sensing CO₂ levels"],
    answer: "By detecting reduced current flow due to ion disruption"
  },
  {
    question: "What is the primary advantage of an ionization smoke detector over a photoelectric one?",
    options: ["It detects large smoke particles better", "It detects smaller aerosols and fast-flaming fires earlier", "It is immune to false alarms", "It does not require a power source"],
    answer: "It detects smaller aerosols and fast-flaming fires earlier"
  }
  // Add more questions below following the same format
];

let currentQuestion = 0;
let score = 0;

const questionEl = document.getElementById('question');
const answersEl = document.getElementById('answers');
const submitBtn = document.getElementById('submit');
const resultEl = document.getElementById('result');

function loadQuestion() {
  const q = quizData[currentQuestion];
  questionEl.textContent = q.question;
  answersEl.innerHTML = "";

  q.options.forEach(option => {
    const label = document.createElement('label');
    label.innerHTML = `<input type="radio" name="answer" value="${option}"> ${option}`;
    answersEl.appendChild(label);
  });
}

submitBtn.addEventListener('click', () => {
  const selected = document.querySelector('input[name="answer"]:checked');
  if (!selected) {
    alert("Please select an answer!");
    return;
  }

  const answer = selected.value;
  if (answer === quizData[currentQuestion].answer) score++;
  currentQuestion++;

  if (currentQuestion < quizData.length) {
    loadQuestion();
  } else {
    questionEl.style.display = "none";
    answersEl.style.display = "none";
    submitBtn.style.display = "none";
    resultEl.textContent = `You scored ${score} out of ${quizData.length}.`;
  }
});

loadQuestion();
</script>
</body>
</html>
