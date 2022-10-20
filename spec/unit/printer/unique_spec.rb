# frozen_string_literal: true

RSpec.describe Printer::Unique do
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
        /home 21 unique visits
        /help_page/1 4 unique visits
        /contact 2 unique visits
      TEXT
    end

    it 'return total visits count' do
      expect { subject }.to output(result).to_stdout
    end
  end
end
