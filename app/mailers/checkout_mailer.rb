# frozen_string_literal: true

class CheckoutMailer < ApplicationMailer
  default from: 'postmaster@sandbox9603301d59f7481fa94126fae8b382a7.mailgun.org'
  def creation_mail(checkout)
    @checkout = checkout
    mail = checkout.email
    mail(to: mail,subject: "注文完了メール")
  end
end
