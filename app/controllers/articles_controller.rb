class ArticlesController <ApplicationController
 def new
   @article =Article.new
 end

 def create
   #render plain: params[:article].inspect
@article=Article.new(article_params)
@article.save
redirect_to_articles_show(@article)
end
#we create the method that we call above in Article.new
private
def article_params
#  :article = top-level key  which will permit the value of title and description
params.require(:article).permit(:title, :description)
end



end
