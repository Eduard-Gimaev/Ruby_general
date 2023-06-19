module Manufacturer
   
    def set_manufacturer(company)
      self.manufacturer = company
    end
  
    def show_manufacturer
      self.manufacturer
    end
    protected
    attr_accessor :manufacturer
    
end

module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

#method instances, which returns the number of instances of this class
  module ClassMethods
    attr_accessor :inst

    def instances
      @@inst
    end
  end
#method register instance, which increases the count of the number of instances of the class and which can be called from the constructor. However, this method should not be public.
  module InstanceMethods
    protected
    def register_instance
      self.class.inst ||= 0
      self.class.inst += 1
    end
  end
end

  