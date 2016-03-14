class VotesController < ApplicationController
  before_action :load_people
  before_action :load_votes

  def new
    @vote = Vote.new
  end

  def create
    @vote = Vote.new(vote_params)

    if verify_recaptcha(model: @vote, message: "Prosím potvrďte, že nie ste robot") && @vote.save
      redirect_to root_path, notice: "Váš hlas bol započítaný! Ďakujeme, že Vám to nie je jedno!"
    else
      render "new"
    end
  end

  private

  def vote_params
    params.require(:vote).permit(:name, :city, :email, :public)
  end

  def load_people
    @people = [
        # good
        {
            name: 'Miroslav Beblavý',
            party: 'SIEŤ',
            current_state: :good,
            fb_link: 'https://www.facebook.com/beblavy/',
        },
        {
            name: 'Katarína Macháčková',
            party: 'SIEŤ',
            current_state: :good,
            fb_link: 'https://www.facebook.com/machackovak',
        },


        # dont_know - most
        {
            name: 'Lucia Žitňanská',
            party: 'MOST-HÍD',
            current_state: :dont_know,
            fb_link: 'https://www.facebook.com/lucia.zitnanska.5',
        },
        {
            name: 'Zsolt Simon',
            party: 'MOST-HÍD',
            current_state: :dont_know,
            fb_link: 'https://www.facebook.com/zsoltsimon.eu',
        },
        {
            name: 'László Sólymos',
            party: 'MOST-HÍD',
            current_state: :dont_know,
            fb_link: 'https://www.facebook.com/laci.solymos',
        },
        {
            name: 'František Šebej',
            party: 'MOST-HÍD',
            current_state: :dont_know,
            fb_link: 'https://www.facebook.com/FeroSebej',
        },

        {
            name: 'Ivan Švejna',
            party: 'MOST-HÍD',
            current_state: :dont_know,
            fb_link: 'https://www.facebook.com/Ivan-Švejna-173039962708',
        },

        {
            name: 'Gábor Gál',
            party: 'MOST-HÍD',
            current_state: :dont_know,
            fb_link: 'https://www.facebook.com/gabor.gal.583',
        },

        {
            name: 'Tibor Bastrnák',
            party: 'MOST-HÍD',
            current_state: :dont_know,
            fb_link: 'https://www.facebook.com/Bastrnák-Tibor-136276779732548',
        },

        {
            name: 'Peter Kresák',
            party: 'MOST-HÍD',
            current_state: :dont_know,
            fb_link: 'https://www.facebook.com/peterkresak20',
        },
        {
            name: 'Arpád Érsek',
            party: 'MOST-HÍD',
            current_state: :dont_know,
            fb_link: 'https://www.facebook.com/PaedDr-Érsek-Árpád-1801232070103491/',
        },

        {
            name: 'Elemér Jakab',
            party: 'MOST-HÍD',
            current_state: :dont_know,
            fb_link: 'https://www.facebook.com/elemer.jakab.9',
        },

        # dont_know - siet

        {
            name: 'Alena Bašistová',
            party: 'SIEŤ',
            current_state: :dont_know,
            fb_link: 'https://www.facebook.com/Alenka.Basistova',
        },
        {
            name: 'Katarína Cséfalvayová',
            party: 'SIEŤ',
            current_state: :dont_know,
            fb_link: 'https://www.facebook.com/CsefalvayovaKatarina/',
        },
        {
            name: 'Eduard Adamčík',
            party: 'SIEŤ',
            current_state: :dont_know,
            fb_link: 'https://www.facebook.com/EdoAdamcik',
        },
        {
            name: 'Igor Janckulík',
            party: 'SIEŤ',
            current_state: :dont_know,
            fb_link: 'https://www.facebook.com/ijanckulik',
        },
        {
            name: 'Martin Fedor',
            party: 'SIEŤ',
            current_state: :dont_know,
            fb_link: 'https://www.facebook.com/martin.fedor.SIET',
        },
        {
            name: 'Simona Petrík',
            party: 'SIEŤ',
            current_state: :dont_know,
            fb_link: 'https://www.facebook.com/SimonaPetrik/',
        },


        # not good
        {
            name: 'Béla Bugár',
            party: 'MOST-HÍD',
            current_state: :not_good,
            fb_link: 'https://www.facebook.com/bela.bugar.5',
        },
        {
            name: 'Radoslav Procházka',
            party: 'SIEŤ',
            current_state: :not_good,
            fb_link: 'https://www.facebook.com/prochazka.rado',
        },
        {
            name: 'Andrej Hrnčiar',
            party: 'SIEŤ',
            current_state: :not_good,
            fb_link: 'https://www.facebook.com/ahrnciar',
        },
    ]
  end

  def load_votes
    @votes = Vote.visible.order(id: :desc).limit(210)
  end
end
