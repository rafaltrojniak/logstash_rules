require './tests/helper.rb'

example='CLF_empty'

results = grab_results(example)
source = grab_source(example)
logs = grab_logs(example)

RSpec.describe example do
  describe "Logs" do
		it "Single event for single line" do
			expect(results.count).to eq(1)
		end
		describe results[0] do
			it "Client ip resolved" do
				expect(results[0]["client_ip"]).to eq("127.0.0.1")
			end
			it "user should be empty" do
				expect(results[0]["user"]).to eq(nil)
			end
			it "user should be empty" do
				expect(results[0]["group"]).to eq(nil)
			end
		end
	end
  describe "Errors" do
		it "There are no errors in logs" do
			expect(logs.count).to eq(0)
		end
	end
end

