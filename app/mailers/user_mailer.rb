class UserMailer < ActionMailer::Base

    def signup_confirmation(user)
      @user = user
      mail( reply_to: "dylan.conlin@skfoodgroup.com",
            from: "dylan.conlin@skfoodgroup.com",      
            to: @user.email, 
            subject: "Sign Up Confirmation")
    end

    def production_check_alert(users,production_check)
      @users = users
      @production_check = production_check

        if @production_check.label_readability == true
          @subject = "Label Readability"
        elsif @production_check.label_accuracy == true
          @subject = "Label Accuracy"
        elsif @production_check.seal_integrity == true
          @subject = "Seal Integrity"
        elsif @production_check.build_accuracy == true
          @subject = "Build Accuracy"
        end

      email_with_name = "Quality Assurance <#{@production_check.user.email}>"
      mail( reply_to: @production_check.user.email,
            from: email_with_name,
            to: @users.map {|user| user.email}, 
            subject: "#{@subject} concern: WO #{@production_check.workorder}")
    end

    def notify_on_new_comment(bcc,content,comment,issue,comments)
      @comments = comments
      @bcc = bcc
      @content = content
      @comment = comment
      @issue = issue
      email_with_name = "#{@comment.user.name} <#{@comment.user.email}>"
       mail( reply_to: @comment.user.email,
             from: email_with_name,
             to: bcc,
             subject: "re: " + @issue.short_description)


    end

    def notify_on_new_issue(bcc,description,user,issue,short_description)


      @bcc = bcc
      @description = description
      @user = user
      @issue = issue
      @short_description = short_description
      email_with_name = "#{@user.name} <#{@user.email}>"
       mail( reply_to: @user.email,
             from: email_with_name,
             to: bcc,
             subject: @short_description)


    end

    def send_nc_report(recipient)
      @recipient = recipient

      mail( to: @recipient, subject: "New account information")
    end

end
