class StocksController < ApplicationController
  def rate

    @watchlists = WatchList.all
    @watchlists = [] if @watchlists == nil
    @stock_results = []
    if params[:stocks] != nil
      stock_symbols = Stock.parse_stocks(params[:stocks])
      stock_symbols.each do |symbol|
        stock = Stock.new(symbol, params[:scenarios])
        @stock_results << stock
      end

      #set normalized values
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
  def populate_watchlist
    @watchlists = WatchList.all
    wl = WatchList.find(params[:id])
    @stocks = wl.stocks 
    render  :rate
  end

  def populate_chartslist
    @watchlists = WatchList.all
    wl = WatchList.find(params[:id])
    @stocks = wl.stocks 
    @stock_symbols = []
    render  :charts
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
