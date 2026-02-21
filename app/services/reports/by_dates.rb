module Reports
  class ByDates
    def self.call(user, start_date, end_date)
			start_date = start_date.present? ? Date.parse(start_date) : user.operations.minimum(:odate)
			end_date = end_date.present? ? Date.parse(end_date) : user.operations.maximum(:odate)

			data = user.operations
							.between_dates(start_date, end_date)
							.group(:odate, :otype)
							.sum(:amount)

			Reports::GroupedResultBuilder.call(data)
		end
  end
end

