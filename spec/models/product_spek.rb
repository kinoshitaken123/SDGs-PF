# frozen_string_literal: true

require 'rails_helper'

	RSpec.describe Product, "モデルに関するテスト", type: :model do
      describe '実際に保存してみる' do
      it "有効な投稿内容の場合は保存されるか" do
	      expect(FactoryBot.build(:product)).to be_valid
      end
	  end
	  context "空白のバリデーションチェック" do
	    it "titleが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
	      product = Product.new(title: '', body:'hoge')
      expect(book).to be_invalid
      expect(product.errors[:title]).to include("can't be blank")
    end
	    it "bodyが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
	      Product = Product.new(title: 'hoge', body:'')
        expect(book).to be_invalid
	      expect(book.errors[:body]).to include("can't be blank")
    end
  end
	end