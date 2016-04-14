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


  # def set_id(var)      @customer['id'] = var       end
  # def get_id()         return @customer['id']      end
  #
  # def set_name(var)    @customer['name'] = var     end
  # def get_name()       return @customer['name']    end
  #
  # def set_address(var) @customer['address'] = var  end
  # def get_address()    return @customer['address'] end
  #
  # def set_phone(var)   @customer['phone'] = var    end
  # def get_phone()      return @customer['phone']   end
  #
  # def set_email(var)   @customer['email'] = var    end
  # def get_email()      return @customer['email']   end
  #
  # def set_balance(var) @customer['balance'] = var  end
  # def get_balance()    return @customer['balance'] end

  def edit_details()
    puts "Edit Customer Details:"

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

puts "-------------------------------"
  oCustomers.each do |oCustomer|

  oCustomer.print_details()

end

puts "-------------------------------"

oCustomerSam     = oCustomers.find_by_name("Sam")
oCustomerSam2    = oCustomers.find_by_name("Sam2")
ooCustomerSophia = oCustomers.find_by_name("Sophia")

oCustomerSam.set_attr("name", "Sam2")

oCustomerSam.edit_details()

puts "-------------------------------"

oCustomerSam     = oCustomers.find_by_name("Sam")
oCustomerSam2    = oCustomers.find_by_name("Sam2")
ooCustomerSophia = oCustomers.find_by_name("Sophia")

puts "-------------------------------"

oFile = File.open("customer_file", "w")

if (oFile != nil)

  oCustomers.each do |oCustomer|

    oCustomer.write(oFile)

  end

  oFile.close()
end

puts "-------------------------------"
  oCustomers.each do |oCustomer|

  oCustomer.print_details()

end

puts "-------------------------------"
