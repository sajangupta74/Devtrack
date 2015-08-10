class ProductsController < ApplicationController
  
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
    load_and_authorize_resource only: [:new, :create, :update, :destroy, :edit]
    load_and_authorize_resource except: [:index, :show]
  respond_to :html, :js

  def index
    @products = Product.all
  end

  def show
  end

  def new
    @product = Product.new
    respond_with(@product)
  end

  def edit
  end

  def create
    @product = Product.new(product_params)
    flash[:notice] = 'Product was successfully created.' if @product.save
    respond_with(@product)
  end

  def update
    flash[:notice] = 'Product was successfully updated.' if @product.update(product_params)
    respond_with(@product)
  end

  def destroy
    puts "Start Destroy"
    @product.destroy
    @products = Product.all
    @product = Product.last

    respond_to do |format|
      format.html
      format.js
    end
    puts "END DESTROY"
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :price)
    end
end
