class ChargesController < ApplicationController
  def create
    @user = current_user

    customer = Stripe::Customer.create(
      email: current_user.email,
      card: params[:stripeToken]
      )
    @user.stripe_id = customer.id

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: 10_00,
      description: "Premium Membership - #{current_user.email}",
      currency: 'usd'
    )

    @user.update_attributes(role: 'premium')

    flash[:notice] = "Thank you for your payment, #{current_user.email}! You can now create and edit private wikis."
    redirect_to root_path(current_user)

    rescue Stripe::CardError => e
      flash[:alert] = e.message
      redirect_to new_charge_path
  end

  def new
    @stripe_btn_data = {
      key: "#{ Rails.configuration.stripe[:publishable_key] }",
      description: "Premium Membership - #{current_user.email}",
      amount: 10_00
    }
  end

  def destroy
    @user = current_user
    @user.update_attributes(role: 'standard')

    if @user.save
      flash[:notice] = "#{current_user.email} has been successfully downgraded to standard. Your private wikis are now public."
    else
      flash[:error] = "There was an error downgrading your account. Please try again."
    end
    redirect_to root_path(current_user)

    cu = Stripe::Customer.retrieve(@user.stripe_id)
    cu.delete

  end

  private

  def upgrade_user_role
    @user.role = 'premium'
  end
end
