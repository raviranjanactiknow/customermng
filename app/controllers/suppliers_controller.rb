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
      redirect_to suppliers_path
    else
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
      render 'edit'
    end
  end
 
  def destroy
    @supplier = Supplier.find(params[:id])
    @supplier.destroy
    redirect_to suppliers_path
  end

  private
    def supplier_params
      params.require(:supplier).permit(:company_name,:contact_name,:address,:city,:region,:postal_code,:country,:phone)
    end
end
