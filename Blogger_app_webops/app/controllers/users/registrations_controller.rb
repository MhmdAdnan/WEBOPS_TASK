
class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json
  private
   def respond_with(resource, options = {})
     if resource.persisted?
       render json: {
         status: { code: 200, message: "signed up success", data: resource }
       }, status: :ok
     else
       render json: {
         status: { message: "user could not created", errors: resource.errors.full_messages }
       }

     end
   end
end
