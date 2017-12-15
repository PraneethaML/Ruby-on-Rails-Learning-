
require 'rubygems'
require 'net/ldap'

class LdapUser
  
  def create_connection
    ldap = Net::LDAP.new
    ldap.host = 'localhost'
    ldap.port = 389
    puts "****** Conncection result ********"
    puts ldap.get_operation_result 
    return ldap
  end
  
  # only admin can authenticate
  def authenticate (ldap)
    auth=ldap.authenticate "cn=admin,dc=example,dc=com",'123' 
    puts "***** authentication result *******" 
    puts  ldap.get_operation_result 
  end
  
  # Takes first name, last name and password
  # already existing error when trying to add a user with same cn
  def create_user(ldap)    
    puts "Enter user name to create user"
    firstname = gets.chomp
    puts "Enter Last name"
    lastname = gets.chomp
    puts "Enter password"
    password = gets.chomp
    
    dn = "cn=#{firstname},ou=people,dc=example,dc=com"
     attr = {
       :objectClass => 'inetOrgPerson',
       :cn=> firstname,
       :sn => lastname,
       :userPassword => password
            }
    ldap.add(:dn => dn, :attributes => attr) 
    puts "****** Create_user result *******" 
    puts ldap.get_operation_result 
    
  end
  
  #directly replaces existing password with given new value
  #future enhancements - ask for current password and check if that password exists in database
  def change_password(ldap)
    puts "enter first name"
    firstname=gets.chomp
    puts "enter new password"
    password=gets.chomp
    
    dn = "cn=#{firstname},ou=people,dc=example,dc=com"
   ldap.replace_attribute dn, :userPassword, password
    puts "****** change password result ******"
    puts ldap.get_operation_result
  end
  
  # can modify any attribute of any user
  #no such attribute error on trying to modify non existing user
  def modify(ldap)
    puts "Enter firstname"
    firstname = gets.chomp
    puts "Enter attribute to modify"
    attribute = gets.chomp
    puts "Enter new value"
    value = gets.chomp
    
    dn = "cn=#{firstname},ou=people,dc=example,dc=com"
    ops = [
      [:replace, attribute.to_sym, value ]
    ]
    ldap.modify :dn => dn, :operations => ops
    puts "****** modify result ******"
     puts ldap.get_operation_result
  end

end

user = LdapUser.new
ldap=user.create_connection
user.authenticate(ldap)
user.modify(ldap)





