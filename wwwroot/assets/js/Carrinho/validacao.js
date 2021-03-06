//  // Validação do formulário 
const form = document.querySelector('.needs-validation')
const fields = document.querySelectorAll('[required]')

function ValidateField(field) {
	function verifyErrors() {
		let foundError = false

		for (let error in field.validity) {
			if (field.validity[error] && !field.validity.valid) {
				foundError = error
			}
		}
		return foundError
	}
	

	function customMessage(typeError) {
		const messages = {
			text: {
				valueMissing: 'Por favor, preencha esse campo'
			},
			tel: {
				valueMissing: 'Celular é obrigatório',
				typeMismatch: 'Por favor, preencha um telefone válido'
			},
			email: {
				valueMissing: 'Email é obrigatório',
				typeMismatch: 'Por favor, preencha um email válido'
			},
			datalist: {
				valueMissing: 'Por favor, preencha esse campo'
			},
			textarea: {
				valueMissing: 'Por favor, preencha esse campo'
			},
			datetimelocal: {
				valueMissing: 'Por favor, preencha esse campo',
				typeMismatch: 'Por favor, preencha uma data válida'
			},
			number: {
				valueMissing: 'Por favor, preencha esse campo',
				typeMismatch: 'Por favor, preencha um valor númerico válido'
			}
		}

		return messages[field.type][typeError]
	}

	function setCustomMessage(message) {
		const spanError = field.parentNode.querySelector('span.error')
		if (message) {
			spanError.classList.add('invalid-feedback')
			spanError.innerHTML = message
		} else {
			spanError.classList.remove('invalid-feedback')
			spanError.innerHTML = ' '
		}
	}

	return function () {
		const error = verifyErrors()

		if (verifyErrors()) {
			form.classList.add('was-validated')
			const message = customMessage(error)
			setCustomMessage(message)
			$('#verify button[type="submit"]').prop('disabled', true)
		} else {
			setCustomMessage()
		}
	}
}

function customValidation(e) {
	const field = e.target
	const validation = ValidateField(field)

	validation()
}

for (let field of fields) {
	field.addEventListener('invalid', e => {
		e.preventDefault()
		customValidation(e)
	})
	field.addEventListener('blur', customValidation)
}

// Validação das mascaras
const masks = {
	cep(value) {
		return value
        .replace(/\D+/g, '')
        .replace(/(\d{5})(\d)/, '$1-$2')
        .replace(/(-\d{3})\d+?$/, '$1')
	},
}

let inputs = document.querySelectorAll('input')
	inputs.forEach(fields => {
	const field = fields.dataset.js

	fields.addEventListener(
		'input',
		e => {
			e.target.value = masks[field](e.target.value)
			if ((e.target.value == "") || (e.target.value == null)) {
				$('#verify button[type="submit"]').prop('disabled', true)
			}else{
				$('#verify button[type="submit"]').prop('disabled', false)
			}
		},
		false
	)
}) 