class LinksController < ApplicationController
  def new
  end

  def url_redirect
    link = Link.find_by_short_url(params[:short_url])
    if link
      redirect_to link.long_url
    else
      render json: { errors: ['Url does not exist!'] }, status: 422
    end
  end
end
