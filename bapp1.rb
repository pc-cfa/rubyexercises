########################################################################################
# Start of class defines
########################################################################################

class Customer

  def initialize()

    # integer id
    # string  name
    # string  address
    # string  phone
    # string  email
    # decimal balance

    @customer = { "id" => -1, "name" => "", "address" => "", "phone" => "", "email" => "", "balance" => 0.0 }

    end

  def set_id(var)      @customer['id'] = var       end
  def get_id()         return @customer['id']      end

  def set_name(var)    @customer['name'] = var     end
  def get_name()       return @customer['name']    end

  def set_address(var) @customer['address'] = var  end
  def get_address()    return @customer['address'] end

  def set_phone(var)   @customer['phone'] = var    end
  def get_phone()      return @customer['phone']   end

  def set_email(var)   @customer['email'] = var    end
  def get_email()      return @customer['email']   end

  def set_balance(var) @customer['balance'] = var  end
  def get_balance()    return @customer['balance'] end

  def print_customer_details()
    puts "Customer Details:"

    customer.each do |attr|

      puts "customer attribute '#{attr[0]}' = " + attr[1].to_s

    end

    puts "=" * 15
  end

end

########################################################################################
class CustomerArray < Array

  def find_by_name(name)

    oMatchedCustomer = nil

    each do |oCustomer|

      if (oCustomer.get_name() == name)
        oMatchedCustomer = oCustomer
        break
      end
    end

    if (oMatchedCustomer == nil)
      puts "CustomerArray Did not find Customer #{name}"
    else
      puts "CustomerArray Found Customer #{name}"
    end

    return oMatchedCustomer
  end

end

########################################################################################
# End of class defines
########################################################################################

customer1 = { "name" => "Pedro", "starsign" => "Taurus", "age" => 21, "Class" => "Gold" }
customer2 = { "name" => "Sam", "starsign" => "Spider", "age" => 27, "Class" => "Silver" }
customer3 = { "name" => "Genevive", "starsign" => "Cancer", "age" => 36, "Class" => "Bronze" }

oCustomer1 = Customer.new(); oCustomer1.set("Pedro",    "Taurus", 21)
oCustomer2 = Customer.new(); oCustomer2.set("Sam",      "Spider", 27)
oCustomer3 = Customer.new(); oCustomer3.set("Genevive", "Cancer", 36)
oCustomer4 = Customer.new()


oCustomers = CustomerArray.new

oCustomers.push(oCustomer1)
oCustomers.push(oCustomer2)
oCustomers.push(oCustomer3)
oCustomers.push(oCustomer4)

oCustomers.each do |oCustomer|

  oCustomer.print_customer_details()

end

puts "-------------------------------"

oCustomerSam     = oCustomers.find_by_name("Sam")
oCustomerSam2    = oCustomers.find_by_name("Sam2")
ooCustomerSophia = oCustomers.find_by_name("Sophia")

oCustomerSam.set_name("Sam2")

puts "-------------------------------"

oCustomerSam     = oCustomers.find_by_name("Sam")
oCustomerSam2    = oCustomers.find_by_name("Sam2")
ooCustomerSophia = oCustomers.find_by_name("Sophia")

puts "-------------------------------"
