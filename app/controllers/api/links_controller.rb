class Api::LinksController < ApplicationController
  def create
    link = Link.find_or_create!(long_url: params[:long_url])

    if link
      render json: { link: "#{root_url + link.short_url}" }, status: 200
    else
      render json: { errors: ['Invalid link!'] }, status: 422
    end
  end
end
