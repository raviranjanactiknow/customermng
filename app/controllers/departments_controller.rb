class DepartmentsController < ApplicationController

  def index
   @departments = Department.all.order("updated_at desc")
 end

 def new
   @department = Department.new
 end

 def create
    #debugger
    @department = Department.new(department_params)
    respond_to do |format|
    if @department.save
      format.html { redirect_to departments_path ,notice: 'Department was successfully created.'}
   else
     format.html {render :new , notice: "Error in Creatin department" }
   end
 end
  end

  def edit
   @department = Department.find(params[:id])
  end

 def update
    #debugger
    @department = Department.find(params[:id])
    @department.update(department_params)
    redirect_to departments_path
  end

  def destroy
    #debugger
    @department = Department.find(params[:id])
     respond_to do |format|
    if @department.employees.present?
      format.html { redirect_to departments_path ,notice: 'Department have employees so cannot be deleted'}
    else
      @department.destroy
      format.html { redirect_to departments_path ,notice: 'Department Deleted successfully'}
    end
   end
  end

  private

  def department_params
   params.require(:department).permit(:name)
 end

end