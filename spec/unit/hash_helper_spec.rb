# frozen_string_literal: true

RSpec.describe HashHelper do
  subject { described_class }

  describe '.sort' do
    let(:visits_hash) do
      {
        '/help_page/1' => 4,
        '/contact' => 2,
        '/home' => 21
      }
    end
    let(:sorted_hash) do
      {
        '/home' => 21,
        '/help_page/1' => 4,
        '/contact' => 2
      }
    end

    it 'return total visits count' do
      expect(subject.sort(visits_hash)).to eq sorted_hash
    end
  end
end
