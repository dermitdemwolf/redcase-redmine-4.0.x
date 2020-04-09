
class Redcase::ExecutionjournalsController < ApplicationController

	unloadable
	before_action :find_project, :authorize

	def index
		journals =
			if !params[:issue_id].nil?
				ExecutionJournal.find_by_issue_id(params[:issue_id])
			else
				ExecutionJournal.order('created_on desc')
			end
		render :json => journals.map(&:to_json)
	end

	# TODO: Extract to a base controller.
	def find_project
		@project = Project.find(params[:project_id])
	end
	
	def create
		user = User.current
		tracker = @project.trackers.find_by_name("Bug")
		status = IssueStatus.find_by_name("New")
		version = Version.find_by_project_id_and_name(@project.id, params[:version])
		issue = Issue.new(
			:author => user,
			:project => @project,
			:tracker => tracker			
		)
		issue.subject = "Failed #{params[:environment]}: #{params[:title]}"
		issue.description = "#{params[:description]}"
		issue.fixed_version = version
		issue.save!
		
		testcase = Issue.find(params[:testcase_id])
		IssueRelation.create!(:relation_type => 'relates', :issue_from => issue, :issue_to => testcase)
		
		Rails.logger.info "created issue #{issue.id}"
		
		render :json => { :success => true, :issue_id => issue.id }
	end
end

