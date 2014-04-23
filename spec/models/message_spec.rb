require 'spec_helper'

describe Message do

   let(:user) { FactoryGirl.create(:user) }
   before { @message = user.messages.build(content: "Hairy potato butts") }

   subject { @message }

   it { should respond_to(:content) }
   it { should respond_to(:sender_pein) }

   it { should be_valid }

   describe "when the user_id is missing" do
      before { @message.sender_pein = nil }
      it { should_not be_valid }
   end
end