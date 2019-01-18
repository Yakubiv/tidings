class ContactsController < ApplicationController
  layout 'contacts'

  def index

  end

  def create
    Contact.create(contact_params)
    redirect_to contacts_path, notice: t('contacts.create.success')
  end

  private

  def contact_params
    params.require(:contact)
          .permit(:name, :email, :content)
  end
end
