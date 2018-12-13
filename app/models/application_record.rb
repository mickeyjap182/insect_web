class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  #
  def self.instance_method_already_implemented?(method_name)
    return true if method_name == 'valid'
    return true if method_name == 'valid?'
    super
  end
end
