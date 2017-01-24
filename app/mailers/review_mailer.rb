class ReviewMailer < ApplicationMailer
  def new_review(review)
    @review = review

    mail(
      to: review.shoe.user.email,
      subject: "New Review for #{review.shoe.brand} #{review.shoe.model} #{review.shoe.version}"
    )
  end
end
