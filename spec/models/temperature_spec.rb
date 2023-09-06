require 'rails_helper'

RSpec.describe Temperature, type: :model do
  
  it '正しい情報を送信する時、有効になる' do
    temperature = FactoryBot.build(:temperature)
    temperature.valid?

    expect(temperature).to be_valid
  end

  it '体温未記入の時、無効になる' do
    temperature = FactoryBot.build(:temperature, temperature: nil)
    temperature.valid?

    expect(temperature.errors[:temperature]).to include('を入力してください')
  end

  it '時間未記入の時、無効になる' do
    temperature = FactoryBot.build(:temperature, time: nil)
    temperature.valid?

    expect(temperature.errors[:time]).to include('を入力してください')
  end

end
