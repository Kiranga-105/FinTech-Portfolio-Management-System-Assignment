class SendLogsController < ApplicationController
  def index
    @logs = SendLog.includes(:contact, :email_template).order(created_at: :desc).limit(200)
  end

  def show
    @log = SendLog.find(params[:id])
  end
end
