
class Customer

  def initialize(customer)
    @customer = customer
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

customers = [customer1, customer2, customer3]

oCustomer1 = Customer.new(customer1)
oCustomer2 = Customer.new(customer2)
oCustomer3 = Customer.new(customer3)

oCustomers = Array([oCustomer1, oCustomer2, oCustomer3])

# customers.push(customer1)
# customers.push(customer2)
# customers.push(customer3)


customer1.each do |attr|

  puts "customer1 = #{attr}"

end

puts "-------------------------------"

customers.each do |customer|

  puts "customer attributes #{customer.keys} " + customer.keys.length.to_s

  customer.each do |attr|

    puts "customer attribute '#{attr[0]}' = " + attr[1].to_s

  end

  puts " "

end
