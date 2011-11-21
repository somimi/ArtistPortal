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
       can :manage, VisualSubmission do |visual_submission|
         visual_submission.artist.try(:user) == current_user
       end 
       can :read, Artist do |artist|
         artist.try(:user) == current_user
       end
       can :update, Artist do |artist|
         artist.try(:user) == current_user
       end
     end 

  end
end
