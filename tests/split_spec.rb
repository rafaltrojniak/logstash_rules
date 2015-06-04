require './tests/helper.rb'

%w( split ).each do |example|

  results = grab_results(example)
  source = grab_source(example)
  logs = grab_logs(example)

  RSpec.describe example do
    describe "Logs" do
      it "Single event for single line" do
        expect(results.count).to eq(2)
      end
      describe results[0] do
        it "First element has first ID" do
          expect(results[0]["result"]["id"]).to eq("a1")
        end
        it "Second element has second ID" do
          expect(results[1]["result"]["id"]).to eq("a2")
        end
      end
    end
    describe logs do
      it "There are no errors in logs" do
        expect(logs.count).to eq(0)
      end
    end
  end
end
