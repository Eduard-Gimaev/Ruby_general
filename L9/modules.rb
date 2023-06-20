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
    @@instances = 0
    def instances_count
      @@instances += 1
      puts @@instances
    end 
    def instances
      puts @@instances
    end

  end

  module InstanceMethods
    protected
    def register_instance
      self.class.instances_count
    end
  end
end