# frozen_string_literal: true

RSpec.describe Printer::Total do
  subject { described_class.new(sorted_array).call }

  describe '#call' do
    let(:sorted_array) do
      [
        ['/home', 21],
        ['/help_page/1', 4],
        ['/contact', 2]
      ]
    end
    let(:result) do
      <<~TEXT
        > list of webpages with most page views ordered from most pages views to less page views
        ------------------------
        /home 21 visits
        /help_page/1 4 visits
        /contact 2 visits
        ------------------------
      TEXT
    end

    it 'return total visits count' do
      expect { subject }.to output(result).to_stdout
    end
  end
end
