require 'sidekiq-scheduler'
require 'sidekiq/pro/web'
require 'sidekiq-scheduler/web'

class MailerJob
    include Sidekiq::Worker

    def perform
        data = User.all
        data.each do |user|
            UserMailer.hello_email(user).deliver_now
        end
    end
end