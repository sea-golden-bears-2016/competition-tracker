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
      redirect_to @match
    else
      render :new
    end

  end

  private
  def match_params
    params.require(:match).permit(:round_number, :competitor_one_id, :competitor_two_id)
  end

end
