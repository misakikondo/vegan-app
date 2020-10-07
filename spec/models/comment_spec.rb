require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'コメント投稿' do
    before do
      @comment = FactoryBot.build(:comment)
    end

    context 'コメントが投稿できる場合' do
      it 'recipeとuserが存在し、入力フォームに文字が入っていること' do
        expect(@comment).to be_valid
      end
    end

    context 'コメントが投稿できない場合' do
      it '入力フォームが空だと投稿できないこと' do
        @comment.contents = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Contents can't be blank")
      end

      it '入力フォームの文字が100文字以上だと投稿できないこと' do
        @comment.contents = "12345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901"
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Contents is too long (maximum is 100 characters)")
      end

      it 'userが紐付いていないと保存できないこと' do
        @comment.user = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("User must exist")
      end
  
      it 'Recipeが紐付いていないと保存できないこと' do
        @comment.recipe = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Recipe must exist")
      end

    end
  end
end
