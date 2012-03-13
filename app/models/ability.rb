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
     elsif current_user.is_performance_admin?
        can :manage, PerformanceSubmission
     elsif current_user.is_literary_admin?
        can :manage, LiterarySubmission
    else
       #can :create, VisualSubmission
       can :create, Artist
       #can :create, LiterarySubmission
       can :create, StoreSubmission
       can :create, FilmSubmission
       can :create, PerformanceSubmission
       #can :create, InstallationSubmission
       
       can :manage, VisualSubmission do |visual_submission|
         visual_submission.artist.try(:user) == current_user
       end 
       
       can :manage, StoreSubmission do |store_submission|
         store_submission.artist.try(:user) == current_user
       end
       
       can :read, LiterarySubmission do |literary_submission|
         literary_submission.artist.try(:user == current_user)
       end
       
       can :manage, PerformanceSubmission do |performance_submission|
         performance_submission.artist.try(:user == current_user)
       end
       
       can :read, InstallationSubmission do |installation_submission|
         installation_submission.artist.try(:user == current_user)
       end
       
       can :manage, FilmSubmission do |film_submission|
         film_submission.artist.try(:user == current_user)
       end
       
       can :manage, Artist do |artist|
         artist.try(:user) == current_user
       end
     end
  end
end
