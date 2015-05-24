require './tests/helper.rb'

results = grab_results('inputs/CLF.json')
source = grab_source('inputs/CLF.json')
logs = grab_logs('inputs/CLF.json')

RSpec.describe "CLF" do
  describe "Logs" do
		it "Single event for single line" do
			expect(results.count).to eq(1)
		end
		describe results[0] do
			it "Client ip resolved" do
				expect(results[0]["client_ip"]).to eq("127.0.0.1")
			end
		end
	end
  describe "Errors" do
		it "There are no errors in logs" do
			expect(logs.count).to eq(0)
		end
	end
end
