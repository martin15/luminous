class Admin::ProductsController < Admin::ApplicationController
  before_action :find_product, :only => [:edit, :update, :destroy, :delete]

  def index
    @products = Product.all.page(params[:page]).per(20)
    @no = paging(20)
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = 'Product was successfully create.'
      redirect_to admin_products_path
    else
      flash[:error] = "Product failed to create"
      render :action => :new
    end
  end

  def edit
  end

  def update
    if @product.update_attributes(product_params)
      flash[:notice] = 'Product was successfully updated.'
      redirect_to admin_products_path
    else
      flash[:error] = "Product failed to update"
      render :action => :edit
    end
  end

  def destroy
    flash[:notice] =  @product.destroy ? 'Product was successfully deleted.' :
                                          'Product was falied to delete.'
    redirect_to admin_products_path
  end

  private

    def product_params
      params.require(:product).permit(:name, :description, :price, :image)
    end

    def find_product
      @product = Product.find_by_id(params[:id])
      if @product.nil?
        flash[:notice] = "Cannot find the Product with id '#{params[:id]}'"
        redirect_to admin_products_path
      end
    end
end
