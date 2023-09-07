require 'rails_helper'

RSpec.describe HeadCircumference, type: :model do
  
  it '正しい情報を送信する時、有効になる' do
    cir = FactoryBot.build(:head_circumference)
    cir.valid? 

    expect(cir).to be_valid
  end

  it '頭囲未記入のとき、無効になる' do
    cir = FactoryBot.build(:head_circumference, circumference: nil)
    cir.valid?

    expect(cir.errors[:circumference]).to include('を入力してください')
  end

  it '時間未記入の時、無効になる' do
    cir = FactoryBot.build(:head_circumference, time: nil)
    cir.valid?

    expect(cir.errors[:time]).to include('を入力してください')
  end

end
