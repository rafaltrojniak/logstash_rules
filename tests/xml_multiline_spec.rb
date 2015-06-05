require './tests/helper.rb'

example='xml_multiline'

results = grab_results(example)
source = grab_source(example)
logs = grab_logs(example)

RSpec.describe example do
  describe "Logs" do
		it "Single event for single line" do
			expect(results.count).to eq(2)
		end
		describe results[0] do
			it "Client ip resolved" do
				expect(results[0]["data"]['statusCode'][0]).to eq("200")
			end
		end
	end
  describe "Errors" do
		it "There are no errors in logs" do
			expect(logs.count).to eq(0)
		end
	end
end

