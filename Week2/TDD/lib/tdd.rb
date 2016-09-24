









class Array

  def my_uniq
    results = []
    self.each do |el|
      results << el unless results.include?(el)
    end
    results
  end

  def two_sum
    results = []
    self.each_with_index do |el, i|
      self[(i + 1)..-1].each_with_index do |el2, j|
        results << [i, (j + i + 1)] if el + el2 == 0
      end
    end
    results
  end

  def my_transpose
    transposed = Array.new(self.size) { [] }

    self.each_with_index do |row_arr, row_i|
      row_arr.each_with_index do |el, i|
        transposed[i][row_i] = el
      end
    end
    transposed
  end

end


def stock_picker(stock_prices)
  best_days = nil
  best_price = 0

  stock_prices.each_with_index do |price, day|
    stock_prices[(day + 1)..-1].each_with_index do |sell_price, sell_day|
      if price - sell_price > best_price
        best_days = [day, sell_day + day + 1]
        best_price = price - sell_price
      end
    end
  end
  best_days
end
