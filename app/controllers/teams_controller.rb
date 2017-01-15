class TeamsController < ApplicationController
	# assign team to current team
	before_action :set_team, only: [:show]

  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:id])
    end
end
