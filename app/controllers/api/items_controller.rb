class Api::ItemsController < ApiController
   before_action :authenticated?

   def create
     item = Item.new(items_params)
     if item.save
       render json: item
     else
       render json:{ errors: item.errors.full_messages }, status: :unprocessable_entity
     end
   end

   def destroy
     begin
       item = Item.find(params[:id])
       item.destroy
       render json: {}, status: :no_content
     rescue ActiveRecord::RecordNotFound
       render :json => {}, :status => :not_found
     end
   end

   private
   def items_params
     params.require(:item).permit(:title, :checked, :list_id)
   end
 end
