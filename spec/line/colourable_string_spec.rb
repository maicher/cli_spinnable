require 'spec_helper'

describe CliSpinnable::Line::ColourableString do
  using CliSpinnable::Line::ColourableString
  subject { 'A string' }

  it { expect { subject.red }.not_to raise_error }
  it { expect { subject.green }.not_to raise_error }
end
