require 'rails_helper'

RSpec.describe Height, type: :model do
  
  it '正しい情報を入力した時、有効になる' do
    height = FactoryBot.build(:height)
    height.valid?

    expect(height).to be_valid
  end

  it '身長未記入の時、無効になる' do
    height = FactoryBot.build(:height, height: nil)
    height.valid?

    expect(height.errors[:height]).to include('を入力してください')
  end

  it '時間未記入の時、無効になる' do
    height = FactoryBot.build(:height, time: nil)
    height.valid?

    expect(height.errors[:time]).to include('を入力してください')
  end

end
