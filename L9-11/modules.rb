# frozen_string_literal: true

module Manufacturer
  attr_accessor :manufacturer

  def assign_manufacturer(company)
    self.manufacturer = company
  end

  def show_manufacturer
    manufacturer
  end
end

module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.include InstanceMethods
  end

  module ClassMethods
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

module Attrs
  def attr_accessor_with_history (*args)
    args.each do |arg|
      var_arg = "@#{arg}".to_sym
      var_arg_hist = "@#{arg}_history".to_sym

      define_method(arg.to_sym) {instance_variable_get var_arg}

      define_method("#{arg}=".to_sym) do |value|
        instance_variable_set var_arg_hist, [] unless instance_variable_get(var_arg_hist)
        instance_variable_set var_arg, value
        hist = instance_variable_get(var_arg_hist)
        hist << value
        instance_variable_set var_arg_hist, hist
      end
      define_method("#{arg}_history".to_sym) { instance_variable_get(var_arg_hist).inspect }
    end
  end

  def strong_attr_acessor (arg, class_type)
    var_arg = "@#{arg}".to_sym

    define_method(arg.to_sym) {instance_variable_get var_arg}
    define_method("#{arg}=".to_sym) do |value|
      if value.class.to_s == class_type
        instance_variable_set var_arg, value
      else
        raise 'Error TypeMatch'
      end
    end
  end
end

module Validation

  def self.included(base)
    base.extend ClassMethods
    base.include InstanceMethods
  end

  module ClassMethods
    attr_accessor :validations

    def validate(target, val_type_name, *args)
      @validations ||= {}
      @validations[target] = {val_type_name => [*args]}
    end
  end

  module InstanceMethods

    def valid?
      validate!
    rescue
      false
    end

    protected

    NUMBER_FORMAT = /^\w{3}-*\w{2}$/
    RAILWAYSTATION_NAME_PATTERN = /[a-zA-Z]{3,}/

    def validate!
      if self.class.validations
        if self.class.validations.each do |validation|
            target = validation[0]
            val = validation[1].first
            val_type = val.first
            val_params = val.last
            self.send(val_type, target, val_params)
          end
          return true
        else
          return false
        end
      end
    end

    def presence(target, *args)
      var = self.instance_variable_get("@#{target}")
      if var.class == String ? !var.empty? : var.presence
        true
      else
        raise "#{target} can't be empty"
      end
    end

    def type(target, *args)
      check_class = args[0][0]
      var = instance_variable_get("@#{target}").class
      if var == check_class
        true
      else
        raise "unavailable type"
      end
    end

    def format(target, *args)
      format_pattern = args[0]
      if instance_variable_get("@#{target}") !~ NUMBER_FORMAT
        true
      else
        raise 'Wrong format'
      end
    end
  end
end