class ApplicantMailer < ApplicationMailer
  def contact(email:)
    @email = email
    @applicant = @email.applicant
    @user = @email.user

    mail(
      to: @applicant.email,
      from: "reply-#{@user.email_alias}@hotwiringrails.com",
      # from: @user.email,
      subject: @email.subject
    )
  end
end
