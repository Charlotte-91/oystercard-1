require 'journey'

describe Journey do
  
  it 'creates an instance of Journey' do
    expect(subject).to be_an_instance_of Journey
  end

  it 'initializes with an empty list of journeys' do
    expect(subject.journey).to eq(nil)
  end

    it 'stores a journey' do
      expect(subject.store_journey).to eq subject.journey
    end

    it 'checks if journey is complete' do
      subject.start_station = 'station'
      expect(subject.complete?).to eq false
    end

    it 'charges the user a fare' do
      expect(subject.fare).to eq Journey::PENALTY_FARE
    end
end