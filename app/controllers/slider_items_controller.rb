# coding: utf-8
class SliderItemsController < ApplicationController
  
	layout 'admin'
  before_action :check_logged_in
  
  def new
   @slider_item = SliderItem.new
  end
  def create
    @slider_item = SliderItem.new(slider_item_params)
    if @slider_item.save
      flash[:notice] = 'Слайдер был пополнен!'
      redirect_to(slider_items_path)
    else
      flash[:error] = 'Неудачно, что-то не так'
      render('new')
    end
  end

  def edit
    @slider_item = SliderItem.find(params[:id])
  end
  def update
    @slider_item = SliderItem.find(params[:id])
    if @slider_item.update_attributes(slider_item_params)
      flash[:notice] = 'Элемент слайдера успешно обновлён.'
      redirect_to(slider_items_path)
    else
      flash[:error] = 'Неудачно, что-то не так.'
      render('edit')
    end
  end

  def show
    @slider_item = SliderItem.find(params[:id])
  end

  def index
    @slider_items = SliderItem.sorted
  end

  def delete
    @slider_item = SliderItem.find(params[:id])
  end
  def destroy
    @slider_item = SliderItem.find(params[:id])
    @slider_item.destroy
    flash[:notice] = 'Элемент слайдера удалён.'
    redirect_to(slider_items_path)
  end

  private

  def slider_item_params
    params.require(:slider_item).permit(:image, :text, :url)
  end
end
