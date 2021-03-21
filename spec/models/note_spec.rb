require 'rails_helper'

RSpec.describe Note, type: :model do
  before do
    @note = FactoryBot.build(:note)
  end

  describe '新規投稿' do
    context '新規投稿ができる場合' do
      it '全ての情報が正しく入力されていれば登録できる' do
        expect(@note).to be_valid
      end
    end

    context '投稿ができない場合' do
      it 'imageが空だと投稿不可' do
        @note.image = nil
        @note.valid?
        expect(@note.errors.full_messages).to include("Image can't be blank")
      end

      it 'cafe_nameが空だと投稿不可' do
        @note.cafe_name = ''
        @note.valid?
        expect(@note.errors.full_messages).to include("Cafe name can't be blank")
      end

      it 'appearanceが空だと投稿不可' do
        @note.appearance = ''
        @note.valid?
        expect(@note.errors.full_messages).to include("Appearance can't be blank")
      end

      it 'aromaが空だと投稿不可' do
        @note.aroma = ''
        @note.valid?
        expect(@note.errors.full_messages).to include("Aroma can't be blank")
      end

      it 'tasteが空だと投稿不可' do
        @note.taste = ''
        @note.valid?
        expect(@note.errors.full_messages).to include("Taste can't be blank")
      end

      it 'richが空だと投稿不可' do
        @note.rich = ''
        @note.valid?
        expect(@note.errors.full_messages).to include("Rich can't be blank")
      end

      it 'geography_idが0だと投稿不可' do
        @note.geography_id = 0
        @note.valid?
        expect(@note.errors.full_messages).to include('Geography must be other than 0')
      end

      it 'processing_idが0だと投稿不可' do
        @note.processing_id = 0
        @note.valid?
        expect(@note.errors.full_messages).to include('Processing must be other than 0')
      end

      it 'tasting_noteが空だと投稿不可' do
        @note.tasting_note = ''
        @note.valid?
        expect(@note.errors.full_messages).to include("Tasting note can't be blank")
      end

      it 'userが空では投稿不可' do
        @note.user = nil
        @note.valid?
        expect(@note.errors.full_messages).to include('User must exist')
      end
    end
  end
end
