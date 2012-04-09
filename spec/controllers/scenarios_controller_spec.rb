require 'spec_helper'

describe ScenariosController do

  # This should return the minimal set of attributes required to create a valid
  # Scenario. As you add validations to Scenario, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ScenariosController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  #describe "add new criterion" do
    #it "should add a new criterion when user requests to add a new one" do
      #post :add_criterion, {:num_crits => 2}
      #response.should render_template('new')
      
    #end
  #end

  #describe "remove criterion" do
    #post :remove_criterion, {:id => 1, :criterion_id => 1}
    #response.should render_template('edit')
  #end

  describe "GET index" do
    it "assigns all scenarios as @scenarios" do
      scenario = Scenario.create! valid_attributes
      get :index, {}, valid_session
      assigns(:scenarios).should eq([scenario])
    end
  end

  describe "GET show" do
    it "assigns the requested scenario as @scenario" do
      scenario = Scenario.create! valid_attributes
      get :show, {:id => scenario.to_param}, valid_session
      assigns(:scenario).should eq(scenario)
    end
  end

  describe "GET new" do
    it "assigns a new scenario as @scenario" do
      get :new, {}, valid_session
      assigns(:scenario).should be_a_new(Scenario)
    end
  end

  describe "GET edit" do
    it "assigns the requested scenario as @scenario" do
      scenario = Scenario.create! valid_attributes
      get :edit, {:id => scenario.to_param}, valid_session
      assigns(:scenario).should eq(scenario)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Scenario" do
        expect {
          post :create, {:scenario => valid_attributes}, valid_session
        }.to change(Scenario, :count).by(1)
      end

      it "assigns a newly created scenario as @scenario" do
        post :create, {:scenario => valid_attributes}, valid_session
        assigns(:scenario).should be_a(Scenario)
        assigns(:scenario).should be_persisted
      end

      it "redirects to the created scenario" do
        post :create, {:scenario => valid_attributes}, valid_session
        response.should redirect_to(scenarios_path)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved scenario as @scenario" do
        # Trigger the behavior that occurs when invalid params are submitted
        Scenario.any_instance.stub(:save).and_return(false)
        post :create, {:scenario => {}}, valid_session
        assigns(:scenario).should be_a_new(Scenario)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Scenario.any_instance.stub(:save).and_return(false)
        post :create, {:scenario => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested scenario" do
        scenario = Scenario.create! valid_attributes
        # Assuming there are no other scenarios in the database, this
        # specifies that the Scenario created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Scenario.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => scenario.to_param, :scenario => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested scenario as @scenario" do
        scenario = Scenario.create! valid_attributes
        put :update, {:id => scenario.to_param, :scenario => valid_attributes}, valid_session
        assigns(:scenario).should eq(scenario)
      end

      it "redirects to the scenario" do
        scenario = Scenario.create! valid_attributes
        put :update, {:id => scenario.to_param, :scenario => valid_attributes}, valid_session
        response.should redirect_to(scenario)
      end
    end

    describe "with invalid params" do
      it "assigns the scenario as @scenario" do
        scenario = Scenario.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Scenario.any_instance.stub(:save).and_return(false)
        put :update, {:id => scenario.to_param, :scenario => {}}, valid_session
        assigns(:scenario).should eq(scenario)
      end

      it "re-renders the 'edit' template" do
        scenario = Scenario.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Scenario.any_instance.stub(:save).and_return(false)
        put :update, {:id => scenario.to_param, :scenario => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested scenario" do
      scenario = Scenario.create! valid_attributes
      expect {
        delete :destroy, {:id => scenario.to_param}, valid_session
      }.to change(Scenario, :count).by(-1)
    end

    it "redirects to the scenarios list" do
      scenario = Scenario.create! valid_attributes
      delete :destroy, {:id => scenario.to_param}, valid_session
      response.should redirect_to(scenarios_url)
    end
  end

end
