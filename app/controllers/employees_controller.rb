class EmployeesController < ApplicationController
  helper_method :total_salary
  def index
    @employees = Employee.order("updated_at desc").paginate(page: params[:page],per_page: 10)
    respond_to do |format|
      format.html
      format.pdf do
        pdf = EmployeePdf.new( @employees )
        send_data pdf.render, filename: "employees.pdf",type: "application/pdf", disposition: "attachment"
      end
    end
  end

  def new
    @dep_options = Department.all.map { |d| [ d.name,d.id ] } 
    @employee = Employee.new
  end

  def create
     # debugger
     @dep_options = Department.all.map { |d| [ d.name,d.id ] } 
     @employee = Employee.new(employee_params)
     if @employee.save
      p_num = params[:employee][:phone_number]
      if p_num.present?
        p_num.each do|p_no| 
          @employee.phone_numbers.create!(phone_num: p_no)
        end
      end
      flash[:success] = "Employee created successfully"
      redirect_to root_path
    else
      flash.now[:alert] = "Error occure"
      render 'new'
    end
  end

  def edit
    # debugger
    @dep_options = Department.all.map { |d| [ d.name,d.id ] }
    @employee = Employee.find_by_id(params[:id])
  end

  def update
    #debugger
    @dep_options = Department.all.map { |d| [ d.name,d.id ] }
    @employee = Employee.find_by_id(params[:id])
    if @employee.update(employee_params)
      p_num = params[:employee][:phone_number]
      if p_num.present?
        p_num.each do|p_no| 
          @employee.phone_numbers.create!(phone_num: p_no)
        end
      end
      flash[:success] = "You have updated employee successfully"
      redirect_to root_path
    else
      flash.now[:error] = "Error In Updating"
      render 'edit'
    end
  end

  def show 
  end

  def destroy
    emp = Employee.find_by_id(params[:id])
    emp.destroy
    redirect_to employees_path
  end

  def export_data
    headers['Content-Type'] = "application/vnd.ms-excel"
    headers['Content-Disposition']  = 'attachment; filename="record.xls"'
    headers['Cache-Control'] = ''
    @employees  = Employee.all
  end

  def data_check 
    #debugger 
    if(params[:Exprt].present?)
      data_value = params[:Exprt]
      if(data_value == 'Excel')
        redirect_to export_data_employees_path(format: "xls")
      else
        redirect_to employees_path(format: 'pdf')
      end
    end
  end

  def delete_number
    #debugger
    p_num = params[:deletedPhones] 
    e1 = Employee.find(params[:id])
    if p_num.present? && e1.present?
      p_num.each do|p_number|
        e1.phone_numbers.find_by_phone_num(p_number).destroy  
      end
    end
    render json: {status: 'ok', message: "proceed" }
  end

  private

  def total_salary(sal,da,ta)
    if sal.present? && da.present? && ta.present?
      d_allowance = (sal*da)/100
      t_allowance = (sal*ta)/100
      return sal+d_allowance+t_allowance
    end
  end


  def employee_params
    params.require(:employee).permit(:name,:base_salary,:address,:department_id,:dob,:da,:ta,:salute,:sex,phone_numbers_attributes: [:id,:phone_num])
  end
end
