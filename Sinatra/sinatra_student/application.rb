require 'sinatra'
require 'bundler'
require 'sinatra/json'


Bundler.require
require './StudentDetails'

#DataMapper.setup(:default, 'sqlite::memory:')
DataMapper.setup(:default, 'mysql://root:123456@localhost:4567/sinatra')
DataMapper.finalize
DataMapper.auto_migrate!


get '/' do
"Hello Student"
end

get '/StudentDetails' do
  
  content_type :json
  students= StudentDetails.all
  puts "======="
  puts students
  puts "======="
  students.to_json
end


get '/StudentDetails/:id' do
  content_type :json
  student= StudentDetails.get params[:id]
  student.to_json
end

post '/StudentDetails' do
  content_type :json
  puts request.body.inspect
  puts params.inspect
  student = StudentDetails.new params[:student]
  puts student.inspect
  if student.save
    status 201
  else
    status 500
    json student.errors.full_messages
  end
end

put  '/StudentDetails/:id' do
  content_type :json
  student = StudentDetails.get params[:id]
  if student.update params[:student]
    status 200
    json "Updated successfully"
  else
    status 500
    json student.errors.full_messages
  end
end

delete  '/StudentDetails/:id' do
  content_type :json
  student = StudentDetails.get params[:id]
  if student.destroy
    status 200
    json "Student was removed"
  else
    status 500
    json "There is a problem in removing the review"
  end
end


