class removeFields {
	constructor() {
		this.iterateLinks();
	}

	iterateLinks() {
		document.addEventListener('click', (e) => {
			if (e.target && e.target.classList.contains('remove-fields')) {
				this.handleClick(e.target, e);
			}
		});
	}

	handleClick(link, e) {
		if (!link || !e) return;
		e.preventDefault();
		let fieldParent = link.closest('.nested-fields');
		let deleteField = fieldParent
			? fieldParent.querySelector('.destroy-fields')
			: null;
		if (deleteField) {
			deleteField.value = 1;
			fieldParent.style.display = 'none';
		}
	}
}

document.addEventListener('turbolinks:load', () => {
	new removeFields();
});
