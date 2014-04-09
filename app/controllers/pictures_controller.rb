class PicturesController < ApplicationController
  
  def index
    @pictures = Picture.all   #show all the pics
  end

  def show
    @picture = Picture.find(params[:id])
  end

  def new
    @picture = Picture.new
  end
    
  def create
    @picture = Picture.new(picture_params) 
    if @picture.save
      redirect_to "/pictures"
    else
      render :new
    end
  end
    # render :text => "Saving a picture. URL: #{params[:url]}, Title: #{params[:title]}, Artist: #{params[:artist]}"  
  def edit
    @picture = Picture.find(params[:id])
  end

  def update
    @picture = Picture.find(params[:id])
    if @picture.update_attributes(picture_params)
      redirect_to "/pictures/#{@picture.id}"
    else
      render :edit
    end
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    redirect_to pictures_url    
  end

  private
  
  def picture_params
    params.require(:picture).permit(:artist, :title, :url)
  end

end

