class Admin::ServicesController < Admin::ApplicationController
  before_action :find_banner, :only => [:edit, :update, :destroy, :delete]

  def index
    @services = Banner.where("banner_type = 'services'").page(params[:page]).per(20)
    @no = paging(20)
  end

  def new
    @service = Banner.new
    @custom_url = admin_services_path
  end

  def create
    @service = Banner.new(service_params)
    @service.banner_type = 'services'
    if @service.save
      flash[:notice] = 'Banner was successfully create.'
      redirect_to admin_services_path
    else
      flash[:error] = "Banner failed to create"
      render :action => :new
    end
  end

  def edit
    @custom_url = admin_service_path
  end

  def update
    if @service.update_attributes(service_params)
      flash[:notice] = 'Banner was successfully updated.'
      redirect_to admin_services_path
    else
      flash[:error] = "Banner failed to update"
      render :action => :edit
    end
  end

  def destroy
    flash[:notice] =  @service.destroy ? 'Banner was successfully deleted.' :
                                        'Banner was falied to delete.'
    redirect_to admin_services_path
  end

  private

    def service_params
      params.require(:banner).permit(:image, :url)
    end

    def find_banner
      @service = Banner.find_by_id(params[:id])
      if @service.nil?
        flash[:notice] = "Cannot find the Banner with id '#{params[:id]}'"
        redirect_to admin_services_path
      end
    end
end
