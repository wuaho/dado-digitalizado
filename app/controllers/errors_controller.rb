class ErrorsController < ApplicationController
  def error403
    respond_to do |format|
      format.html { render file: "#{Rails.root}/public/403.html", status: 403}
      format.json { render json: '403 You cant treat games like that', status: 403 }
    end
  end

  def error404
    respond_to do |format|
      format.html { render file: "#{Rails.root}/public/404.html", status: 404}
      format.json { render json: '404 Games were not found', status: 404 }
    end
  end

  def error422
    respond_to do |format|
      format.html { render file: "#{Rails.root}/public/422.html", status: 422}
      format.json { render json: '422 You cant treat games like that', status: 422 }
    end
  end

  def error500
    respond_to do |format|
      format.html { render file: "#{Rails.root}/public/500.html", status: 500}
      format.json { render json: '500 Internal Server Error', status: 500 }
    end
  end
end
