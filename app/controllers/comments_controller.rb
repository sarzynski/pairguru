class CommentsController < ApplicationController
  expose :top_commenters, -> { User.count_comments }

  def create
    @movie = Movie.find(params[:movie_id])
    @comment = @movie.comments.create(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to movie_path(@movie)
    else
      flash[:error] = @comment.errors.full_messages.to_sentence
      redirect_back(fallback_location: movie_path(@movie))
    end
  end

  def destroy
    @movie = Movie.find(params[:movie_id])
    @comment = @movie.comments.find(params[:id])
    if @comment.destroy
      redirect_to movie_path(@movie)
    else
      flash[:error] = @comment.errors.full_messages.to_sentence
      redirect_back(fallback_location: movie_path(@movie))
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
