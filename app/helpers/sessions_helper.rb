
module SessionsHelper

# create_session sets user_id on the session object to user.id, which is unique for each user
# session is an object Rails provides to track the state of a particular user and only one user.
     def create_session(user)
       session[:user_id] = user.id
     end



# we clear the user id on the session object by setting it to nil and therefore can't track it via their user id
     def destroy_session(user)
       session[:user_id] = nil
     end
=begin
Returns the current user of the application...current_user encapsulates the pattern of finding
the current user that we would otherwise call throughout Bloccit. current_user is our shortcut
to that functionality as it finds the signed in user by taking the user id from the session
and searching the database for the user in question.
=end
     def current_user
       User.find_by(id: session[:user_id])
     end

end
