class Admin::MatchesController < AdminController
  include ApplicationHelper

  def new
    @current_league = current_league
    @match = @current_league.matches.new
    options_for_form_new_match

  end

  def create
    @current_league = current_league
    @match = @current_league.matches.new(match_params)
    options_for_form_new_match

    if @match.save
      redirect_to '/admin/dashboard'
    else
      render :new
    end

  end

  private
  def match_params
    params.require(:match).permit(:round_number, :competitor_one_id, :competitor_two_id)
  end

end
