require 'spec_helper'

describe CliSpinnable::Writer do
  SEPARATOR = "\n".freeze
  let(:out) { StringIO.new }
  let(:line_mock) do
    Class.new do
      attr_accessor :str, :sign, :newline
      def to_s_resetting_newline
        'Text' + SEPARATOR
      end
    end.new
  end

  subject { CliSpinnable::Writer.new(out, line_mock) }

  {
    print: 'Text',
    tick: nil,
    failure: nil,
    finalize: nil
  }.each_pair do |method, arg|
    describe "##{method}" do
      it { expect(subject).to respond_to(method) }

      context 'when session is running' do
        it { expect { subject.public_send(method, arg).not_to raise_error } }
      end

      context 'after session was finalized' do
        before(:each) { subject.finalize }
        it { expect { subject.public_send(method, arg).to raise_error(CliSpinnable::Writer::Error) } }
      end
    end
  end

  context 'session thread' do
    before(:each) do
      subject
      sleep CliSpinnable::Writer::REFRESH_DELAY_IN_SECONDS
    end

    it 'writes line to out' do
      expect(out.string).to include('Text')
    end
  end
end
