Refinery::Blog::PostsController.class_eval do

  before_filter :set_recaptcha_public_key, :only => [:show, :comment]
  append_before_filter :validate_recaptcha, :only => [:comment]



  private

  def validate_recaptcha
    @comment = Refinery::Blog::Comment.new(params[:comment])
    unless verify_recaptcha(:model => @comment, :message => 'The text you entered does not match the image, please try again')
      render :show
    end
  end

  def set_recaptcha_public_key
    @recaptcha_public_key = Recaptcha.configuration.public_key
  end

end