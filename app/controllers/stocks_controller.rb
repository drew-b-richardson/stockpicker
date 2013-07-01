class StocksController < ApplicationController
  def rate

    @watchlists = WatchList.all
    @watchlists = [] if @watchlists == nil
    @stock_results = []
    if params[:stocks] != nil
      stock_symbols = Stock.parse_stocks(params[:stocks])
      stock_symbols.each do |symbol|
        stock = Stock.new(symbol, params[:scenarios])
        if stock.is_valid
          @stock_results << stock
        end
      end

      #set normalized values
      if @stock_results.count > 0
        @stock_results = Criterion.set_normalized_values @stock_results

        #find scores
        @stock_results.each do |stock| 
          stock.scenario.scenarioCriterions.each do |sc| 
            stock.score += sc.weighted_value
          end  
        end  

        #sort the stocks by best score
        @stock_results.sort_by! { |stock| stock.score }.reverse!
      end

    end

  end

  def ajax
    wl = WatchList.find(params[:id])
    @stocks = wl.stocks 
    render :layout => false 
  end

  def charts
    @stock_symbols = []
    @watchlists = WatchList.all
    @watchlists = [] if @watchlists == nil
    if params[:stocks] != nil
      @stock_symbols = Stock.parse_stocks(params[:stocks])
    end

  end
end
