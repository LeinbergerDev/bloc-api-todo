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

   private
   def items_params
     params.require(:item).permit(:title, :checked, :list_id)
   end
 end
