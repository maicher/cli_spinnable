require 'spec_helper'

describe CliSpinnable::Line::Sign do
  describe '#initilaize' do
    subject { CliSpinnable::Line::Sign.new }

    it { expect(subject.to_s).to eq('') }
  end

  describe '#sign=' do
    CliSpinnable::Line::Sign::AVAILABLE_SIGNS.each do |sign|
      context "when writing #{sign}" do
        it { expect { subject.sign = sign }.not_to raise_error }
      end
    end

    context 'when writing unknown sign' do
      it { expect { subject.sign = :something }.to raise_error(CliSpinnable::Line::Sign::Error) }
    end
  end

  describe '#to_s' do
    {
      spin: CliSpinnable::Line::Sign::SPIN.first,
      tick: CliSpinnable::Line::Sign::TICK,
      fail: CliSpinnable::Line::Sign::FAIL,
      blank: CliSpinnable::Line::Sign::BLANK
    }.each_pair do |sign, value|
      context "when sign is #{sign}" do
        subject { CliSpinnable::Line::Sign.new(sign) }
        it { expect(subject.to_s).to start_with(value) }
      end
    end
  end
end
