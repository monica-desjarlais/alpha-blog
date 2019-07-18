class PagesController < ApplicationController

def home
redirect_to articles_path if logged_in? #if the user is logged in, he's redirected to articles page
end

def about

end

end
