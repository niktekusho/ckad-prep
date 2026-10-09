// Markup: <div class="quiz" data-answer="N" data-explain="..."><p>Question</p><button>..</button>...</div>
// N is the 0-based index of the correct button.
document.querySelectorAll('.quiz').forEach(quiz => {
  const buttons = [...quiz.querySelectorAll('button')];
  const feedback = document.createElement('p');
  feedback.className = 'feedback';
  quiz.append(feedback);
  buttons.forEach((b, i) => b.addEventListener('click', () => {
    if (i === +quiz.dataset.answer) {
      b.classList.add('right');
      feedback.textContent = 'Correct. ' + quiz.dataset.explain;
      buttons.forEach(x => x.disabled = true);
    } else {
      b.classList.add('wrong');
      feedback.textContent = 'Not that one. Try again.';
    }
  }));
});
