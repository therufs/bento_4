require 'spec_helper'

describe "BoxPages" do

	subject { page } 

	let(:user) { FactoryGirl.create(:user) }
	before { sign_in user }

	describe "box creation" do
		before { visit root_path }

		describe "with invalid information" do

			it "should not create a box" do
				expect { click_button "Log it!" }.not_to change(Box, :count)
			end

			describe "error messages" do
				before { click_button "Log it!" }
				it { should have_content('error') }
			end
		end

		describe "with valid information" do

			before { fill_in 'box_content', with: "Ebichiri" }
			it "should create a micropost" do
				expect { click_button "Log it!" }.to change(Box, :count).by(1)
			end
		end
	end
end
