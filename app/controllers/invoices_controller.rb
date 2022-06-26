# frozen_string_literal: true

class InvoicesController < ApplicationController
  def index
    @invoices = current_user.invoices
  end

  def new
    @invoice = Invoice.new
  end

  def create
    @invoice = current_user.invoices.new(invoice_params)

    if @invoice.save
      redirect_to invoices_url, notice: 'Invoice successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def invoice_params
    params.require(:invoice).permit(:amount, :invoice_date, :foreign_country)
  end
end
