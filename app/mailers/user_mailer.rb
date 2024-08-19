class UserMailer < ApplicationMailer
    default from: 'bishesh.shrestha@fleetpanda.com'

    def hello_email(user)
        @user = user
        @url = "localhost:3000/"
        mail(to: user.email, subject: "Registration Success")
    end
end
