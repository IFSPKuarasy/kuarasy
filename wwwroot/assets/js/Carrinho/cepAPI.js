const inputCEP = document.querySelector('[name="cep"]')
const inputStreet = document.querySelector('[name="logradouro"]')
const inputRegion = document.querySelector('[name="bairro"]')

$(inputCEP).on('input', function () {
	let cep = inputCEP.value
	fetch(`https://viacep.com.br/ws/${cep}/json/`)
		.then(resp => resp.json())
		.then(dadosCEP => {
			inputStreet.value = dadosCEP.logradouro
			inputRegion.value = dadosCEP.bairro

		})
		.catch(reject => console.log(reject))
})
