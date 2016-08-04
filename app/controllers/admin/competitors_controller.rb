class Admin::CompetitorsController < ApplicationController

  def create
    @league = League.find(params[:league_id])
    @league.competitors.create(competitor_form_params)
    redirect_to admin_league_path(@league)
  end

  private

  def competitor_form_params
    params.require(:competitor).permit(:name)
  end
end
