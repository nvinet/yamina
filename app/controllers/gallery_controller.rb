class GalleryController < ApplicationController
  def index
    @files = Dir.entries('public/images/gallery/thumb/').sort()
    @files.delete('.')
    @files.delete('..')
  end
end
