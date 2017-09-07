class WikiPolicy < ApplicationPolicy
  class Scope
     attr_reader :user, :scope

     def initialize(user, scope)
       @user = user
       @scope = scope
     end

     def resolve
       wikis = []
       if user && user.role == 'admin'
         wikis = scope.all
       elsif user && user.role == 'premium'
         all_wikis = scope.all
         all_wikis.each do |wiki|
           if wiki.private != true || wiki.user_id == user.id || wiki.users.include?(user)
             wikis << wiki
           end
         end
       else # standard user
         all_wikis = scope.all
         wikis = []
         all_wikis.each do |wiki|
           if wiki.private != true || wiki.users.include?(user)
             wikis << wiki # only show standard users public wikis and private wikis they are a collaborator on
           end
         end
       end
       wikis # return the wikis array
     end
   end
end
