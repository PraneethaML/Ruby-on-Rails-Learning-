require 'bundler'
Bundler.require


class StudentDetails
 include DataMapper::Resource
  
  property :id, Serial
  property :name, String
  property :subject, String
  property :grade, String
  
  #validates_presence_of :name
  #validates_presence_of :subject
  #validates_presence_of :grade
end
