class RatingsController < ApplicationController

  def update
    @rating = Rating.where( topic_id: params[:topic_id], user_id: current_user.id ).first_or_initialize

    if @rating.update_attributes(params[:rating])
      flash[:notice] = "Thanks for rating this topic"
    else
      flash[:error] = "Something went wrong"
    end
    return redirect_to topic_path(params[:topic_id])
  end
  alias_method :create, :update
end
