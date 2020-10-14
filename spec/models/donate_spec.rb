require 'rails_helper'

RSpec.describe Donate, type: :model do
  describe 'ドネーションデータの保存' do
    before do
      @donate = FactoryBot.build(:donate)
    end

    context '募金ができる場合' do
      it '全てのカラムに値が入力されていること' do
        expect(@donate).to be_valid
      end

      context '募金ができない場合' do
        it 'tokenがないと投稿できないこと' do
          @donate.token = nil
          @donate.valid?
          expect(@donate.errors.full_messages).to include("Token can't be blank")
        end
      end

      it 'Priceが空だと出品できないこと' do
        @donate.price = nil
        @donate.valid?
        expect(@donate.errors.full_messages).to include("Price can't be blank", 'Price Half-width number')
      end

      it 'Priceが500未満だと出品できないこと' do
        @donate.price = 400
        @donate.valid?
        expect(@donate.errors.full_messages).to include('Price Out of setting range')
      end

      it 'Priceが9999999超過だと出品できないこと' do
        @donate.price = 10_000_000
        @donate.valid?
        expect(@donate.errors.full_messages).to include('Price Out of setting range')
      end

      it 'Priceが半角数字でないと出品できないこと' do
        @donate.price = '１０００'
        @donate.valid?
        expect(@donate.errors.full_messages).to include('Price Out of setting range')
      end
    end
  end
end
