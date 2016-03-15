class VotesController < ApplicationController
  before_action :load_people
  before_action :load_votes

  def new
    @vote = Vote.new
  end

  def create
    @vote = Vote.new(vote_params)
    @vote.ip = request.remote_ip

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
            number: 2,
            name: 'Miroslav Beblavý',
            party: 'SIEŤ',
            current_state: :good,
            fb_link: 'https://www.facebook.com/beblavy/',
        },
        {
            number: 4,
            name: 'Katarína Macháčková',
            party: 'SIEŤ',
            current_state: :good,
            fb_link: 'https://www.facebook.com/machackovak',
        },
        {
            number: 10,
            name: 'Simona Petrík',
            party: 'SIEŤ',
            current_state: :good,
            fb_link: 'https://www.facebook.com/SimonaPetrik/',
        },


        # dont_know - most
        {
            number: 2,
            name: 'Lucia Žitňanská',
            party: 'MOST-HÍD',
            current_state: :dont_know,
            fb_link: 'https://www.facebook.com/lucia.zitnanska.5',
        },
        {
            number: 3,
            name: 'Zsolt Simon',
            party: 'MOST-HÍD',
            current_state: :dont_know,
            fb_link: 'https://www.facebook.com/zsoltsimon.eu',
        },
        {
            number: 4,
            name: 'László Sólymos',
            party: 'MOST-HÍD',
            current_state: :dont_know,
            fb_link: 'https://www.facebook.com/laci.solymos',
        },
        {
            number: 5,
            name: 'František Šebej',
            party: 'MOST-HÍD',
            current_state: :dont_know,
            fb_link: 'https://www.facebook.com/FeroSebej',
        },

        {
            number: 6,
            name: 'Ivan Švejna',
            party: 'MOST-HÍD',
            current_state: :dont_know,
            fb_link: 'https://www.facebook.com/Ivan-Švejna-173039962708',
        },

        {
            number: 7,
            name: 'Gábor Gál',
            party: 'MOST-HÍD',
            current_state: :dont_know,
            fb_link: 'https://www.facebook.com/gabor.gal.583',
        },

        {
            number: 8,
            name: 'Tibor Bastrnák',
            party: 'MOST-HÍD',
            current_state: :dont_know,
            fb_link: 'https://www.facebook.com/Bastrnák-Tibor-136276779732548',
        },

        {
            number: 9,
            name: 'Peter Kresák',
            party: 'MOST-HÍD',
            current_state: :dont_know,
            fb_link: 'https://www.facebook.com/peterkresak20',
        },
        {
            number: 10,
            name: 'Arpád Érsek',
            party: 'MOST-HÍD',
            current_state: :dont_know,
            fb_link: 'https://www.facebook.com/PaedDr-Érsek-Árpád-1801232070103491/',
        },

        {
            number: 11,
            name: 'Elemér Jakab',
            party: 'MOST-HÍD',
            current_state: :dont_know,
            fb_link: 'https://www.facebook.com/elemer.jakab.9',
        },

        # dont_know - siet

        {
            number: 5,
            name: 'Alena Bašistová',
            party: 'SIEŤ',
            current_state: :dont_know,
            fb_link: 'https://www.facebook.com/Alenka.Basistova',
        },
        {
            number: 6,
            name: 'Katarína Cséfalvayová',
            party: 'SIEŤ',
            current_state: :dont_know,
            fb_link: 'https://www.facebook.com/CsefalvayovaKatarina/',
        },
        {
            number: 7,
            name: 'Eduard Adamčík',
            party: 'SIEŤ',
            current_state: :dont_know,
            fb_link: 'https://www.facebook.com/EdoAdamcik',
        },
        {
            number: 8,
            name: 'Igor Janckulík',
            party: 'SIEŤ',
            current_state: :dont_know,
            fb_link: 'https://www.facebook.com/ijanckulik',
        },
        {
            number: 9,
            name: 'Martin Fedor',
            party: 'SIEŤ',
            current_state: :dont_know,
            fb_link: 'https://www.facebook.com/martin.fedor.SIET',
        },

        # dont_know sns
        {
            number: 2,
            name: 'Jaroslav Paška',
            party: 'SNS',
            current_state: :dont_know,
            fb_link: 'https://www.facebook.com/Jaroslav-Pa%C5%A1ka-480862355305905/',
        },
        {
            number: 3,
            name: 'Eva Smolíková',
            party: 'SNS',
            current_state: :dont_know,
            fb_link: 'https://www.facebook.com/eva.smolikova.7',
        },
        {
            number: 4,
            name: 'Anton Hrnko',
            party: 'SNS',
            current_state: :dont_know,
            fb_link: 'https://www.facebook.com/hrnkoa',
        },
        {
            number: 5,
            name: 'Štefan Zelník',
            party: 'SNS',
            current_state: :dont_know,
            fb_link: 'https://www.facebook.com/profile.php?id=100011224058696',
        },
        {
            number: 6,
            name: 'Dušan Tittel',
            party: 'SNS',
            current_state: :dont_know,
            fb_link: 'https://www.facebook.com/profile.php?id=100008191088562',
        },
        {
            number: 7,
            name: 'Karol Farkašovský',
            party: 'SNS',
            current_state: :dont_know,
            fb_link: 'https://www.facebook.com/karol.farkasovsky.3',
        },
        {
            number: 8,
            name: 'Jaroslav Ridoško',
            party: 'SNS',
            current_state: :dont_know,
            fb_link: 'https://www.facebook.com/Jaroslav-Rido%C5%A1ko-941964929198864/',
        },
        {
            number: 9,
            name: 'Stanislav Kmec',
            party: 'SNS',
            current_state: :dont_know,
            fb_link: 'https://www.facebook.com/profile.php?id=100006719386670',
        },
        {
            number: 10,
            name: 'Rudolf Urbanovič',
            party: 'SNS',
            current_state: :dont_know,
            fb_link: '',
        },
        {
            number: 11,
            name: 'Magdaléna Kuciaňová',
            party: 'SNS',
            current_state: :dont_know,
            fb_link: 'https://www.facebook.com/JUDr-Magdal%C3%A9na-Kucia%C5%88ov%C3%A1-341970375996980',
        },
        {
            number: 12,
            name: 'Tibor Bernaťák',
            party: 'SNS',
            current_state: :dont_know,
            fb_link: '',
        },
        {
            number: 13,
            name: 'Peter Pamula',
            party: 'SNS',
            current_state: :dont_know,
            fb_link: 'https://www.facebook.com/peter.pamula.5',
        },
        {
            number: 14,
            name: 'Radovan Baláž',
            party: 'SNS',
            current_state: :dont_know,
            fb_link: 'https://www.facebook.com/Radovan-Bal%C3%A1%C5%BE-1395127874127492',
        },
        {
            number: 15,
            name: 'Eva Antošová',
            party: 'SNS',
            current_state: :dont_know,
            fb_link: 'https://www.facebook.com/antosova.sk/',
        },



        # not good
        {
            number: 1,
            name: 'Béla Bugár',
            party: 'MOST-HÍD',
            current_state: :not_good,
            fb_link: 'https://www.facebook.com/bela.bugar.5',
        },
        {
            number: 1,
            name: 'Radoslav Procházka',
            party: 'SIEŤ',
            current_state: :not_good,
            fb_link: 'https://www.facebook.com/prochazka.rado',
        },
        {
            number: 3,
            name: 'Andrej Hrnčiar',
            party: 'SIEŤ',
            current_state: :not_good,
            fb_link: 'https://www.facebook.com/ahrnciar',
        },
        {
            number: 1,
            name: 'Andrej Danko',
            party: 'SNS',
            current_state: :not_good,
            fb_link: 'https://www.facebook.com/andrejdanko.sk/',
        },
    ]
  end

  def load_votes
    @votes = Vote.visible.order(id: :desc).limit(300)
  end
end
