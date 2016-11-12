require 'spec_helper'

describe CliSpinnable do
  it 'has a version number' do
    expect(CliSpinnable::VERSION).not_to be nil
  end

  subject { Module.new { extend CliSpinnable } }

  it { expect(subject).to respond_to(:with_spinner) }

  describe '.with_spinner' do
    let(:writer) { Object.new }
    before(:each) do
      allow(CliSpinnable::Writer).to receive(:new).and_return(writer)
      allow(writer).to receive(:finalize)
    end

    it 'calls #finalize on writer' do
      subject.with_spinner {}
    end

    it 'yields writer object' do
      expect { |b| subject.with_spinner(&b) }.to yield_with_args(writer)
    end

    context 'when no errors occurred within the block' do
      it { expect { subject.with_spinner {} }.not_to raise_error }
    end

    context 'when error is raised within the block' do
      it 'calls #failure and re-raises the error' do
        allow(writer).to receive(:failure)
        expect { subject.with_spinner { raise StandardError } }.to raise_error StandardError
      end
    end
  end
end
