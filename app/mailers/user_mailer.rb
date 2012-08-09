class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.signup_confirmation.subject
  #

    def signup_confirmation(user)
      @user = user
      
      mail to: user.email, subject: "Sign Up Confirmation"
    end

    def production_check_alert(users,production_check)
      @users = users
      @production_check = production_check

      mail to: @users.map {|user| user.email}, subject: "production check alert; WO: #{@production_check.workorder}"

    end

    def notify_on_new_comment(bcc,content,commenter,issue,comments)
      @comments = comments
      @bcc = bcc
      @content = content
      @commenter = commenter
      @issue = issue
       mail( to: bcc,
       subject: "re: " + @issue.short_description)


    end

    def notify_on_new_issue(bcc,description,user,issue,short_description)
      @bcc = bcc
      @description = description
      @user = user
      @issue = issue
      @short_description = short_description
       mail( to: bcc,
       subject: @short_description)


    end

    def send_nc_report(recipient)
      @recipient = recipient

      mail( to: @recipient, subject: "New account information")
    end

end
