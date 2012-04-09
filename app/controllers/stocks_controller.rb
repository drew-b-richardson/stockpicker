class StocksController < ApplicationController
  def rate
    @stocks = []
    if params[:stocks] != nil
      stock_symbols = Stock.parse_stocks(params[:stocks])
      stock_symbols.each do |symbol|
        stock = Stock.new(symbol, params[:scenarios])
        @stocks << stock
      end

      #set normalized values
      @stocks = Criterion.set_normalized_values @stocks

      #find scores
      @stocks.each do |stock| 
        stock.scenario.scenarioCriterions.each do |sc| 
          stock.score += sc.weighted_value
        end  
      end  

      #sort the stocks by best score
      @stocks.sort_by! { |stock| stock.score }.reverse!

    end

  end
end
