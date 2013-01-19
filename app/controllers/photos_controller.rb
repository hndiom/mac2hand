class PhotosController < ApplicationController
  before_filter :find_deal

  def new 
    @object_new = @deal.photos.build    # needed for form_for --> gets the path
  end

  def index
    @photos = @deal.photos

    render :json => @photos.collect { |p| p.to_jq_upload }.to_json
  end

  def create
    @photo = @deal.photos.build
    @photo.photo = params[:deal_photos][:photo]
    if @photo.save
      respond_to do |format|
        format.html {                                         #(html response is for browsers using iframe sollution)
          render :json => [@photo.to_jq_upload].to_json,
          :content_type => 'text/html',
          :layout => false
        }
        format.json {
          render :json => [@photo.to_jq_upload].to_json
        }
      end
    else
      render :json => [{:error => "custom_failure"}], :status => 304
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    render :json => true
  end
  protected

  def find_deal
    @deal = Deal.find(params[:deal_id])
  end
end
