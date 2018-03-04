# Ruby-on-Rails-Learning-
- This Repository consists of various small sample applications in Ruby on Rails
-  Student api that has performs basic  CRUD operations in Rails and Sinatra
-  Excel parser: Ruby Script that converts excel sheet to json 
-  Csv parser: Ruby Script that converts csv to json



# Curl Commands
- Post for api from terminal
curl -H "Content-Type: application/json" -X POST -d '{"name":"pranee", "subject":"ruby", "grade":"A"}' http://localhost:3000/student

- Put
curl -i -X PUT -H 'Content-Type: application/json' -d '{"grade": "B"}' http://localhost:3000/student/1

- Delete
curl -i -X DELETE http://localhost:3000/student/1
- =========================================

- Post for sinatra student
curl -d "student[name]=Pranee&student[subject]=ruby&student[grade]=A" http://localhost:4567/StudentDetails

- Get 
Curl http://localhost:4567

- Put
curl -X PUT -d "student[name]=Varun&student[grade]=A" http://localhost:4567/StudentDetails/1

- Delete
curl -X DELETE http://localhost:4567/StudentDetails/1

- curl -H "Content-Type: application/json" -X POST -d "student[name]=Pranee&student[subject]=ruby&student[grade]=A" http://localhost:4567/StudentDetails

 - curl -H "Content-Type: application/json" -X POST -d '{name:"pranee", "subject":"ruby", "grade":"A"}' http://localhost:4567/StudentDetails

