class Admin::MatchesController < AdminController

  def new
    @current_league = League.find(params['league_id'])
    @match = @current_league.matches.new
    @round_options = [1, 2, 3, 4, 5]

    @competitor_options = @current_league.competitors.collect do |p|
     [ p.name, p.id ]
    end

  end

  def create
    @current_league = League.find(params['league_id'])
    @match = @current_league.matches.new(match_params)
    @round_options = [1, 2, 3, 4, 5]

    @competitor_options = @current_league.competitors.collect do |p|
     [ p.name, p.id ]
    end

    if @match.save
      redirect_to '/admin/dashboard'
    else
      render :new
    end
  end

  def update
    match = Match.find(params[:id])
    match.winner = match.competitors.find(params[:competitor_id])
    index = match.competitors.find_index(match.winner)
    index == 0 ? match.loser = match.competitors[1] : match.loser = match.competitors[0]
    match.update_attribute(:winner_id, match.winner.id)
    match.update_attribute(:loser_id, match.loser.id)
  end

  private
  def match_params
    params.require(:match).permit(:round_number, :competitor_one_id, :competitor_two_id)
  end

end
