require_relative "../views/sessions_view"

class SessionsController
  def initialize(employee_repository)
    @view = SessionsView.new
    @employee_repository = employee_repository
  end

  def login
    # username = @view.ask_for("username")
    # password = @view.ask_for("password")
    # employee = @employee_repository.find_by_username(username) # => Employee / nil

    # if employee&.password == password
    #   @view.login_success(employee)
    #   return employee
    # else
    #   @view.login_error
    #   return nil
    # end
    @employee_repository.find_by_username("john")
  end
end
