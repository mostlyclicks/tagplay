module Refinery
  module Projects
    class Project < Refinery::Core::BaseModel
      self.table_name = 'refinery_projects'

      attr_accessible :name, :description, :position

      validates :name, :presence => true, :uniqueness => true
    end
  end
end
