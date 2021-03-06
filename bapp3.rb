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

    # @customer = {}
    @customer = { "id" => -1, "name" => "", "address" => "", "phone" => "", "email" => "", "balance" => 0.0 }


    end

  def set_attr(attr, var) @customer[attr] = var    end
  def get_attr(attr)      return @customer[attr]   end


  def edit_details()
    puts "============================================="
    puts "Edit Customer Details - #{@customer['name']}:"

    @customer.each do |attr|

      puts "customer attribute '#{attr[0]}' = " + attr[1].to_s

      puts ">"

      String input = gets.chomp

      if (!input.empty?)
        @customer[attr[0]] = input.strip()
      end
    end
  end

  def print_details()
    puts "Customer Details:"

    @customer.each do |attr|

      puts "customer attribute '#{attr[0]}' = " + attr[1].to_s

    end

    puts "=" * 15
  end

  def write(file)

    file.write("<customer>" )

    @customer.each do |attr|

      file.write("<#{attr[0]}>" )
      file.write(attr[1].to_s   )
      file.write("</#{attr[0]}>")

    end

    file.write("</customer>" )
    file.write("\n")
  end

end

########################################################################################
class CustomerArray < Array

  def find_by_name(name)

    oMatchedCustomer = nil

    each do |oCustomer|

      if (oCustomer.get_attr("name") == name)
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

def find_customer()

  oCustomer = nil

  puts("Please enter customer name")

  input = gets.chomp

  input.strip
  input.downcase

  if (!input.empty?)
    oCustomer = oCustomers.find_by_name(input)
  end

  return oCustomer
end

########################################################################################
def add_customer()
end

########################################################################################
def remove_customer()
  oCustomer = find_customer();

  if (oCustomer != nil)

  end
end

########################################################################################
def edit_customer()
  oCustomer = find_customer();

  if (oCustomer != nil)

  end
end

########################################################################################
def make_a_deposit()
  oCustomer = find_customer();

  if (oCustomer != nil)

  end
end

########################################################################################
def make_a_withdrawal()
  oCustomer = find_customer();

  if (oCustomer != nil)

  end
end

########################################################################################
def display_customer_details()
  oCustomer = find_customer();

  if (oCustomer != nil)
    oCustomer.display_customer_details()
  end
end

########################################################################################
def main_menu()

  while true
    puts("1) Add customer")
    puts("2) Remove customer")
    puts("3) Edit customer")
    puts("4) Make a deposit")
    puts("5) Make a withdrawal")
    puts("6) Display customer details")
    puts("7) Exit")

    input = gets.chomp

    input.strip
    input.downcase

    case (input.to_i)

      when 1 then add_customer()
      when 2 then remove_customer()
      when 3 then edit_customer()
      when 4 then make_a_deposit()
      when 5 then make_a_withdrawal()
      when 6 then display_customer_details

      when 7 then break;

      else puts("Please enter a valid selection");
    end

  end #while true

end


########################################################################################
# End of function defines
########################################################################################

customer1 = { "name" => "Pedro", "starsign" => "Taurus", "age" => 21, "Class" => "Gold" }
customer2 = { "name" => "Sam", "starsign" => "Spider", "age" => 27, "Class" => "Silver" }
customer3 = { "name" => "Genevive", "starsign" => "Cancer", "age" => 36, "Class" => "Bronze" }

oCustomer1 = Customer.new(); oCustomer1.set_attr("name", "Pedro"   )
oCustomer2 = Customer.new(); oCustomer2.set_attr("name", "Sam"     )
oCustomer3 = Customer.new(); oCustomer3.set_attr("name", "Genevive")
oCustomer4 = Customer.new()

oCustomer1.set_attr("address", "this is pedro's address")

oCustomers = CustomerArray.new()

oCustomers.push(oCustomer1)
oCustomers.push(oCustomer2)
oCustomers.push(oCustomer3)
oCustomers.push(oCustomer4)

########################################################################################
########################################################################################

main_menu()

########################################################################################
########################################################################################

# puts "-------------------------------"
#   oCustomers.each do |oCustomer|
#
#   oCustomer.print_details()
#
# end
#
# puts "-------------------------------"
#
# oCustomerSam     = oCustomers.find_by_name("Sam")
# oCustomerSam2    = oCustomers.find_by_name("Sam2")
# ooCustomerSophia = oCustomers.find_by_name("Sophia")
#
# oCustomerSam.set_attr("name", "Sam2")
#
# oCustomerSam.edit_details()
#
# puts "-------------------------------"
#
# oCustomerSam     = oCustomers.find_by_name("Sam")
# oCustomerSam2    = oCustomers.find_by_name("Sam2")
# ooCustomerSophia = oCustomers.find_by_name("Sophia")
#
# puts "-------------------------------"
#
# oFile = File.open("customer_file", "w")
#
# if (oFile != nil)
#
#   oCustomers.each do |oCustomer|
#
#     oCustomer.write(oFile)
#
#   end
#
#   oFile.close()
# end
#
# puts "-------------------------------"
#   oCustomers.each do |oCustomer|
#
#   oCustomer.print_details()
#
# end
#
# puts "-------------------------------"
