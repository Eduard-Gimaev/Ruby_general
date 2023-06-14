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
  