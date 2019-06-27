class SuppliersController < ApplicationController
  def index
    @suppliers = Supplier.all.paginate(page: params[:page],per_page: 10)
  end

  def new
    @supplier = Supplier.new
  end

  def create
    @supplier = Supplier.new(supplier_params)
    if @supplier.save
      flash[:success] = "Supplier created sucessfully."
      redirect_to suppliers_path
    else
      flash[:error] = "Sorry, something went wrong"
      render 'new'
    end
  end

  def edit
    @supplier = Supplier.find(params[:id])
  end

  def update
    @supplier = Supplier.find(params[:id])
    if @supplier.update(supplier_params)
      flash[:success] = "Supplier updated sucessfully."
      redirect_to suppliers_path
    else
      flash[:error] = "Sorry, something went wrong"
      render 'edit'
    end
  end
 
  def destroy
    #debugger
    @supplier = Supplier.find(params[:id])
    if @supplier.products.present?
      flash[:notice] = "Supplier have product so can't be deleted."
    else    
      @supplier.destroy
    end
     redirect_to suppliers_path
  end

  private
    def supplier_params
      params.require(:supplier).permit(:company_name,:contact_name,:address,:city,:region,:postal_code,:country,:phone)
    end
end
