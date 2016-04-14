########################################################################################
# Start of class defines
########################################################################################

class Customer

  def initialize(customer)
    @customer = customer
  end

  def get_name()
    return @customer['name']
  end

  def set_name(name)
    @customer['name'] = name
  end

  def print_customer_details()
    puts "Customer Details:"
    puts "Name: #{@customer['name']}"
    puts "Starsign: #{@customer['starsign']}"
    puts "Age: #{@customer['age']}"
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

oCustomer1 = Customer.new(customer1)
oCustomer2 = Customer.new(customer2)
oCustomer3 = Customer.new(customer3)


oCustomers = CustomerArray.new

oCustomers.push(oCustomer1)
oCustomers.push(oCustomer2)
oCustomers.push(oCustomer3)

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
