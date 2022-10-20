# frozen_string_literal: true

RSpec.describe LogParser do
  subject { described_class.new(path).call }

  let(:path) { 'spec/fixtures/sample.log' }

  describe '#call' do
    context 'when file is provided' do
      let(:expected_result) do
        <<~TEXT
          ------------------------
          > list of webpages with most page views ordered from most pages views to less page views
          ------------------------
          /help_page/1 4 visits
          /contact 2 visits
          /home 2 visits
          ------------------------
          > list of webpages with most unique page views also ordered
          ------------------------
          /help_page/1 4 unique visits
          /home 2 unique visits
          /contact 1 unique visits
          ------------------------
        TEXT
      end

      it 'print expected result' do
        expect { subject }.to output(expected_result).to_stdout
      end
    end

    context 'when file is not provided' do
      let(:path) { 'test' }

      it 'raises an error' do
        expect { subject }.to raise_error Errors::MissingFileError
      end
    end
  end
end
