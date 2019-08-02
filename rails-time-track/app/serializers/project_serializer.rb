class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :name, :client, :category, :start_date, :end_date, :closed, :estimated_cost, :real_cost, :members, :weekly, :user_detail

  def members
    self.object.users.select("users.id, users.name, users.role")
  end

  def daily
    self.object.daily_logs.select("daily_logs.id, daily_logs.project_member_id, daily_logs.date, daily_logs.amount")
  end


  def weekly
    self.object.weekly_project_reports.select("weekly_project_reports.id, weekly_project_reports.week, weekly_project_reports.estimated_cost, weekly_project_reports.real_cost")
  end

  def user_detail
    self.object.project_members.where(user_id: current_user).select("id","estimated_cost", "real_cost")
  end

end