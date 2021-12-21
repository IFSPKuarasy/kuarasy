const btn = document.querySelector('#searchCEP')
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

// testando api dos correios
import {
	calcularPrecoPrazo,
	consultarCep,
	rastrearEncomendas
} from '/correios-brasil'


let args = {
	sCepOrigem: '81200100',
	sCepDestino: '21770200',
	nVlPeso: '1',
	nCdFormato: '1',
	nVlComprimento: '20',
	nVlAltura: '20',
	nVlLargura: '20',
	nCdServico: ['04014'], 
	nVlDiametro: '0'
}

$(btn).click( function () {
	calcularPrecoPrazo(args)
		.then(response => response.json())
		.then(function (json) {
			const doc = document.querySelector('#frete')
			json.results.map(function (results) {
				doc.innerHTML += `<div class="card my-5 bg-red-medium text-light shadow" >
                    <div class="card-body ms-4">
                    <div class="table-responsive">
                        <table class="table table-borderless my-3">
                            <thead>
                                <tr class="text-light">
                                    <th>
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1" aria-describedby="checkHelp1">
                                            <label class="form-check-label fw-bolder" for="flexRadioDefault1">
                                                Frete Fixo
                                            </label>
                                            <div id="checkHelp1" class="form-text text-light">Chega entre 3 a 6 dias úteis</div>
                                        </div>
                                        
                                    </th>
                                
                                    <th class="align-top ">R$ ` + results.Valor + `</th>  
                                </tr>
                            </thead>
                            
                            
                            <tr class="text-light">
                                 <td>
                                     <div class="form-check">
                                        <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2" aria-describedby="checkHelp2">
                                        <label class="form-check-label fw-bolder" for="flexRadioDefault2">
                                            Correios
                                        </label>
                                        <div id="checkHelp2" class="form-text text-light fw-bolder">Chega entre 3 e 5 dias úteis</div>
                                     </div>
                                    
                                </td>
                                <td class="fw-bolder">R$12,00</td>
                            </tr>
                        </table>
                    </div>

                    </div>

                </div> `
			})
		})
})