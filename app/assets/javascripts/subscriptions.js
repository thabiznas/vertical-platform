// let stripeRes;

// jQuery(function() {
//   Stripe.setPublishableKey($("meta[name='stripe-key']").attr("content"));
//   $('#subscription-form').submit(function(event) {
//     var $form;
//     $form = $(this);
//     // Disable the submit button to prevent repeated clicks
//     $form.find('button').prop('disabled', true);
//     // Prevent form submittion
//     Stripe.card.createToken($form, stripeRes);
//     return false;
//   });
// });

// stripeRes = function(status, response) {
//   var $form, token;
//   $form = $('#subscription-form');
//   if (response.error) {
//     $form.find('.subscription-errors').text(response.error.message);
//     $form.find('button').prop('disabled', false);
//   } else {
//     token = response.id;
//     console.log("token", token)
//     $form.append($('<input type="hidden;" name="payment_gateway_token" />').val(token));
//     $form.get(0).submit();
//   }
// };


// Create a Stripe client.
jQuery(function(){
  var stripe = Stripe('pk_test_6zNgR6R6IGp3Va910mkUQMD1');

// Create an instance of Elements.
var elements = stripe.elements();

// Custom styling can be passed to options when creating an Element.
// (Note that this demo uses a wider set of styles than the guide below.)
var style = {
  base: {
    color: '#32325d',
    fontFamily: '"Helvetica Neue", Helvetica, sans-serif',
    fontSmoothing: 'antialiased',
    fontSize: '16px',
    '::placeholder': {
      color: '#aab7c4'
    }
  },
  invalid: {
    color: '#fa755a',
    iconColor: '#fa755a'
  }
};

// Create an instance of the card Element.
var card = elements.create('card', {style: style});

// Add an instance of the card Element into the `card-element` <div>.
card.mount('#card-element');

// Handle real-time validation errors from the card Element.
card.addEventListener('change', function(event) {
  var displayError = document.getElementById('card-errors');
  if (event.error) {
    displayError.textContent = event.error.message;
  } else {
    displayError.textContent = '';
  }
});

// Handle form submission.
var form = document.getElementById('payment-form');
form.addEventListener('submit', function(event) {
  event.preventDefault();

  stripe.createToken(card).then(function(result) {
    if (result.error) {
      // Inform the user if there was an error.
      var errorElement = document.getElementById('card-errors');
      errorElement.textContent = result.error.message;
    } else {
      // Send the token to your server.
      stripeTokenHandler(result.token);
    }
  });
});

// Submit the form with the token ID.
function stripeTokenHandler(token) {
  // Insert the token ID into the form so it gets submitted to the server
  var form = document.getElementById('payment-form');
  var hiddenInput = document.createElement('input');
  hiddenInput.setAttribute('type', 'hidden');
  hiddenInput.setAttribute('name', 'payment_gateway_token');
  hiddenInput.setAttribute('value', token.id);
  form.appendChild(hiddenInput);

  // Submit the form
  form.submit();
}
console.log('Loaded!')
})

