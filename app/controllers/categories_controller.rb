class CategoriesController < ApplicationController
before_action :require_admin, except: [:index, :show] #need admin for actions, except index and show

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
@category = Category.find(params[:id])
#define var @category_articles which will be used by will_paginate
@category_articles = @category.articles.paginate(page: params[:page], per_page: 5)

end

def edit
@category = Category.find(params[:id])
end

def update
@category = Category.find(params[:id])
if @category.update(category_params)
flash[:success] = "Category name was successfully updated"
redirect_to category_path(@category)
else
render 'edit'
end
end


private
def category_params
params.require(:category).permit(:name)
end

def require_admin
if !logged_in? || (logged_in? and !current_user.admin?) #if user is not logged in OR is logged in and not an admin
flash[:danger] = "Only admins can perform that action"
redirect_to categories_path
end
end

end
