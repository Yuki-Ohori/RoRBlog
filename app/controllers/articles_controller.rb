class ArticlesController < ApplicationController
    

    def index
        response = RestClient.get APIURL
        @articles = JSON.parse response
        # if !json['total'].zero?
        #     else
        #     render :new
        #     end
        # end
    end
    
    def show
        response = RestClient.get APIURL + '/' + params[:id]
        json = JSON.parse response
        @article = json['data']
    end
    
    def new
        @article = Article.new
    end

    def create
        data = {
            "title" => params[:article][:title],
            "content" => params[:article][:content]
        }.to_json
        # @article = Article.new(article_params)
        response = RestClient.post APIURL, data, { content_type: :json }
        redirect_to "/articles"
        # if @article.save
        #     redirect_to @article
        # else
        #     render 'new'
        # end
    end

    def update
        @article = Article.find(params[:id])
        data = {
            "title" => params[:article][:title],
            "content" => params[:article][:content]
        }.to_json
       
        if @article.update(article_params)
            redirect_to articles_path
        else
          render 'edit'
        end
    end

    def destroy
        response = RestClient.delete APIURL + '/' + params[:id]
        redirect_to articles_path
    end
    
    private
    def article_params
        params.require(:article).permit(:title, :text)
    end
end
