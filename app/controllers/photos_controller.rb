class PhotosController < ApplicationController
  #Index action, photos gets listed in the order at which they were created
 def index
  @photos = Photo.order('created_at')
 end

 #New action for creating a new photo
 def new
  @photo = Photo.new
 end

 #Create action ensures that submitted photo gets created if it meets the requirements
 def create
   @photo = Photo.new(photo_params)
   @photo.organization_id = 1
   @photo.tour_id = 1
   @photo.stop_id = 1

  if @photo.save
   flash[:notice] = "Successfully added new photo!"
   redirect_to root_path
  else
   flash[:alert] = "Error adding new photo!"
   render :new
  end
 end

 private

 #Permitted parameters when creating a photo. This is used for security reasons.
 def photo_params
  params.require(:photo).permit(:title, :image)
 end

 # def get_stop
 #   @stop =
 # end
 #
 # def get_tour
 #   @tour = Tour.find(params[:tour_id])
 # end
 #
 # def get_organization
 #   @organization = Organization.find(params[:organization_id])
 # end
end
