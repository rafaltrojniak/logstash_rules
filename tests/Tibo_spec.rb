require './tests/helper.rb'

example='Tibo'

results = grab_results(example)
source = grab_source(example)
logs = grab_logs(example)

RSpec.describe example do
  describe "Logs" do
		it "Single event for single line" do
			expect(results.count).to eq(1)
		end
	end
  describe "Errors" do
		it "There are no errors in logs" do
			expect(logs.count).to eq(0)
		end
	end
end

