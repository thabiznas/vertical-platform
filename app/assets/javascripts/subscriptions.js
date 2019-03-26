let stripeRes;

jQuery(function() {
  Stripe.setPublishableKey($("meta[name='stripe-key']").attr("content"));
  $('#subscription-form').submit(function(event) {
    var $form;
    $form = $(this);
    // Disable the submit button to prevent repeated clicks
    $form.find('button').prop('disabled', true);
    // Prevent form submittion
    Stripe.card.createToken($form, stripeRes);
    return false;
  });
});

stripeRes = function(status, response) {
  var $form, token;
  $form = $('#subscription-form');
  if (response.error) {
    $form.find('.subscription-errors').text(response.error.message);
    $form.find('button').prop('disabled', false);
  } else {
    token = response.id;
    $form.append($('<input type="hidden" name="payment_gateway_token" />').val(token));
    $form.get(0).submit();
  }
};