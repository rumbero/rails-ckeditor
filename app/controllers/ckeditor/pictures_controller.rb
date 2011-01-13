class Ckeditor::PicturesController < Ckeditor::BaseController

  def index
    @pictures = Ckeditor.image_model.where(:user_id => current_user.id).order("id DESC")
    respond_with(@pictures) 
  end
  
  def create
    @picture = Ckeditor.image_model.new
	  respond_with_asset(@picture)
  end
  
  def destroy
    @picture.destroy
    respond_with(@picture)
  end
  
  protected
  
    def find_asset
      @picture = Ckeditor.image_model.where(:user_id => current_user.id).find(params[:id])
    end

end
