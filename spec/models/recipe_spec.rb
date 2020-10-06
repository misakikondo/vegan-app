require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe 'レシピ投稿の保存' do
    before do
      @recipe = FactoryBot.build(:recipe)
    end

    context 'レシピ投稿できる場合' do
      it '画像１枚と全てのフォームに値が存在すれば登録できること' do
        expect(@recipe).to be_valid
      end

    context 'レシピ投稿できない場合' do
      it 'imageがないと投稿できないこと' do
        @recipe.image = nil
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include("Image can't be blank")
      end

      it 'recipes_nameが空だと登録できないこと' do
        @recipe.recipes_name = nil
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include("Recipes name can't be blank")
      end

      it 'explainsが空だと登録できないこと' do
        @recipe.explains = nil
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include("Explains can't be blank")
      end

      it 'levelが未選択だと登録できないこと' do
        @recipe.level = nil
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include("Level can't be blank")
      end

      it 'Cookingtimeが未選択だと登録できないこと' do
        @recipe.cookingtime = nil
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include("Cookingtime can't be blank")
      end
   
      end
  
    end   

end
end
