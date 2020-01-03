class HomeController < ApplicationController
  before_action :find_product, only: [:show_modal, :product_detail]

  def index
    @contact = Contact.new
    @banners = Banner.where("banner_type = 'banner'")
    @services = Banner.where("banner_type = 'services'")
    @products = Product.all
  end

  def faq
  end

  def contact_us
    @contact = Contact.new(contact_params)
    if verify_recaptcha(model: @contact) && @contact.save
      ContactUsMailer.notification_user(@contact, the_domain).deliver_now
      ContactUsMailer.notification_officer(@contact, the_domain).deliver_now
      ContactUsMailer.notification_admin(@contact, the_domain).deliver_now
      flash[:notice] = 'Message was successfully sent.'
      redirect_to root_path(anchor: "hubungi-kami")
    else
      flash[:error] = "Message failed to send"
      render :action => :index
    end
  end

  def show_modal
    respond_to do |format|
      format.html do
        redirect_to product_detail_path(@product.permalink)
      end
      format.js
    end
  end

  def product_detail
  end

  private
    def contact_params
      params.require(:contact).permit(:name, :email, :phone, :subject, :content)
    end

    def find_product
      @product = Product.find_by_permalink(params[:permalink])
      if @product.nil?
        redirect_to root_path
      end
    end
end
