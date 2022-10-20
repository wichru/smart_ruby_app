# frozen_string_literal: true

RSpec.describe Printer::Base do
  subject { described_class.new(visits_array).call }

  let(:visits_array) do
    [
      ['/home', 21],
      ['/help_page/1', 4],
      ['/contact', 2]
    ]
  end

  it 'raise an error' do
    expect { subject }.to raise_error NoMethodError, 'Printer failed'
  end
end
