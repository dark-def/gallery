ActiveAdmin.register Category do

   controller do
     cache_sweeper :category_sweeper, :only => [:create, :update, :destroy]

     def create
       super
     end

     def update
       super
     end

     def destroy
       super
     end

   end
end
