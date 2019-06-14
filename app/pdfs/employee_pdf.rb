class EmployeePdf < Prawn::Document

	def initialize( employees)
		super()
		@employees = Employee.order('id DESC').all
		employee_id
	end

	def employee_id
		table employee_id_all do
			row(0).font_style = :bold
			columns(1..3).align = :right
			self.row_colors  = ["DDDDDD","FFFFFF"]
			self.header = true
		end
	end
	def employee_id_all
		[["Salute","Name","Dob","Address","Salary"]] +
		@employees.map do |emp|
			[emp.salute,emp.name,emp.dob.strftime("%b/%d/%Y"),emp.address,salary(emp.base_salary,emp.da,emp.ta)]
		end
	end
	
	def salary(sal,da,ta)
		if sal.present? && da.present? && ta.present?
			d_allowance = (sal*da)/100
			t_allowance = (sal*ta)/100
			return sal+d_allowance+t_allowance
		end
	end
end