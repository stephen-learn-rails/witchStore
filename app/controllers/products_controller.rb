class ProductsController < ApplicationController
  #before_action :set_product, only: [:show, :edit, :update, :destroy]
  #before_action :set_product, except: [:admin, :index, :new, :destroy]


  # GET /products
  # GET /products.json
  def index
    @products = Product.all
    # flash.now[:alert] = "test";
    
  end

 
  def admin
    @notice = "Admin Page Reached"

    @products = Product.all
  end

  # GET /products/1
  # GET /products/1.json
  def show
      @product = set_product
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
    #not needed because of before_action
   # @product = Product.find(params[:id])
   @product = set_product
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    @product = set_product
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product = set_product  
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      #find_by_id - this doesn't raise an exception. 
      begin
        return Product.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        flash[:alert] = "Could not find product"
        redirect_to action: "index"
      end
    end

    # Never trust parameters from the scary internet, only allow the white list throug#h.
    def product_params
      params.require(:product).permit(:name, :price, :description, :featured)
    end
end
