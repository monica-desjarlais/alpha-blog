class ArticlesController <ApplicationController
  before_action :set_article, only: [:edit, :update, :show, :destroy] #call the set article method before these mentioned methods

def index
@articles= Article.all    #grab all articles in db
end

 def new
   @article =Article.new  #initiate the article variable, which will create a form at the UI level
 end                      #Article = class name(model) - we create an object ( article) for this class

 def create
 @article=Article.new(article_params) #To whitelist the values of article, we must create the method article_params
   if @article.save
   flash[:notice]= "Article was successfully created"  #notice is the name of message; will display in application
   redirect_to article_path(@article)  #the index of the actions
   else
   render "new"    #if article is not saved, render the ‘new article’ template
   end
end

def  show

end

def destroy

  @article.destroy   #delete the article
   flash[:notice] = "Article was successfully deleted"
   redirect_to articles_path
end

def edit
@article = Article.find(params[:id])
end

def update

if @article.update(article_params)
flash[:notice]= "Article was successfully updated"
redirect_to article_path(@article)
else
render "edit"
end
end



#we create the validating method that we call above in Article.new
private
def set_article
  @article = Article.find(params[:id])   #find an article from its ID
end
def article_params
# :article = top-level key  which will permit the value of title and description
params.require(:article).permit(:title, :description) #require and permit are 2 predefined rails method
end

end
