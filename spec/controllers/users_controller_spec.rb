require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  # status codes & responses under various conditions

  # valid and invalid params

  describe "GET #new" do
    it "renders the new user page" do
      get :new, user: {}
      expect(response).to render_template("new")
      expect(response).to have_http_status(200)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      # it "creates a new user" do
      #   post :create, user: { username:"whatever", password:"whatever"}
      #   expect(response) ?????
      # end
      it "redirects us to our goals page" do
        post :create, user: { username: "whatever", password: "whatever" }
        expect(response).to redirect_to(goals_url)
      end
    end

    context "with invalid params" do
      it "reload the new page with errors" do
        post :create, user: { username: "whatever", password: "short" }
        expect(response).to render_template("new")
        expect(flash[:errors]).to be_present
      end
    end
  end


end
