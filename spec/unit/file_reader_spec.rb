RSpec.describe FileReader do
  subject { described_class.new(file_path).call }

  let(:file_path) { 'spec/fixtures/sample.log' }
  let(:lines_array) do
    [
      '/help_page/1 126.318.035.038',
      '/contact 184.123.665.067',
      '/home 184.123.665.067',
      '/help_page/1 722.247.931.582',
      '/help_page/1 646.865.545.408',
      '/home 235.313.352.950',
      '/contact 184.123.665.067',
      '/help_page/1 543.910.244.929'
    ]
  end
  describe '#call' do
    context 'when file exists' do
      it 'return an array' do
        expect(subject).to eq lines_array
      end
    end

    context 'when file does not exist' do
      let(:file_path) { 'spec/fixtures/fake.log' }

      it 'raise an error' do
        expect { subject }.to raise_error Errors::MissingFileError, 'No such file or directory'
      end
    end
  end
end
