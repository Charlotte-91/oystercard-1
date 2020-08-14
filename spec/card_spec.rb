require 'card'

describe Card do

  let(:entry_station) {double :entry_station}
  let(:exit_station) {double :exit_station}

  it 'expects a card to have an initial balance of zero' do
    expect(subject.balance).to eq(0)
  end

  

  describe '#top_up' do
    it  'is expected to respond to top_up with 1 argument' do
      expect(subject).to respond_to(:top_up).with(1).argument
    end

    it 'tops up the balance' do
      expect {subject.top_up(1)}.to change {subject.balance}.by (1)
    end

    it 'raises an error if the maxiumum balance is exceeded' do
      max_balance = Card::MAXIMUM_BALANCE
      subject.top_up(max_balance)
      expect {subject.top_up(1)}.to raise_error "Cannot top up: Maximum balance of £#{max_balance} exceeded"
    end
end
  
  describe '#touch_in' do
  
  let(:entry_station) {double :entry_station}

  before do
    subject.balance = Card::MINIMUM_FARE
  end
   
    it 'responds to touch in' do
      expect(subject).to respond_to :touch_in
    end

    it 'raises an error if insufficient funds on card for a single journey' do
      subject.balance = 0
      expect {subject.touch_in('station')}.to raise_error "insufficient funds on card"
    end

  end

  describe '#touch_out' do
    before do
      subject.balance = Card::MINIMUM_FARE
    end

    it 'responds to touch_out' do
      expect(subject).to respond_to :touch_out
    end
 
    it 'deducts from the balance when touch out' do
      subject.top_up(10)
      subject.touch_in('station')
      expect {subject.touch_out('station')}.to change {subject.balance}.by -(Card::MINIMUM_FARE)
    end

    
  end

  context 'when journey complete' do
    before do
      subject.balance = Card::MINIMUM_FARE
    end

    
  end
 

end