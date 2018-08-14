class CatRentalRequestsController < ApplicationController

  def index
    @cat_rental_requests = CatRentalRequest.all
    render :index
  end


  def new
    @cat_rental_request = CatRentalRequest.new
    @cats = Cat.all
    render :new
  end

  def create
    @cat_rental_request = CatRentalRequest.new(cat_rental_request_params)

    if @cat_rental_request.save
      redirect_to cat_rental_requests_url(@cat_rental_request)
    else
      @cat_rental_request = CatRentalRequest.new
      @cats = Cat.all
      render :new
    end
  end

  private

  def cat_rental_request_params
    params.require(:cat_rental_request).permit(:cat_id, :start_date, :end_date, :status)
  end


end
