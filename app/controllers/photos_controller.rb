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
   if params[:stop_id]
     @imageable = Stop.find(params[:stop_id])
   end
   @photo = @imageable.photos.build(photo_params)
 end
 # code above is based on suggestions in this post: http://karimbutt.github.io/blog/2015/01/03/step-by-step-guide-to-polymorphic-associations-in-rails/


 private

 #Permitted parameters when creating a photo. This is used for security reasons.
 def photo_params
  params.require(:photo).permit(:title, :image)
 end
end
