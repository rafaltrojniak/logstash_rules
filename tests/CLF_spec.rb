require './tests/helper.rb'

%w( CLF CLF_empty).each do |example|

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

        it "timestamp is parsed" do
          expect(results[0]["@timestamp"]).to eq("2001-10-12T20:55:36.000Z")
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
