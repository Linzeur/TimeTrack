class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :name, :client, :category, :start_date, :end_date, :closed, :estimated_cost, :real_cost, :members, :weekly

  def members
    self.object.users.select("users.id, users.name, users.role")
  end


  def weekly
    self.object.weekly_project_reports.select("weekly_project_reports.id, weekly_project_reports.week, weekly_project_reports.estimated_cost, weekly_project_reports.real_cost")
  end

end