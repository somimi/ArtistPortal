class PagesController < ApplicationController
  def home
    if current_user.is_juror?
      render "juror_homepage"
    end
  end

  def contact
  end

  def faq
  end
  
  def visual_art
  end
  
  def film_video
  end
  
  def literary
  end
  
  def installation
  end
  
  def performance
  end
  
  def dj
  end
  
  def store
  end

end
