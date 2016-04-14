
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


customer1 = { "name" => "Pedro", "starsign" => "Taurus", "age" => 21, "Class" => "Gold" }
customer2 = { "name" => "Sam", "starsign" => "Spider", "age" => 27, "Class" => "Silver" }
customer3 = { "name" => "Genevive", "starsign" => "Cancer", "age" => 36, "Class" => "Bronze" }

# customers = [customer1, customer2, customer3]

oCustomer1 = Customer.new(customer1)
oCustomer2 = Customer.new(customer2)
oCustomer3 = Customer.new(customer3)

# oCustomers = Array([oCustomer1, oCustomer2, oCustomer3])
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

# oCustomers = Array.new
oCustomers = CustomerArray.new

oCustomers.push(oCustomer1)
oCustomers.push(oCustomer2)
oCustomers.push(oCustomer3)

oCustomers.each do |oCustomer|

  oCustomer.print_customer_details()

end

# def find_customer_by_name(oCustomers, name)
#
#   oMatchedCustomer = nil
#
#   oCustomers.each do |oCustomer|
#
#     if (oCustomer.get_name() == name)
#       oMatchedCustomer = oCustomer
#       break
#     end
#   end
#
#   if (oMatchedCustomer == nil)
#     puts "Did not find Customer #{name}"
#   else
#     puts "Found Customer #{name}"
#   end
#
#   return oMatchedCustomer
# end

# find_customer_by_name(oCustomers, "Sam")
# find_customer_by_name(oCustomers,"Sophia")

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

# customer1.each do |attr|
#
#   puts "customer1 = #{attr}"
#
# end
#
# puts "-------------------------------"
#
# customers.each do |customer|
#
#   puts "customer attributes #{customer.keys} " + customer.keys.length.to_s
#
#   customer.each do |attr|
#
#     puts "customer attribute '#{attr[0]}' = " + attr[1].to_s
#
#   end
#
#   puts " "
#
# end
