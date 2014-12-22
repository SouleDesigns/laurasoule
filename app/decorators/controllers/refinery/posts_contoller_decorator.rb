Refinery::Blog::PostsController.class_eval do

  before_filter :set_recaptcha_public_key, :only => [:show, :comment]
  append_before_filter :validate_recaptcha, :only => [:comment]



  private

  def validate_recaptcha
    @comment = Refinery::Blog::Comment.new(params[:comment])
    unless verify_recaptcha(:model => @comment, :message => 'The text you entered does not match the image, please try again')
      render :show
    else
      # Send comment via email here if moderation off and not spam
      # if those conditions are met an email will get sent from the
      # controller anyway
      unless Refinery::Blog::Comment::Moderation.enabled? and @comment.ham?
        begin
          Refinery::Blog::CommentMailer.notification(@comment, request).deliver
        rescue
          logger.warn "There was an error delivering a blog comment notification.\n#{$!}\n"
        end
      end
    end
  end

  def set_recaptcha_public_key
    @recaptcha_public_key = Recaptcha.configuration.public_key
  end

end