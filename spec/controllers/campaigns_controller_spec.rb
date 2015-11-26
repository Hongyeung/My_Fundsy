require 'rails_helper'

RSpec.describe CampaignsController, type: :controller do
  describe "#new" do
    context "with user not signed in" do
        it "redirect to user sign up page" do
          get :new
          expect(response).to redirect_to(new_user_path)
        end
    end
    context "with user signed in" do
        it "renders the new template" do
          u = FactoryGirl.create(:user)
          request.session[:user_id] = u.id
          get :new
          expect(response).to render_template(:new)
        end
        it "it creates a new campaign object assigned to campaign instance variable"
    end


  end
end
