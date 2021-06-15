module ApplicationHelper
  def getLoginBanner(user)
    if user.present?
      return loggedInFragment(user)
    end
    link_to user_twitter_omniauth_authorize_path, method: :post do
      image_tag("sign-in-with-twitter-gray.png.twimg.1920.png", alt: "Sign in with Twitter")
    end
  end

  def loggedInFragment(user)
    message = "Signed in as "
    message += user.name if user.name.present?
    message += " (" if (user.name.present? && user.username.present?)
    message += "@" + user.username
    message += ") " if (user.name.present? && user.username.present?)
    message
  end
end
