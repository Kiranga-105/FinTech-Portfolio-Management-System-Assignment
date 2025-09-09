class Contact < ApplicationRecord
  belongs_to :organization, optional: true
  has_many :portfolios, dependent: :destroy

  def best_portfolio
    portfolios.max_by(&:performance)
  end

  def worst_portfolio
    portfolios.min_by(&:performance)
  end
end
