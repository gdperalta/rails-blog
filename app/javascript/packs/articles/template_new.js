const refreshSuggestions = () => {
	const activityTemplates = document.querySelector('#activity-templates');
	const activityType = document.querySelector('#activity-type');
	activityTemplates.innerHTML =
		'\
		<div class="spinner-border text-primary m-5" role="status">\
			<span class="visually-hidden">Loading...</span>\
		</div>';
	fetch(`activities/${activityType.value}`)
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
