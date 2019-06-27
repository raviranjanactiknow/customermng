class CategoriesController < ApplicationController
  def index
  	@categories = Category.all.paginate(page: params[:page],per_page: 10)
  end

  def new
  	@category = Category.new
  end

  def create
   @category = Category.new(category_params)
   if @category.save
   redirect_to categories_path
  else
  render 'new'
 end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
   if @category.update(category_params)
    flash[:success] = "Category updated sucessfully"
    redirect_to categories_path
  else
    render 'edit'
  end
  end

  def destroy
   @category = Category.find_by_id(params[:id])
   if @category.products.present?
      flash[:notice] = "Category have products so can't be deleted."
    else    
      @category.destroy
    end
   redirect_to categories_path
  end

  private

  def category_params
   params.require(:category).permit(:category_name,:description)
  end
end
