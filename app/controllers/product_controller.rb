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

  def serview
    @series = Series.all.reorder('id ASC')
  end

  def addser
    @series = Series.new({ name: params[:message] })
    return unless @series.valid?
    @series.save
    redirect_to '/series'
  end

  def delser
    Series.find_by(id: params[:id]).destroy
    redirect_to '/series'
  end

  def edser
    @series = Series.find_by(id: params[:id])
  end

  def cancelser
    # @category = Category.find_by(id: params[:id])
    redirect_to '/series'

  end

  def confirmser
    @type = Series.find_by(id: params[:id])
    @type.update(name: params[:name])
    redirect_to '/series'
  end

  def prodcreate
    @category = Category.all.reorder('id ASC')
    @type = Type.all.reorder('id ASC')
    @series = Series.all.reorder('id ASC')
  end

  def addprod
    @prod = Product.new({ name: params[:name], price: params[:price], category_id: params[:category], type_id: params[:type], series_id: params[:series], discount_percent: params[:sale]})
    return unless @prod.valid?
    @prod.save
    redirect_to '/products'
  end

  def edprod
    @product = Product.find_by(id: params[:id])
    @category = Category.all.reorder('id ASC')
    @type = Type.all.reorder('id ASC')
    @series = Series.all.reorder('id ASC')
  end

  def confirmprod
    @product = Product.find_by(id: params[:id])
    @product.update({ name: params[:name], price: params[:price], category_id: params[:category], type_id: params[:type], series_id: params[:series], discount_percent: params[:sale]})
    redirect_to '/product'
  end

  def delprod
    Product.find_by(id: params[:id]).destroy
    redirect_to '/product'
  end
end
