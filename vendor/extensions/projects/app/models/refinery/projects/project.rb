module Refinery
  module Projects
    class Project < Refinery::Core::BaseModel
      self.table_name = 'refinery_projects'

      attr_accessible :title, :date, :photo_id, :teaser, :content, :position

      validates :title, :presence => true, :uniqueness => true

      belongs_to :photo, :class_name => '::Refinery::Image'

      def anchor
        self.title.downcase.gsub(/[^0-9a-z ]/i, '').gsub(/\s/, '-')
      end
    end
  end
end
