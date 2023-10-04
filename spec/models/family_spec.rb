require 'rails_helper'

RSpec.describe Family, type: :model do
  it '正しい情報を送信するとき、有効になる' do
    family = FactoryBot.build(:family)
    family.valid?

    expect(family).to be_valid
  end

  it '家族グループ名未記入の時、無効になる' do
    family = FactoryBot.build(:family, name: nil)
    family.valid?

    expect(family.errors[:name]).to include('を入力してください')
  end

end
