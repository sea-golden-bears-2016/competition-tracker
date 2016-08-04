class Admin::DashboardsController < ApplicationController

  def show
    @league1 = League.all.first
    @league2 = League.all.last
  end

end
