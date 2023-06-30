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
  NUMBER_FORMAT = /^\d{3}|.{3}-*\d{2}|.{2}$/
  
  def valid?
    valid_train_number!
  rescue
    false
  end
  
protected
  def valid_station_name!
    raise ArgumentError, "Number can't be empty" if self.name.empty?
    raise ArgumentError, "Number can't be shorter than 3 symbols" if self.name.length < 3
    true
  end

  def valid_train_number!
    raise ArgumentError, "Number can't be empty" if self.number.empty?
    raise ArgumentError, "Number can't be shorter than 3 symbols" if self.number.length < 3
    raise ArgumentError, "Incorrect format of the number" if self.number !~ NUMBER_FORMAT
    true
  end
  
end