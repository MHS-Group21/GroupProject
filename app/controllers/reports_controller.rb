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

  # POST /reports or /reports.json
  def create
    if is_discussion
      @report = DiscussionReport.new({discussion_id: params[:discussion_id], user: current_user})
    else
      @report = ReplyReport.new({reply_id: params[:reply_id], user: current_user})
    end
    if current_user.volunteer?
      @report.review_status = 1
    else
      @report.review_status = 0
    end
    respond_to do |format|
      if @report.save
        format.js{}
      end
    end
  end

  # PATCH/PUT /reports/1 or /reports/1.json
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
    # Use callbacks to share common setup or constraints between actions.
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
