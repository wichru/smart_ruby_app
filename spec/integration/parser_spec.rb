# frozen_string_literal: true

RSpec.describe Parser do
  subject { described_class.new(path).call }

  let(:path) { 'spec/fixtures/sample.log' }

  describe '#call' do
    context 'when file is provided' do
      let(:expected_result) do
        {
          '/help_page/1' => ['126.318.035.038', '722.247.931.582', '646.865.545.408', '543.910.244.929'],
          '/contact' => ['184.123.665.067', '184.123.665.067'],
          '/home' => ['184.123.665.067', '235.313.352.950']
        }
      end

      it 'return data' do
        expect(subject).to eq expected_result
      end
    end

    context 'when file is not provided' do
      let(:path) { 'test' }

      it 'raises an error' do
        expect { subject }.to raise_error(Parser::MissingFileError)
      end
    end
  end
end
