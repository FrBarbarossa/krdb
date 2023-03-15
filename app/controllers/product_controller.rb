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
    redirect_to '/category'
  end

  def delcat
    Category.find_by(id: params[:id]).destroy
    redirect_to '/category'
  end

  def edcat
    @category = Category.find_by(id: params[:id])
  end

  def cancelcat
    # @category = Category.find_by(id: params[:id])
    redirect_to '/category'

  end

  def confirmcat
    @category = Category.find_by(id: params[:id])
    @category.update(name: params[:name])
    redirect_to '/category'
  end

  def typeview
    @type = Type.all.reorder('id ASC')
  end

  def addtype
    @type = Type.new({ name: params[:message] })
    return unless @type.valid?
    @type.save
    redirect_to '/type'
  end

  def deltype
    Type.find_by(id: params[:id]).destroy
    redirect_to '/type'
  end

  def edtype
    @type = Type.find_by(id: params[:id])
  end

  def canceltype
    # @category = Category.find_by(id: params[:id])
    redirect_to '/type'

  end

  def confirmtype
    @type = Type.find_by(id: params[:id])
    @type.update(name: params[:name])
    redirect_to '/type'
  end
end
