require 'rails_helper'
describe Lesson do
  before do
    @lesson = FactoryBot.build(:lesson)
  end

  describe '商品出品機能' do
    context '新規登録がうまくいくとき' do
      it 'name,introduction,category_id,condition_id,delivery_fee_id,prefecture_id,ship_date_id,price,user_idが存在すれば登録できる' do
        expect(@lesson).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it '商品画像が空と登録できない' do
        @lesson.image = nil
        @lesson.valid?
        expect(@lesson.errors.full_messages).to include "Image can't be blank"
      end
      it '商品名が空と登録できない' do
        @lesson.name = ''
        @lesson.valid?
        expect(@lesson.errors.full_messages).to include "Name can't be blank"
      end
      it '商品の説明が空と登録できない' do
        @lesson.introduction = ''
        @lesson.valid?
        expect(@lesson.errors.full_messages).to include "Introduction can't be blank"
      end
      it 'カテゴリーの情報が---だと登録できない' do
        @lesson.category_id = 0
        @lesson.valid?
        expect(@lesson.errors.full_messages).to include 'Category must be other than 0'
      end
      it '商品の状態についての情報が---だと登録できない' do
        @lesson.condition_id = 0
        @lesson.valid?
        expect(@lesson.errors.full_messages).to include 'Condition must be other than 0'
      end
      it '配送料の負担についての情報が---だと登録できない' do
        @lesson.delivery_fee_id = 0
        @lesson.valid?
        expect(@lesson.errors.full_messages).to include 'Delivery fee must be other than 0'
      end
      it '発送元の地域についての情報が---だと登録できない' do
        @lesson.prefecture_id = 0
        @lesson.valid?
        expect(@lesson.errors.full_messages).to include 'Prefecture must be other than 0'
      end
      it '発送までの日数についての情報が---だと登録できない' do
        @lesson.ship_date_id = 0
        @lesson.valid?
        expect(@lesson.errors.full_messages).to include 'Ship date must be other than 0'
      end
      it '価格についての情報が空だと登録できない' do
        @lesson.price = ''
        @lesson.valid?
        expect(@lesson.errors.full_messages).to include "Price can't be blank"
      end
      it '価格が、¥300円未満だと登録できない' do
        @lesson.price = 299
        @lesson.valid?
        expect(@lesson.errors.full_messages).to include 'Price must be greater than or equal to 300'
      end
      it '価格の範囲が、¥9,999,999を越えると登録できない' do
        @lesson.price = 10_000_000
        @lesson.valid?
        expect(@lesson.errors.full_messages).to include 'Price must be less than or equal to 9999999'
      end
      it '販売価格は半角数字以外だと登録できない' do
        @lesson.price = '１１１１'
        @lesson.valid?
        expect(@lesson.errors.full_messages).to include 'Price is not a number'
      end
    end
  end # describe
end # Lesson do
