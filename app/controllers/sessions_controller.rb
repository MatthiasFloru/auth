class SessionsController < ApplicationController

    def new
    end

    def create
        # Step 1: check to see if there is a user with the email provided
        @user = User.find_by({"email" => params["email"]})
        if @user
            # Step 1a: if yes, check the password (go to step 2)
            # Step 2: check the password to check if it matches the users password
            if @user["password"]==params["password"]
                # Step 2a: if yes, go to the companies page
                redirect_to "/companies"
            else
                # Step 2b: if no, go back to the login page
                redirect_to "/sessions/new"
            end
        else
            # Step 1b: if no, go back to the login page
            redirect_to "/sessions/new"
        end

    end

end
