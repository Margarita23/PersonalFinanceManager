module Reports
  class GroupedResultBuilder
    def self.call(data)
      grouped = Hash.new { |h, k| h[k] = { "income" => 0, "expense" => 0 } }

      data.each do |(key, otype), amount|
        grouped[key][otype] = amount.to_f
      end

      {
        labels: grouped.keys,
        income: grouped.values.map { |v| v["income"] },
        expense: grouped.values.map { |v| v["expense"] }
      }
    end
  end
end
