# frozen_string_literal: true

RSpec.describe LogParser do
  subject(:parser) { described_class.new(log_path) }

  let(:log_path) { 'spec/fixtures/sample.log' }

  describe '#call' do
    let(:reader_instance) { instance_double(FileReader) }
    let(:array_instance) { instance_double(Array) }
    let(:page_visits_instance) { instance_double(PageVisitsBuilder) }
    let(:hash_instance) { instance_double(Hash) }
    let(:total_counter_instance) { instance_double(Counter::Total) }
    let(:unique_counter_instance) { instance_double(Counter::Unique) }
    let(:hash_helper) { HashHelper }
    let(:total_printer_instance) { instance_double(Printer::Total) }
    let(:unique_printer_instance) { instance_double(Printer::Unique) }

    before do
      allow(FileReader).to receive(:new).with(log_path) { reader_instance }
      allow(reader_instance).to receive(:call) { array_instance }
      allow(PageVisitsBuilder).to receive(:new).with(array_instance) { page_visits_instance }
      allow(page_visits_instance).to receive(:call) { hash_instance }
      allow(Counter::Total).to receive(:new).with(hash_instance) { total_counter_instance }
      allow(total_counter_instance).to receive(:call) { hash_instance }
      allow(Counter::Unique).to receive(:new).with(hash_instance) { unique_counter_instance }
      allow(unique_counter_instance).to receive(:call) { hash_instance }
      allow(hash_helper).to receive(:sort).with(hash_instance) { hash_instance }
      allow(Printer::Total).to receive(:new).with(hash_instance) { total_printer_instance }
      allow(total_printer_instance).to receive(:call) { array_instance }
      allow(Printer::Unique).to receive(:new).with(hash_instance) { unique_printer_instance }
      allow(unique_printer_instance).to receive(:call) { array_instance }
    end

    it 'calls all services' do
      parser.call
      expect(reader_instance).to have_received(:call).once
      expect(page_visits_instance).to have_received(:call).once
      expect(total_counter_instance).to have_received(:call).once
      expect(unique_counter_instance).to have_received(:call).once
      expect(hash_helper).to have_received(:sort).twice
      # expect(total_printer_instance).to receive(:call)
      # expect(unique_printer_instance).to receive(:call)
    end
  end
end
