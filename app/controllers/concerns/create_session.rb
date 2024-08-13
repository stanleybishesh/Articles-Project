module CreateSession
    def find_organization_by_org_id
        Organization.find_by(id: params[:organization_id])
    end

    def find_org_user_by_email
        @org.users.find_by(email: params[:email])
    end

    def signin_if_valid_user
        if !@user
            super do |resource|
                render :new, notice: 'User not found.'
            end
        else
            if !@user.valid_password?(params[:password])
                redirect_to new_user_session_path, notice: "Wrong password !"
            else
                sign_in_and_redirect @user
            end
        end
    end

    def validate_organization
        if @org.nil?
        redirect_to new_user_session_path, notice: 'Organization not found.'
        end
    end
end