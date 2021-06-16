module PortfoliosHelper
  def NoPortfoliosMessage(user)
    "No portfolios found." + AddYours(user)
  end

  def AddYours(user)
    return (button_to 'Set yours to public!', edit_portfolio_path(user.portfolio), method: :get).html_safe if user.present? and user.portfolio
    (button_to 'Add Yours!', new_portfolio_path, method: :get)
  end
end
