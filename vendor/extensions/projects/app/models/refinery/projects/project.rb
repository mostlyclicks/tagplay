require 'acts-as-taggable-on'

module Refinery
  module Projects
    class Project < Refinery::Core::BaseModel
      self.table_name = 'refinery_projects'

      attr_accessible :name, :description, :position, :tag_list

      validates :name, :presence => true, :uniqueness => true
      acts_as_taggable
    end
  end
end
