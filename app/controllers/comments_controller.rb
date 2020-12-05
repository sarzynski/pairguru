class CommentsController < ApplicationController
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
    @comment.destroy
    redirect_to movie_path(@movie)
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
