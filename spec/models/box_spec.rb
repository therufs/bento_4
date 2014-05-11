require 'spec_helper'

describe Box do

	let(:user) { FactoryGirl.create(:user) }
	before { @box = user.boxes.build(content: "Chiriebi", date: Date.new(2014)) }

	subject { @box }

	it { should respond_to(:content) }
#	it { should respond_to(:date) }
	it { should respond_to(:user_id) }
	it { should respond_to(:user) }
	its(:user) { should eq user }

	it { should be_valid }

	describe "when user_id is not present" do
		before { @box.user_id = nil }
		it { should_not be_valid }
	end

	describe "with blank content" do # TODO replace this with a check for either content or date
		before { @box.content = " " }
		it { should_not be_valid }
	end 

#	describe "without a date" do
#		before { @box.date = nil } 
#		it { should_not be_valid } # TODO figure out a way to make boxes without dates/future boxes
#	end 

end
