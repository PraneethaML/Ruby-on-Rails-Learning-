require 'csv'    

CSV.open("users.csv", "wb") do |csv|
  csv << ["email"+"   ,  "+"name"]
  CSV.foreach('unverified_users_28_November.csv', :headers=>true) do |row|
      
      csv << [row[0]+" ,"+row[1]]
    end
end