# frozen_string_literal: true

RSpec.describe PageVisitsBuilder do
  subject { described_class.new(file_lines).call }

  let(:file_lines) do
    [
      '/help_page/1 722.247.931.582',
      '/home 235.313.352.950',
      '/contact 184.123.665.067',
      '/help_page/1 646.865.545.408',
      '/home 184.123.665.067'
    ]
  end
  let(:expected_result) do
    {
      '/help_page/1' => ['722.247.931.582', '646.865.545.408'],
      '/home' => ['235.313.352.950', '184.123.665.067'],
      '/contact' => ['184.123.665.067']
    }
  end

  it 'return hash visits' do
    expect(subject).to eq expected_result
  end
end
