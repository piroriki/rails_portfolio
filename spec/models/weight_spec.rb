require 'rails_helper'

RSpec.describe Weight, type: :model do
  
  it '正しい情報を入力する時、有効になる' do
    weight = FactoryBot.build(:weight)
    weight.valid?

    expect(weight).to be_valid
  end

  it '体重未記入の時、無効になる' do
    weight = FactoryBot.build(:weight, weight: nil)
    weight.valid?

    expect(weight.errors[:weight]).to include('を入力してください')
  end

  it '時間未記入の時、無効になる' do
    weight = FactoryBot.build(:weight, time: nil)
    weight.valid?

    expect(weight.errors[:time]).to include('を入力してください')
  end

end
