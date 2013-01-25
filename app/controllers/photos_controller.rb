# -*- encoding : utf-8 -*-
class PhotosController < ApplicationController
  before_filter :find_sell

  def new 
    @object_new = @sell.photos.build    # needed for form_for --> gets the path
  end

  def index
    @photos = @sell.photos

    render :json => @photos.collect { |p| p.to_jq_upload }.to_json
  end

  def create
    @photo = @sell.photos.build
    @photo.photo = params[:sell_photos][:photo]
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

  def find_sell
    @sell = Sell.find(params[:sell_id])
  end
end
