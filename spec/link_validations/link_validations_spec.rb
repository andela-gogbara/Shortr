# require "rails_helper"
#
# RSpec.describe LinkValidations do
#   let(:link) { create(:link)}
#
#   describe "#new" do
#     it "should create a new instance of LinkValidations" do
#       expect(LinkValidations.new(link)).to be_instance_of(LinkValidations)
#     end
#   end
#
#   describe "#check_active" do
#     it "should return flash message if the link is inactive" do
#       inactive_link = create(:link, active: false)
#       response = LinkValidations.new(inactive_link).invalid_link_action
#       expect(flash[:error]).to eq("test")
#     end
#   end
# end
