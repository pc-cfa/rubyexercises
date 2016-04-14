require 'csv'

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

  def serialize_to_csv(csv)
    csv << @customer
  end

  def get_as_csv()
    string = ""

    nAttr = @customer.keys.length

    @customer.each do |attr|

      string += attr[1].to_s

      nAttr -= 1
      if (nAttr > 0)
        string += ","
      end

    end
    string += "\n"

    return string
  end

  def set_from_csv(row)
    if (row.length <= @customer.keys.length)

      index = 0
      row.each do |value|
        @customer[index][1] = value.to_s
        index += 1
      end

    else
      alert("object serialization mismatch !")
    end
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

    # if (oMatchedCustomer == nil)
    #   puts "CustomerArray Did not find Customer #{name}"
    # else
    #   puts "CustomerArray Found Customer #{name}"
    # end

    return oMatchedCustomer
  end

end

########################################################################################
# End of class defines
########################################################################################

def find_customer()

  oCustomer = nil

  input = "keep alive";

  until ((input.empty?) || (oCustomer != nil))

    puts("Please enter customer name")

    input = gets.chomp

    input = input.strip
    # input = input.downcase

    if (!input.empty?)
      oCustomer = $oCustomers.find_by_name(input)

      if (oCustomer == nil)
        puts("customer '#{input}' not found !")
      end
    end

  end # until ((input.empty?) || (oCustomer != nil))

  return oCustomer
end

########################################################################################
def load_customers()

  $oCustomers.clear()

  CSV.foreach("customers_file.csv") do |row|
    # use row here...
    oCustomer = Customer.new()

    oCustomer.set_from_csv(row)

    $oCustomers.push(oCustomer)

    # string = row.to_s
    #
    # puts "row=#{string} #{row.length}"
    #
    # row.each do |attr|
    #   puts "#{attr}"
    # end
  end

end

########################################################################################
def save_customers()

  # CSV.open("customers_file.csv", "wb") do |csv|
  #
  #   $oCustomers.each do |oCustomer|
  #     string = oCustomer.get_as_csv()
  #
  #     # csv << [string]
  #     csv.puts(string)
  #
  #   end
  # end

  oFile = File.open("customers_file.csv", "w")

  if (oFile != nil)

    $oCustomers.each do |oCustomer|
       oFile.write( oCustomer.get_as_csv() )
    end

    oFile.close()
  else
    alert("Unable to save customers file !")
  end

end

########################################################################################
def add_customer()
end

########################################################################################
def remove_customer()
  oCustomer = find_customer();

  if (oCustomer != nil)

    save_customers()
  end
end

########################################################################################
def edit_customer()
  oCustomer = find_customer();

  if (oCustomer != nil)
    oCustomer.edit_details()

    save_customers()
  end
end

########################################################################################
def make_a_deposit()
  oCustomer = find_customer();

  if (oCustomer != nil)

    save_customers()
  end
end

########################################################################################
def make_a_withdrawal()
  oCustomer = find_customer();

  if (oCustomer != nil)

    save_customers()
  end
end

########################################################################################
def display_customer_details()
  oCustomer = find_customer();

  if (oCustomer != nil)
    oCustomer.print_details()
  end
end

########################################################################################
def display_all_customer_details()
  $oCustomers.each do |oCustomer|
    oCustomer.print_details()
  end
end

########################################################################################
def main_menu()

  while true
    puts("===============")
    puts("=  Main Menu  =")
    puts("===============")
    puts("1) Add customer")
    puts("2) Remove customer")
    puts("3) Edit customer")
    puts("4) Make a deposit")
    puts("5) Make a withdrawal")
    puts("6) Display customer details")
    puts("7) Display all customer details")
    puts("8) Exit")

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
      when 7 then display_all_customer_details

      when 8 then break;

      else puts("Please enter a valid selection");
    end

  end #while true

end

########################################################################################
def main()
  $oCustomers = CustomerArray.new()

  oCustomer1 = Customer.new(); oCustomer1.set_attr("name", "Pedro"   )
  oCustomer2 = Customer.new(); oCustomer2.set_attr("name", "Sam"     )
  oCustomer3 = Customer.new(); oCustomer3.set_attr("name", "Genevive")

  $oCustomers.push(oCustomer1)
  $oCustomers.push(oCustomer2)
  $oCustomers.push(oCustomer3)

  save_customers();
  load_customers();

  main_menu()

end

########################################################################################
# End of function defines
########################################################################################

########################################################################################
########################################################################################

main()

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
