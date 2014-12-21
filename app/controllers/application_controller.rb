class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :prepare_recent_blog_posts
  skip_before_filter :prepare_recent_blog_posts, :if => proc { request.xhr? }

  private

  # Get recent blog posts for display in the footer
  def prepare_recent_blog_posts
    @recent_blog_posts = Refinery::Blog::Post.live
      .with_globalize
      .page(params[:page])
      .order('published_at desc')
      .take(2)
  end

end
