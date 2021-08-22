class Calculator
  def initialize(dollars, rubls, rate)
    @dollars = dollars
    @rubls = rubls
    @rate = rate
  end
  
  def count_dollars
    #найдем общее количество сбережений в долларах
    sum_in_dollars = (@rubls / @rate) + @dollars

    #найдем баланс
    balance = sum_in_dollars / 2

    #разница между балансом и количеством долларов
    diff = balance - @dollars
    rest_dollars = balance - @dollars
    [diff, rest_dollars]
  end

  def need_to_buy_dollars(count_dollars)
    if count_dollars[0].abs < 0.01
      "портфель сбалансирован"
    elsif count_dollars[1] < 0
      "Вам надо продать #{count_dollars[0].round(2).abs} $"
    else
      "Вам нужно купить #{count_dollars[0].round(2)} $"
    end
  end
end  
