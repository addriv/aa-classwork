class Employee
  attr_reader :salary

  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
    bonus = @salary * multiplier
  end

end

class Manager < Employee

  def initialize(name, title, salary, boss,*employees)
    @employees = employees
    super(name, title, salary, boss)
  end

  def bonus(multiplier)
    return self.salary if self.class != Manager

    salary_sum = 0

    @employees.each do |employee|
      if employee.class == Manager
        salary_sum += employee.bonus(multiplier) + employee.salary
      else
        salary_sum += employee.salary
      end
    end

    salary_sum * multiplier

    # salaries = @employees.map {|employee| employee.salary}
    # salaries.reduce(:+) * multiplier
  end

end
