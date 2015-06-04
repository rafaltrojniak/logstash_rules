require './tests/helper.rb'

%w(xml xml_xmlns).each do |example|

  results = grab_results(example)
  source = grab_source(example)
  logs = grab_logs(example)

  RSpec.describe example do
    describe "Logs" do
      it "Single event for single line" do
        expect(results.count).to eq(1)
      end
      describe results[0] do
        it "failed_logsins should be set" do
          expect(results[0]['x_failed_logins']).not_to eq(nil)
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
