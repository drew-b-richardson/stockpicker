class CriterionsController < ApplicationController

  def check_criterions
    @criterions = Criterion.all
    if params[:stock] == nil
      params[:stock] = 'csco'
    end
    @criterions.each do |crit| 
      crit.stock = params[:stock]
      crit.get_value 
    end  
  end

  # GET /criterions
  # GET /criterions.json
  def index
    @criterions = Criterion.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @criterions }
    end
  end

  # GET /criterions/1
  # GET /criterions/1.json
  def show
    @criterion = Criterion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @criterion }
    end
  end

  # GET /criterions/new
  # GET /criterions/new.json
  def new
    @criterion = Criterion.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @criterion }
    end
  end

  # GET /criterions/1/edit
  def edit
    @criterion = Criterion.find(params[:id])
  end

  # POST /criterions
  # POST /criterions.json
  def create
    @criterion = Criterion.new(params[:criterion])

    if @criterion.save
      flash[:notice] = 'Criterion was successfully created.'
      redirect_to criterions_path
    else
      flash[:warning] = 'There was a problem.'
      render "new"
    end
  end

  # PUT /criterions/1
  # PUT /criterions/1.json
  def update
    @criterion = Criterion.find(params[:id])

    respond_to do |format|
      if @criterion.update_attributes(params[:criterion])
        format.html { redirect_to @criterion, notice: 'Criterion was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @criterion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /criterions/1
  # DELETE /criterions/1.json
  def destroy
    @criterion = Criterion.find(params[:id])
    @criterion.destroy

    respond_to do |format|
      format.html { redirect_to criterions_url }
      format.json { head :ok }
    end
  end
end
