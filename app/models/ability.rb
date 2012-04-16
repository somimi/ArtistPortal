class Ability
  include CanCan::Ability

  def initialize(current_user)
   current_user ||= User.new # guest user (not logged in)
     if current_user.is_admin?
       can :manage, :all
     elsif current_user.is_juror?
       can :manage, VisualSubmission
     elsif current_user.is_handler?
        can :manage, Artist
        can :manage, VisualSubmission
     elsif current_user.is_film_admin?
        can :manage, FilmSubmission
        can :manage, Artist
     elsif current_user.is_performance_admin?
        can :manage, PerformanceSubmission
        can :manage, Artist
     elsif current_user.is_literary_admin?
        can :manage, Artist
        can :manage, LiterarySubmission
     elsif current_user.is_installation_admin?
        can :manage, InstallationSubmission
        can :manage, Artist
     elsif current_user.is_store_admin?
        can :manage, StoreSubmission
        can :manage, Artist
        can :read, VisualSubmission
      elsif current_user.is_art_guide?
        can :manage, :all
      elsif current_user.is_invited?
        can :create, VisualSubmission
        can :create, Artist
        
        can :manage, VisualSubmission do |visual_submission|
          visual_submission.artist.try(:user) == current_user
        end 

        can :manage, StoreSubmission do |store_submission|
          store_submission.artist.try(:user) == current_user
        end
        
    else
       can :create, VisualSubmission
       can :create, Artist
       #can :create, LiterarySubmission
       can :create, StoreSubmission
       can :create, FilmSubmission
       can :create, PerformanceSubmission
       #can :create, InstallationSubmission
       
       can :read, VisualSubmission do |visual_submission|
         visual_submission.artist.try(:user) == current_user
       end 
       
       can :manage, StoreSubmission do |store_submission|
         store_submission.artist.try(:user) == current_user
       end
       
       can :read, LiterarySubmission do |literary_submission|
         literary_submission.artist.try(:user == current_user)
       end
       
       can :read, PerformanceSubmission do |performance_submission|
         performance_submission.artist.try(:user == current_user)
       end
       
       can :read, InstallationSubmission do |installation_submission|
         installation_submission.artist.try(:user == current_user)
       end
       
       can :read, FilmSubmission do |film_submission|
         film_submission.artist.try(:user == current_user)
       end
       
       can :read, Artist do |artist|
         artist.try(:user) == current_user
       end
     end
  end
end
