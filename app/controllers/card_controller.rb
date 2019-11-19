class CardController < ApplicationController
  require "payjp"
  

def purchase
  Payjp.api_key = "sk_test_3c6c6f094d2e40b7a314b6c3"
  Payjp::Charge.create(
    amount: 809,
    card: params['payjp-token'],
    currency:'jpy'
  )
end
