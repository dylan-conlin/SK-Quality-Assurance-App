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
       subject: commenter + " left a comment on your issue")


    end

    def notify_on_new_issue(bcc,description,user,issue)
      @bcc = bcc
      @description = description
      @user = user
      @issue = issue
       mail( to: bcc,
       subject: user.name + " would like you to know:")


    end

    

end
