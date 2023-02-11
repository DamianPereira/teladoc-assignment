require "rails_helper"

describe Utils do
  let(:string_list) { %w[a b c yy abc abc abcdef ghjklw] }
  let(:integer) { 4 }
  subject { Utils.filter_and_group(string_list, integer) }

  context 'when the integer is 0' do
    let(:integer) { 0 }
    it "returns an empty Hash" do
      is_expected.to eq({})
    end
  end

  context 'when the integer is 1' do
    let(:integer) { 1 }
    it "returns an empty Hash" do
      is_expected.to eq({})
    end
  end

  context "when the string list has no elements" do
    let(:string_list) { [] }
    it "returns an Hash with each count set to 0 up to integer - 1" do
      is_expected.to eq({ 1 => 0, 2 => 0, 3 => 0 })
    end
  end

  context "when string list has values and integer is more than 2" do
    it "returns a count of each word that has less than integer length" do
      is_expected.to eq({ 1 => 3, 2 => 1, 3 => 2 })
    end
  end
end

