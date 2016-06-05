class SearchController < ApplicationController

  def search

    # 全検索
    if params[:search].blank?
      @category = 'すべて'
      @search_words = '検索キーワード　すべて'
      @relation_tags = Tag.where(id: 1)
      @tags = Tag.all.page
    else
      @category = category_params[:name]
      @search_words = search_params[:tag_name]
      @words = search_params[:tag_name]
      param = {tag_name: @words.split(/[[:space:]]+/)}
      # タグ完全一致
      @tags = Tag.where(param)
      @relation_tags = Tag.where(id: 2)
    end
  end

  # 検索ワードのストロングパラメータ
  def search_params
    params.require(:search).permit(:tag_name)
  end
  
  # 検索カテゴリのストロングパラメータ
  def category_params
    params.require(:category).permit(:name)
  end
end
