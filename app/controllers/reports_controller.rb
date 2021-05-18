class ReportsController < ApplicationController
  before_action :set_report, only: %i[ show update ]

  # GET /reports or /reports.json
  def index
    @discussion_reports = DiscussionReport.all
    @reply_report = ReplyReport.all
  end

  # GET reports/reply
  def show_reply
    @report = ReplyReport.find(params[:id])
  end

  # GET reports/discussion
  def show_discussion
    @report = DiscussionReport.find(params[:id])
  end

  # create a new report
  def create
    if is_discussion
      @report = DiscussionReport.new({discussion_id: params[:discussion_id], user: current_user})
    else
      @report = ReplyReport.new({reply_id: params[:reply_id], user: current_user})
    end
    #If the report is made by volunteer hide content until reviewed
    if helpers.volunteer?
      @report.review_status = :unreviewed_hidden
    else
      @report.review_status = :unreviewed
    end
    respond_to do |format|
      if @report.save
        format.js{}
      end
    end
  end

  #Update an existing report
  def update
    respond_to do |format|
      if @report.update(report_params)
        format.html { redirect_to reports_path, notice: "Discussion was successfully updated." }
      else
        if is_discussion
          format.html { redirect_to report_path, params: {discussion_id: params[:discussion_id]}}
        else
          format.html { redirect_to report_path, params: {reply_id: params[:reply_id]}}
        end

      end
    end
  end

  private
    #If discussion_id param is present find report of that discussion
    #Otherwise use reply_id param to find report of that reply
    def set_report
      if is_discussion
        @report = DiscussionReport.where(discussion_id: params[:discussion_id])
      else
        @report = ReplyReport.where(reply_id: params[:reply_id])
      end
    end

    def report_params
      params.permit(:review_status, :admin_comment)
    end

    def is_discussion
      params.has_key?(:discussion_id)
    end
end
