
class ListingsController < ApplicationController
  before_action :find_listing, only: [:show, :edit, :update, :destroy, :delete_image_attachment]
  before_action :logged_in?, only: [:new, :create, :edit, :update, :destroy]

  def index
    @listings = Listing.all.with_attached_images
  end

  def show
    #@listing = get_current_user.listings.build if logged_in?
  end

  def new
    @listing = Listing.new
    @nbd = @listing.create_neighborhood
  end
  
  def create
    @listing = get_current_user.listings.build(listing_params)
    @listing.images.attach(params[:listing][:images])
    if @listing.save
      flash[:success] = "Listing created!"
      redirect_to @listing
    else
      render :new
    end
  end

  def edit   
  end

  def update
    if params[:listing][:images].present?
      params[:listing][:images].each do |image|
        @listing.images.attach(image)
      end
    end
    @listing.update(listing_params)
    redirect_to listing_path(@listing)
    flash[:notice] = 'Listing has been updated'
  end

  def destroy
    @listing.destroy
    
    redirect_to action: :index
    flash[:notice] = 'Listing has been deleted'
  end

  def delete_image_attachment
    @listing.images.find_by(params[:attachment_id]).purge
    #ActiveStorage::Attachment.find(params[:id]).purge
    redirect_to edit_listing_path
  end

  private

  def listing_params
    params.require(:listing).permit(:title, :duration, :price, :utilities, :initial_fee, :address, :description, :amenities, :room_mates, :bathrooms, :laundry_in_unit, :pets_allowed,:four_twenty_friendly, :user_id, :city_id, :neighborhood_name)
  end

  def find_listing
    @listing = Listing.find(params[:id])
  end
  

end
