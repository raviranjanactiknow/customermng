class CategoriesController < ApplicationController
  def index
  	@categories = Category.all.paginate(page: params[:page],per_page: 10)
  end

  def new
  	@category = Category.new
  end

  def create
   @category = Category.new(category_params)
   @category.save
   redirect_to categories_path
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    @category.update(category_params)
    flash[:success] = "Category updated sucessfully"
    redirect_to categories_path
  end

  def destroy
   @category = Category.find(params[:id])
   @category.destroy
   redirect_to categories_path
  end

  private

  def category_params
   params.require(:category).permit(:category_name,:description)
  end
end
