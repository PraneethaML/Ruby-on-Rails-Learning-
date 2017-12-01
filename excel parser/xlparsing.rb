require 'roo'    

xlsx = Roo::Spreadsheet.open('JOB.xlsx')





#values={}

(1..xlsx.last_column).each do |c|
  list=[]
(3..xlsx.last_row).each do|r|
    
    list<< xlsx.cell(r,c)  
  
    #puts list   
  end
  data= Hash[xlsx.cell(1,c), list]
  puts data
end
#puts values



#puts xlsx.column(2)
#puts xlsx.last_column

#puts xlsx.info
# => Returns basic info about the spreadsheet file
=begin
sheet=xlsx.sheets.first
puts sheet
header=xlsx.cell(1,'A')
puts header
=end



