class RatingsController < ApplicationsController

  def update
    @rating = Rating.where(params[:rating]).first_or_initialize

    if @rating.save
      flash[:notice] = "Thanks for rating this topic"
    else
      flash[:error] = "Something went wrong"
    end
    return redirect_to topics_path(params[:topic_id])
  end
end
