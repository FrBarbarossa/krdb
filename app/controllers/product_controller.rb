class ProductController < ApplicationController
  def index
  end

  def prodview
    @products = Product.all.reorder('id ASC')
  end

  def catview
    @categories = Category.all.reorder('id ASC')
  end

  def addcat
    @category = Category.new({ name: params[:message] })
    return unless @category.valid?
    @category.save
    redirect_to '/catview'
  end

  def delcat
    Category.find_by(id: params[:id]).destroy
    redirect_to '/catview'
  end
end
