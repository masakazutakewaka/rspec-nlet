describe 'RSpec::Core::MemoizedHelpers::ClassMethods' do

  let(:one, :two, :three) { [1,2,3] }
  it 'should create multiple helpers' do
    expect(one).to eq 1
    expect(two).to eq 2
    expect(three).to eq 3
  end

  let(:single) { 'single' }
  it 'should create a helper' do
    expect(single).to eq 'single'
  end

  let(:nil) { nil }
  it 'should accept nil' do
    expect(nil).to be nil
  end

  let(:over, :ride) { ['over', 'ride'] }
  let(:over, :ride) { [:over, 'riden'] }
  it 'should be able to be overriden' do
    expect(over).to eq :over
    expect(ride).to eq 'riden'
  end

  describe 'Errors' do
    context 'when names are too few' do
      let(:too, :few) { [1,2,3] }
      it 'should raise an error' do
        expect{ few }.to raise_error(StandardError, 'Too few names')
      end
    end

    context 'when names are too many' do
      let(:too, :many) { [1] }
      it 'should raise an error' do
        expect{ too }.to raise_error(StandardError, 'Too many names')
      end
    end

    context 'when names are duplicated' do
      let(:dup, :dup) { [1,2] }
      it 'should raise an error' do
        expect{ dup }.to raise_error(StandardError, 'Names are duplicated')
      end
    end

    context 'when a block returns an object other than Array' do
      let(:no, :array) { 1 }
      it 'should raise an error' do
        expect{ no }.to raise_error(StandardError, 'Block returns non Array object')
      end
    end
  end
end
