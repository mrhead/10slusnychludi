class VotesController < ApplicationController
  def new
    @vote = Vote.new
  end

  def create
    @vote = Vote.new(vote_params)

    if @vote.save
      redirect_to root_path, notice: "Váš hlas bol započítaný! Ďakujeme, že Vám to nie je jedno!"
    else
      render "new"
    end
  end

  private

  def vote_params
    params.require(:vote).permit(:name, :city, :email, :public)
  end
end
