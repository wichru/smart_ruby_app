# frozen_string_literal: true

RSpec.describe Counter::Total do
  subject { described_class.new(visits_hash).call }

  let(:visits_hash) do
    {
      '/help_page/1' => ['126.318.035.038', '722.247.931.582', '646.865.545.408', '543.910.244.929'],
      '/contact' => ['184.123.665.067', '184.123.665.067'],
      '/home' => ['184.123.665.067', '235.313.352.950']
    }
  end
  let(:help_page_visits) { { '/help_page/1' => 4 } }
  let(:home_page_visits) { { '/home' => 2 } }
  let(:contact_page_visits) { { '/contact' => 2 } }

  it 'return total visits count' do
    expect(subject).to include help_page_visits
    expect(subject).to include home_page_visits
    expect(subject).to include contact_page_visits
  end
end
