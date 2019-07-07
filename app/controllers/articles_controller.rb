class ArticlesController <ApplicationController
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
@article = Article.find(params[:id])
end

#we create the validating method that we call above in Article.new
private
def article_params
# :article = top-level key  which will permit the value of title and description
params.require(:article).permit(:title, :description) #require and permit are 2 predefined rails method
end



end
