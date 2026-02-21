class Operation < ApplicationRecord
  belongs_to :category
  enum :otype, [:expense, :income]

  validates :amount,
    presence: true,
    numericality: { greater_than: 0 }
  validates :odate, presence: true
  validates :description, presence: true

  scope :between_dates, ->(start_date, end_date) {
    where(odate: start_date..end_date)
  }

  def otype_human
    income? ? "Дохід" : "Витрата"
  end

  def ocategory_human
    Category.find_by_id(category_id).name
  end

end
