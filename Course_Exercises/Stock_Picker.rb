


def stock_picker(prices)

    best_days = [0, 0]
    max_profit = 0
    min_price = 0

    prices.each_with_index do |price, current_day|
        if price < prices[min_price]
            min_price = current_day
        end

        profit = price - prices[min_price]

        if profit > max_profit
            max_profit = profit
            best_days = [min_price, current_day]
        end
    end

    best_days

end


prices = [17, 3, 6, 9, 15, 8, 6, 1, 10]
p stock_picker(prices)