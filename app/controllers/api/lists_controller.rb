class Api::ListsController < ApiController
   before_action :authenticated?

   def create
     list = List.new(list_params)
     if list.save
       render json: list
     else
       render json: { errors: list.errors.full_messages }, status: :unprocessable_entity
     end
   end

   def destroy
     begin
       user = User.find(params[:id])
       list = List.find(params[:id])
       list.destroy
       render json: {}, status: :no_content
     rescue ActiveRecord::RecordNotFound
       render :json => {}, :status => :not_found
     end
   end

   private
   def list_params
     params.require(:list).permit(:title, :private, :user_id)
   end
 end
