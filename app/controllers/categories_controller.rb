class CategoriesController < ApplicationController
     before_action :authenticate_user!
     before_action :set_category , only: [:show]


     def index
       if current_user.try(:admin?)
         @categories=Category.all


       end
     end

     def show
       articles=Article.all
       @articles=Category.friendly.find(params[:id]).articles(published_at: :desc).page params[:page]
       render template: "articles/shared/_index"
     end

     def new
       if current_user.try(:admin?)
        @category = Category.new
      else
       redirect_to(root_path)
      end

     end


     def create
       if current_user.try(:admin?)
        @category = Category.new(category_params)
         respond_to do |format|
           if @category.save
             format.html { redirect_to @category }
             format.js
             format.json { head :ok }
             #format.json { render action: 'show', status: :created, location: @article }

           else
             format.html { render action: 'new' }
             format.json { render json: @category.errors, status: :unprocessable_entity }
          end
         end
       end
     end

     def destroy
       if current_user.try(:admin?)
         @category=Category.find(params[:id]).destroy
          if @category.destroy
           redirect_to Category
           flash[:success] = "Category deleted"
          end
        end
      end


     private
     def set_category
       @category = Category.friendly.find(params[:id])
     end

     # Never trust parameters from the scary internet, only allow the white list through.
     def category_params
       params.require(:category).permit(:name,:created_at,:updated_at)

     end

end
