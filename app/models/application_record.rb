class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def method_missing(method_name, *args, &block)
    case method_name
    when /_time$/
      self.send("#{method_name}".gsub(/_time$/, '_at')).to_s
    else
      super
    end
  end

  protected

  def generate_id
    "#{self.class.name.first}#{SecureRandom.hex(1)}#{Time.now.to_i.to_s(36)}#{SecureRandom.hex(1)}".upcase
  end
end
