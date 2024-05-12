class ListsController < ApplicationController
  def new
    @list = List.new
  end

#以下を追加
def create
  #1.&2. データを受けとり新規登録するためのインスタンス作成
  list = List.new(list_params)
  list.save
  # redirect_to '/top' を削除して、以下コードに変更
   # 詳細画面へリダイレクト
  redirect_to list_path(list.id)
end

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
  end
  
  def destroy
    list = List.find(params[:id])
    list.destroy
    redirect_to '/lists'
  end
  
  def update
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to list_path(list.id)
  end
  
  private
  # ストロングパラメータ
  def list_params
    params.require(:list).permit(:title, :body, :image)
  end
end
