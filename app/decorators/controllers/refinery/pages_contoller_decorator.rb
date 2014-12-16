Refinery::PagesController.class_eval do

  before_filter :find_all_projects, :only => [:home]

  private

  def find_all_projects
    @projects = ::Refinery::Projects::Project.order('date DESC').take(8)
  end

end