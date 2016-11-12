require 'spec_helper'
require 'pry'

describe CliSpinnable::Line do
  subject { CliSpinnable::Line.new }

  %i(str str= sign sign= newline newline= <<).each do |method|
    it { expect(subject).to respond_to(method) }
  end

  describe '#str=' do
    context 'when writing single line string' do
      it { expect { subject.str = 'abcefg' }.not_to raise_error }
    end

    context 'when writing multiline string' do
      it { expect { subject.str = "abc\nefg" }.to raise_error(CliSpinnable::Line::Error) }
    end
  end

  describe '#<<' do
    context 'when appending single line string' do
      it { expect { subject << 'abcefg' }.not_to raise_error }
    end

    context 'when appending multiline string' do
      it { expect { subject << "abc\nefg" }.to raise_error(CliSpinnable::Line::Error) }
    end
  end

  describe 'to_s_resetting_newline' do
    before(:each) { subject.str = 'Text' }
    it { expect(subject.to_s_resetting_newline).to include('Text') }

    context 'when newline if true' do
      before(:each) { subject.newline = true }
      it { expect(subject.to_s_resetting_newline).to end_with(CliSpinnable::Line::NEWLINE) }
      it 'setts newline flag to false' do
        expect { subject.to_s_resetting_newline }.to change { subject.newline }.from(true).to(false)
      end
    end

    context 'when newline if false' do
      before(:each) { subject.newline = false }
      it 'does not change the newline flag' do
        expect { subject.to_s }.not_to change { subject.newline }
      end
    end

    {
      spin: CliSpinnable::Line::Sign::SPIN.first,
      tick: CliSpinnable::Line::Sign::TICK,
      fail: CliSpinnable::Line::Sign::FAIL,
      blank: CliSpinnable::Line::Sign::BLANK
    }.each_pair do |sign, value|
      context "when sign is #{sign}" do
        before(:each) { subject.sign = sign }
        it { expect(subject.to_s_resetting_newline).to start_with(CliSpinnable::Line::CARRIAGE_RETURN + value) }
      end
    end
  end
end
