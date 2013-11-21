module Refinery
  module Projects
    class ProjectsController < ::ApplicationController

      before_filter :find_all_projects
      before_filter :find_page
      #before_filter :find_tags

      def index
        if params[:tag]
          @projects = Project.tagged_with(params[:tag])
        else
          @projects = Project.all
        end
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @project in the line below:
        #present(@page)

      end

      def show
        @project = Project.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @project in the line below:
        present(@page)
      end

      #def tagged
      #  @tag = ActsAsTaggableOn::Tag.find(params[:tag_id])
      #  @tag_name = @tag.name
      #  #@posts = Post.live.tagged_with(@tag_name).page(params[:page])
      #end

    protected

      def find_all_projects
        @projects = Project.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/projects").first
      end

      

    end
  end
end
