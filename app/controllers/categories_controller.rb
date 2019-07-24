class CategoriesController < ApplicationController

def index
@categories = Category.paginate(page: params[:page], per_page: 5)  #list all categories, with pagination
end

def new
@category = Category.new  # Instantiates a single new object
end

def create  #creates an object (or multiple objects) and saves it to the database, if validations pass
@category = Category.new(category_params)
if @category.save
flash[:success] = "Category was created successfully"
redirect_to categories_path
else
render 'new' #if the new category is not validated, we render the 'new' (form) template, with validation errors
end
end

def show
end

private
def category_params
params.require(:category).permit(:name)
end
end
