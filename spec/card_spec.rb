require 'card'

describe Card do

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
  
  let(:station) {double :station}

  before do
    subject.balance = Card::MINIMUM_FARE
  end
   
    it 'responds to touch in' do
      expect(subject).to respond_to :touch_in
    end

    it 'reports that the card is in use' do
      expect {subject.touch_in(station)}.to change {subject.in_journey?}.to true
    end

    it 'can touch in' do
      subject.touch_in(station)
      expect(subject).to be_in_journey
    end

    it 'allows touch in if card balance is sufficient for a single journey' do
      subject.touch_in(station)
      expect(subject).to be_in_journey
     end

    it 'raises an error if insufficient funds on card for a single journey' do
      subject.balance = 0
      expect {subject.touch_in(station)}.to raise_error "insufficient funds on card"
    end

    it 'stores the entry station after touch in' do
      station = double(:station)
      subject.touch_in(station)
      expect(subject.entry_station).to eq station
    end

  end

  describe '#touch_out' do
    
    let(:station) {double :station}

    it 'responds to touch_out' do
      expect(subject).to respond_to :touch_out
    end
    it'reports that the card is no longer in use' do
      expect {subject.touch_out}.to change {subject.in_journey?}.to false
    end

    it 'can touch_out' do         
      subject.balance = Card::MINIMUM_FARE
      subject.touch_in(station)
      subject.touch_out
      expect(subject).not_to be_in_journey
    end

    it 'deducts from the balance when touch out' do
      subject.balance = Card::MINIMUM_FARE
      subject.touch_in(station)
      expect {subject.touch_out }.to change {subject.balance}.by -(Card::MINIMUM_FARE)
    end
  end

  describe '#in_journey?' do
    it 'responds to in_journey?' do
      expect(subject).to respond_to :in_journey?
    end
    
  end
 

end