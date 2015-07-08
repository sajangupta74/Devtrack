class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
    load_and_authorize_resource only: [:new, :create, :update, :destroy, :edit]
    load_and_authorize_resource except: [:index, :show]
  respond_to :html

  def index
    @products = Product.all
    respond_with(@products)
  end

  def show
    respond_with(@product)
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

  puts params[:product].inspect
  end

  def update
    flash[:notice] = 'Product was successfully updated.' if @product.update(product_params)
    respond_with(@product)
  end

  def destroy
    @product.destroy
    respond_with(@product)
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :price)
    end
end
