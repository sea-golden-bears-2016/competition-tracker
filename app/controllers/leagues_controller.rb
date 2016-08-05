class LeaguesController < ApplicationController
  include LeagueViewHelper

  def index
    @league1 = League.all.first
    @league2 = League.all.last
  end

end
