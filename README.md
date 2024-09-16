<h1>   WebOps Task   </h1>
  <h3>Used for this Task (RESTful API Blog Application)</h3>
  <h4>RubyOnRails</h4>
  <h4> Devise and JWT for authentication </h4>
  <h4>Docker</h4>
  <h4>Sidekiq and redis (to schedule post deletion) </h4>

  <h3>You Will Need</h3>
  <h4>Postman or any API Testing Tool</h4>
  <h4>Docker to Run the docker-compose file</h4>

  <h2>To Run The API You will need To run </h2>
  <h4>docker-compose build</h4>
  <h4>docker-compose up</h4>
 
  
<h2>How to Use</h2>

<h3>sign_up</h3>

POST http://localhost:3000/users
<h3>
{
  "user":{
        "email" : "example@gmail.com",
        "password":"123456"
    }
}
 
</h3>
note: the password minimum is 6 char


<h3>sign_in</h3>

POST http://localhost:3000/users
<h3>
{
  "user":{
        "email" : "example@gmail.com",
        "password":"123456"
    }
}
 
</h3>
note: the password minimum is 6 char


<h3>sign_in</h3>

POST http://localhost:3000/users/sign_in
<h3>
{
  "user":{
        "email" : "example@gmail.com",
        "password":"123456"
    }
}
 
</h3>


<h3>sign_out</h3>
YOU HAVE TO COPY THE AUTHORIZATION
AND PUT IT UN THE HEADER OF THE REQUEST
DELETE http://localhost:3000/users/sign_in




<H2>WHEN YOU ARE SIGNED IN THEN YOU CAN MAKE THE FULL CRUD OPERATION ON POSTS AND COMMENTS RELATED TO THE POSTS IF IT AUTHORIZED TO EDITE AND DELETE IT AND CAN CREATE POSTS OR COMMENTS TO A POST</H2>




