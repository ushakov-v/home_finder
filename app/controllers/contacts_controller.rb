class ContactsController < ApplicationController
    def show
      @contact_email = "info@example.com"
      @contact_phone = "+1 234-567-890"
    end
  end