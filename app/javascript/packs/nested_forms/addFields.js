class addFields {
	constructor() {
		this.inputs = document.querySelectorAll('.add-fields');
		this.iterateLinks();
	}

	iterateLinks() {
		if (this.inputs.length === 0) return;
		this.inputs.forEach((input) => {
			input.addEventListener('click', (e) => {
				this.handleClick(input, e);
			});
		});
	}

	// Inserts a new field above the input
	handleClick(input, e) {
		if (!input || !e) return;
		e.preventDefault();
		let time = new Date().getTime();
		let inputId = input.dataset.id;
		let regexp = inputId ? new RegExp(inputId, 'g') : null;
		let newFields = regexp ? input.dataset.fields.replace(regexp, time) : null;

		let adsContainer = document.querySelector('.ads-container');
		let nestedFields = adsContainer.querySelectorAll('.nested-fields');
		let adsID = input.dataset.adsvalue;
		let present = false;

		nestedFields.forEach((field, index) => {
			adsValue = field.querySelector('.ads-value');
			if (adsValue.value === adsID && field.style.display !== 'none') {
				present = true;
				return;
			}
		});
		if (!present) {
			newFields ? (adsContainer.innerHTML += newFields) : null;
			// input.className = 'add-fields btn btn-primary col-auto me-3 text-white';
		}
	}
}

document.addEventListener('turbolinks:load', () => {
	new addFields();
});
