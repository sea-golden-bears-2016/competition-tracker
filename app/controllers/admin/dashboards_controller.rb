class Admin::DashboardsController < AdminController

  def show
    @league1 = League.all.first
    @league2 = League.all.last
  end

end
