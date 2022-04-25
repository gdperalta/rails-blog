const refreshSuggestions = () => {
	const activityTemplates = document.querySelector('#activity-templates');
	activityTemplates.innerHTML =
		'\
		<div class="spinner-border text-secondary m-5" role="status">\
			<span class="visually-hidden">Loading...</span>\
		</div>';
	fetch('activities')
		.then((data) => data.text())
		.then((html) => {
			activityTemplates.innerHTML = html;
		});
};

const handleEvents = () => {
	const refreshButton = document.querySelector('#refresh-button');
	refreshButton.onclick = refreshSuggestions;
};

document.addEventListener('turbolinks:load', () => {
	handleEvents();
});
