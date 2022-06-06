class AddReportPostedUserIdToReports < ActiveRecord::Migration[6.1]
  def change
    add_column :reports, :report_posted_user_id, :integer
  end
end
