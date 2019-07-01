class CustomersController < ApplicationController
  def index
  	@customers = Customer.all.order("updated_at desc").paginate(page: params[:page],per_page: 10)
  end

  def new
  	@customer = Customer.new
  end

  def create
   @customer = Customer.new(customer_params)
    respond_to do |format|
    if @customer.save
      format.html { redirect_to customers_path ,success: 'Department was successfully created.'}
   else
     format.html {render :new , notice: "Error in Creating department" }
   end
   end
  end

  def edit
  	@customer = Customer.find_by_id(params[:id])

  end

  def update
   @customer = Customer.find_by_id(params[:id])
   if @customer.update(customer_params)
      flash[:success] = "Customer updated successfully"
      redirect_to customers_path
    else
      render 'edit'
    end
  end

  def destroy
   @customer = Customer.find_by_id(params[:id])
   respond_to do |format|
    if @customer.destroy
      format.html { redirect_to customers_path ,notice: 'Customer Deleted successfully'}
    else 
      format.html { redirect_to customers_path ,notice: 'Customer cannot be deleted'}   
    end
   end
  end
   
 private

  def customer_params
   params.require(:customer).permit(:company_name,:contact_name,:contact_title,:address,:city,:region,:postal_code,:country,:phone,:fax)
  end
end
