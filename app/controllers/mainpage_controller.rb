class MainpageController < ApplicationController
  def index
    @category = Category.new({ name: "TestCategory2" })
    return unless @category.valid?
    @category.save
  end
end
