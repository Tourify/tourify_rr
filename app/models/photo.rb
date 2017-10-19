class Photo < ApplicationRecord
  belongs_to :imageable, polymorphic: true

  #Mounts paperclip image >> styles code grabbed from heroku site: https://devcenter.heroku.com/articles/paperclip-s3
  has_attached_file :image, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }

  #This validates the type of file uploaded. According to this, only images are allowed.
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  #Use this if you do not want to validate the uploaded file type.
  do_not_validate_attachment_file_type :image

  #Validates file, file type and file size
  validates_attachment :image, presence: true,
  content_type: { content_type: "image/jpeg" },
  size: { in: 0..10000.kilobytes }
end
