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
        {
            name: 'Simona Petrík',
            party: 'SIEŤ',
            current_state: :good,
            fb_link: 'https://www.facebook.com/SimonaPetrik/',
        },
        {
            name: 'Zsolt Simon',
            party: 'MOST-HÍD',
            current_state: :good,
            fb_link: 'https://www.facebook.com/zsoltsimon.eu',
        },


        # dont_know - most
        {
            name: 'Lucia Žitňanská',
            party: 'MOST-HÍD',
            current_state: :dont_know,
            fb_link: 'https://www.facebook.com/lucia.zitnanska.5',
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

        # dont_know sns
        {
            name: 'Jaroslav Paška',
            party: 'SNS',
            current_state: :dont_know,
            fb_link: 'https://www.facebook.com/Jaroslav-Pa%C5%A1ka-480862355305905/',
        },
        {
            name: 'Eva Smolíková',
            party: 'SNS',
            current_state: :dont_know,
            fb_link: 'https://www.facebook.com/eva.smolikova.7',
        },
        {
            name: 'Anton Hrnko',
            party: 'SNS',
            current_state: :dont_know,
            fb_link: 'https://www.facebook.com/hrnkoa',
        },
        {
            name: 'Štefan Zelník',
            party: 'SNS',
            current_state: :dont_know,
            fb_link: 'https://www.facebook.com/profile.php?id=100011224058696',
        },
        {
            name: 'Dušan Tittel',
            party: 'SNS',
            current_state: :dont_know,
            fb_link: 'https://www.facebook.com/profile.php?id=100008191088562',
        },
        {
            name: 'Karol Farkašovský',
            party: 'SNS',
            current_state: :dont_know,
            fb_link: 'https://www.facebook.com/karol.farkasovsky.3',
        },
        {
            name: 'Jaroslav Ridoško',
            party: 'SNS',
            current_state: :dont_know,
            fb_link: 'https://www.facebook.com/Jaroslav-Rido%C5%A1ko-941964929198864/',
        },
        {
            name: 'Stanislav Kmec',
            party: 'SNS',
            current_state: :dont_know,
            fb_link: 'https://www.facebook.com/profile.php?id=100006719386670',
        },
        {
            name: 'Rudolf Urbanovič',
            party: 'SNS',
            current_state: :dont_know,
            fb_link: '',
        },
        {
            name: 'Magdaléna Kuciaňová',
            party: 'SNS',
            current_state: :dont_know,
            fb_link: 'https://www.facebook.com/JUDr-Magdal%C3%A9na-Kucia%C5%88ov%C3%A1-341970375996980',
        },
        {
            name: 'Tibor Bernaťák',
            party: 'SNS',
            current_state: :dont_know,
            fb_link: '',
        },
        {
            name: 'Peter Pamula',
            party: 'SNS',
            current_state: :dont_know,
            fb_link: 'https://www.facebook.com/peter.pamula.5',
        },
        {
            name: 'Radovan Baláž',
            party: 'SNS',
            current_state: :dont_know,
            fb_link: 'https://www.facebook.com/Radovan-Bal%C3%A1%C5%BE-1395127874127492',
        },
        {
            name: 'Eva Antošová',
            party: 'SNS',
            current_state: :dont_know,
            fb_link: 'https://www.facebook.com/antosova.sk/',
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
        {
            name: 'Andrej Danko',
            party: 'SNS',
            current_state: :not_good,
            fb_link: 'https://www.facebook.com/andrejdanko.sk/',
        },
    ]
  end

  def load_votes
    @votes = Vote.visible.correct.order(id: :desc).limit(300)
    @vote_count = Vote.correct.count
  end
end
