module Reports
  class ByDates
    def self.call(start_date, end_date)
			start_date = start_date.present? ? Date.parse(start_date) : Operation.minimum(:odate)
			end_date = end_date.present? ? Date.parse(end_date) : Operation.maximum(:odate)

			data = Operation
							.between_dates(start_date, end_date)
							.group(:odate, :otype)
							.sum(:amount)

			Reports::GroupedResultBuilder.call(data)
		end
  end
end

