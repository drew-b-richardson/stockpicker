class WatchListsController < ApplicationController
  respond_to :html, :js

  def add_to_favorites
    wl = WatchList.find_by_name("favorites")
    wl.stocks = wl.stocks + " #{params[:stock]}"
    wl.save
  end


  # GET /watch_lists
  # GET /watch_lists.json
  def index
    @watch_lists = WatchList.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @watch_lists }
    end
  end

  # GET /watch_lists/1
  # GET /watch_lists/1.json
  def show
    @watch_list = WatchList.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @watch_list }
    end
  end

  # GET /watch_lists/new
  # GET /watch_lists/new.json
  def new
    @watch_list = WatchList.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @watch_list }
    end
  end

  # GET /watch_lists/1/edit
  def edit
    @watch_list = WatchList.find(params[:id])
  end

  # POST /watch_lists
  # POST /watch_lists.json
  def create
    @watch_list = WatchList.new(params[:watch_list])

    respond_to do |format|
      if @watch_list.save
        format.html { redirect_to @watch_list, notice: 'Watch list was successfully created.' }
        format.json { render json: @watch_list, status: :created, location: @watch_list }
      else
        format.html { render action: "new" }
        format.json { render json: @watch_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /watch_lists/1
  # PUT /watch_lists/1.json
  def update
    @watch_list = WatchList.find(params[:id])

    respond_to do |format|
      if @watch_list.update_attributes(params[:watch_list])
        format.html { redirect_to @watch_list, notice: 'Watch list was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @watch_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /watch_lists/1
  # DELETE /watch_lists/1.json
  def destroy
    @watch_list = WatchList.find(params[:id])
    @watch_list.destroy

    respond_to do |format|
      format.html { redirect_to watch_lists_url }
      format.json { head :ok }
    end
  end
end
