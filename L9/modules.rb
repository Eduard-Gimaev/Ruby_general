module Manufacturer
  attr_accessor :manufacturer

  def set_manufacturer(company)
    self.manufacturer = company
  end

  def show_manufacturer
    self.manufacturer
  end
end

module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.include InstanceMethods
    
  end
  
  module ClassMethods
    #attr_reader :instances
    
    def instances
      puts @instances ||= 0
    end 

    def instances_count
      @instances ||= 0
      @instances += 1
    end
  end

  module InstanceMethods
    protected
    def register_instance
      self.class.instances_count
    end
  end
end

module Validatior
  NUMBER_FORMAT = /^\w{3}-*\w{2}$/
  
  def valid?
    validate!
  rescue
    false
  end

end