class ProductsController < ApplicationController

  def index
    @products = Product.order("updated_at desc").paginate(page: params[:page],per_page: 10)
  end

  def new
   @supply_options = Supplier.all.map { |d| [ d.company_name,d.id ] }
   @category_options = Category.all.map { |d| [ d.category_name,d.id ] }
   @product = Product.new
 end

 def create
      #debugger
      @product = Product.new(product_params)
      @product.save
      redirect_to products_path
    end

    def edit
      @supply_options = Supplier.all.map { |d| [ d.company_name,d.id ] }
      @category_options = Category.all.map { |d| [ d.category_name,d.id ] }
      @product = Product.find_by_id(params[:id])
    end

    def update
     @supply_options = Supplier.all.map { |d| [ d.company_name,d.id ] }
     @category_options = Category.all.map { |d| [ d.category_name,d.id ] }
     @product = Product.find_by_id(params[:id])
     @product.update(product_params)
     redirect_to products_path
   end

   def destroy
     @product = Product.find(params[:id])
     @product.destroy
     redirect_to products_path
   end

   private
   
   def product_params
    params.require(:product).permit(:product_name,:quantity_per_unit,:unit_price,:unit_in_stock,:recorder_level,:category_id,:supplier_id)
  end

end
