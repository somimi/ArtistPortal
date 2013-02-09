jQuery ->
  Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'))
  order.setupForm()

order =
  setupForm: ->
    $('#payment_info').submit ->
      $('input[type=submit]').attr('disabled', true)
      order.processCard()
      false

  processCard: ->
    card =
      name: $('#name').val()
      number: $('#card_number').val()
      cvc: $('#card_code').val()
      expMonth: $('#card_month').val()
      expYear: $('#card_year').val()
    Stripe.createToken(card, order.handleStripeResponse)

  handleStripeResponse: (status, response) ->
    if status == 200
      $('#stripe_card_token').val(response.id)
      $('#new_order').submit()
    else
      $('#strip_error').text(response.error.message)
      $('input[type=submit]').attr('disabled', false)