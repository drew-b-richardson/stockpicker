class ScenariosController < ApplicationController
  # GET /scenarios
  # GET /scenarios.json
  def index
    @scenarios = Scenario.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @scenarios }
    end
  end

  # GET /scenarios/1
  # GET /scenarios/1.json
  def show
    @scenario = Scenario.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @scenario }
    end
  end

  # GET /scenarios/new
  # GET /scenarios/new.json
  def new
    @scenario = Scenario.new
    
    #add a single default criterion for display
    5.times {@scenario.scenarioCriterions.build}
  end

  # GET /scenarios/1/edit
  def edit
    @scenario = Scenario.find(params[:id])
  end

  # POST /scenarios
  # POST /scenarios.json
  def create
    @scenario = Scenario.new(params[:scenario])

    if @scenario.save
      flash[:notice] = 'Scenario was successfully created.'
      redirect_to scenarios_path
    else
      flash[:warning] = 'There was a problem.'
      render "new"
    end
  end

  # PUT /scenarios/1
  # PUT /scenarios/1.json
  def update
    @scenario = Scenario.find(params[:id])

    respond_to do |format|
      if @scenario.update_attributes(params[:scenario])
        format.html { redirect_to @scenario, notice: 'Scenario was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @scenario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scenarios/1
  # DELETE /scenarios/1.json
  def destroy
    @scenario = Scenario.find(params[:id])
    @scenario.destroy

    respond_to do |format|
      format.html { redirect_to scenarios_url }
      format.json { head :ok }
    end
  end
end
