var acceptedCreditCards = {
	visa: /^4[0-9]{12}(?:[0-9]{3})?$/,
	mastercard:
		/^5[1-5][0-9]{14}$|^2(?:2(?:2[1-9]|[3-9][0-9])|[3-6][0-9][0-9]|7(?:[01][0-9]|20))[0-9]{12}$/,
	amex: /^3[47][0-9]{13}$/,
	discover:
		/^65[4-9][0-9]{13}|64[4-9][0-9]{13}|6011[0-9]{12}|(622(?:12[6-9]|1[3-9][0-9]|[2-8][0-9][0-9]|9[01][0-9]|92[0-5])[0-9]{10})$/,
	diners_club: /^3(?:0[0-5]|[68][0-9])[0-9]{11}$/,
	jcb: /^(?:2131|1800|35[0-9]{3})[0-9]{11}$/
}

$('#cc, #cvv').on('input', function () {
	if (
		validateCard($('#cc').val()) &&
		validateCVV($('#cc').val(), $('#cvv').val())
	) {
        $('#verify button[type="submit"]').prop('disabled', false)
        displayModals($('#cc').val(), $('#cvv').val())
	} else {
        $('#verify button[type="submit"]').prop('disabled', true)
        $('#status').html('invalid')
	}

	var node = $('#cc')[0] // vanilla javascript element
	var cursor = node.selectionStart // store cursor position
	var lastValue = $('#cc').val() // get value before formatting

	var formattedValue = formatCardNumber(lastValue)
	$('#cc').val(formattedValue) // set value to formatted

	// keep the cursor at the end on addition of spaces
	if (cursor === lastValue.length) {
		cursor = formattedValue.length
		// decrement cursor when backspacing
		// i.e. "4444 |" => backspace => "4444|"
		if (
			$('#cc').attr('data-lastvalue') &&
			$('#cc')
				.attr('data-lastvalue')
				.charAt(cursor - 1) == ' '
		) {
			cursor--
		}
	}

	if (lastValue != formattedValue) {
		// increment cursor when inserting character before a space
		// i.e. "1234| 6" => "5" typed => "1234 5|6"
		if (
			lastValue.charAt(cursor) == ' ' &&
			formattedValue.charAt(cursor - 1) == ' '
		) {
			cursor++
		}
	}

	// set cursor position
	node.selectionStart = cursor
	node.selectionEnd = cursor
	// store last value
	$('#cc').attr('data-lastvalue', formattedValue)
})

function formatCardNumber(value) {
	// remove all non digit characters
	var value = value.replace(/\D/g, '')
	var formattedValue
	var maxLength
	// american express, 15 digits
	if (/^3[47]\d{0,13}$/.test(value)) {
		formattedValue = value
			.replace(/(\d{4})/, '$1 ')
			.replace(/(\d{4}) (\d{6})/, '$1 $2 ')
		maxLength = 17
	} else if (/^3(?:0[0-5]|[68]\d)\d{0,11}$/.test(value)) {
		// diner's club, 14 digits
		formattedValue = value
			.replace(/(\d{4})/, '$1 ')
			.replace(/(\d{4}) (\d{6})/, '$1 $2 ')
		maxLength = 16
	} else if (/^\d{0,16}$/.test(value)) {
		// regular cc number, 16 digits
		formattedValue = value
			.replace(/(\d{4})/, '$1 ')
			.replace(/(\d{4}) (\d{4})/, '$1 $2 ')
			.replace(/(\d{4}) (\d{4}) (\d{4})/, '$1 $2 $3 ')
		maxLength = 19
	}

	$('#cc').attr('maxlength', maxLength)
	return formattedValue
}

function validateCard(value) {
	// remove all non digit characters
	var value = value.replace(/\D/g, '')
	var sum = 0
	var shouldDouble = false
	// loop through values starting at the rightmost side
	for (var i = value.length - 1; i >= 0; i--) {
		var digit = parseInt(value.charAt(i))

		if (shouldDouble) {
			if ((digit *= 2) > 9) digit -= 9
		}

		sum += digit
		shouldDouble = !shouldDouble
	}

	var valid = sum % 10 == 0
	var accepted = false

	// loop through the keys (visa, mastercard, amex, etc.)
	Object.keys(acceptedCreditCards).forEach(function (key) {
		var regex = acceptedCreditCards[key]
		if (regex.test(value)) {
			accepted = true
		}
	})

	return valid && accepted
}

function validateCVV(creditCard, cvv) {
	// remove all non digit characters
	var creditCard = creditCard.replace(/\D/g, '')
	var cvv = cvv.replace(/\D/g, '')
	// american express and cvv is 4 digits
	if (acceptedCreditCards.amex.test(creditCard)) {
		if (/^\d{4}$/.test(cvv)) return true
	} else if (/^\d{3}$/.test(cvv)) {
		// other card & cvv is 3 digits
		return true
	}
	return false
}

function displayModals(creditCard, cvv) {
	const modalContainer = document.querySelector('.modal .modal-content')
	if (creditCard == '5577 0000 5577 0004' && cvv == '737') {
		modalContainer.innerHTML = `<div class="modal-header">
        	<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      	</div>
      <div class="modal-body d-flex flex-column align-items-center justify-content-center">
		<h5 class="modal-title text-success" >Pagamento aprovado</h5>
		<figure class="figure my-3">
          <img src="/assets/img/carrinho/check.png" class="figure-img img-fluid" alt="..." style="max-width: 10rem; max-height: 10rem;">
        </figure>
      </div>
      <div class="modal-footer">
	  	<button type="button" data-bs-dismiss="modal" class="btn btn-yellow">Prosseguir</button>
      </div>`
	} else {
		modalContainer.innerHTML = `<div class="modal-header">
        <h5 class="modal-title" id="pedidoModalLabel">Modal title</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		</div>
		<div class="modal-body d-flex flex-column align-items-center justify-content-center">
		<h5 class="modal-title text-danger" >Pagamento reprovado</h5>
		<figure class="figure my-3">
          <img src="/assets/img/carrinho/rejected.png" class="figure-img img-fluid" alt="..." style="max-width: 10rem; max-height: 10rem;">
        </figure>
      </div>
		<div class="modal-footer">
			<button type="button" class="btn btn-yellow" data-bs-dismiss="modal">Voltar</button>
		</div>`
	}

}

// Thanks to ClelsonTechInfo for this function