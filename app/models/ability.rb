class Ability
  include CanCan::Ability

  def initialize(current_user)
   current_user ||= User.new # guest user (not logged in)
     if current_user.is_admin?
       can :manage, :all
     elsif current_user.is_juror?
       can :manage, :all
     elsif current_user.is_handler?
        can :manage, :Artist
        can :manage, :VisualSubmission
    else
       can :create, VisualSubmission
       can :create, Artist
       can :create, LiterarySubmission
       can :create, StoreSubmission
       can :create, FilmSubmission
       can :create, PerformanceSubmission
       can :create, InstallationSubmission
       
       can :manage, VisualSubmission do |visual_submission|
         visual_submission.artist.try(:user) == current_user
       end 
       
       can :manage, StoreSubmission do |store_submission|
         store_submission.artist.try(:user) == current_user
       end
       
       can :manage, LiterarySubmission do |literary_submission|
         literary_submission.artist.try(:user == current_user)
       end
       
       can :manage, PerformanceSubmission do |performance_submission|
         performance_submission.artist.try(:user == current_user)
       end
       
       can :manage, InstallationSubmission do |installation_submission|
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
