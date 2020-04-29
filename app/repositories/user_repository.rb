require_relative "base_repository"
require_relative "../models/user"

class UserRepository < BaseRepository
  private

  def build_element(attributes)
    attributes[:id] = attributes[:id].to_i
    attributes[:admin] = attributes[:admin] == "true"
    User.new(attributes)
  end
end
