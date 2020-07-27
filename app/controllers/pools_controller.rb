class PoolsController < ApplicationController
  before_action :set_pool, only: [:show, :edit, :update, :destroy]

  # GET /pools/new
  def new
    @baby = Baby.find(params[:format])
    @pool = Pool.new
  end

  # POST /pools
  # POST /pools.json
  def create
    @pool = Pool.new(pool_params)
    @pool.weight = (params[:pool][:weight_lbs].to_i * 16) + params[:pool][:weight_oz].to_i
    respond_to do |format|
      if @pool.save
        format.html { redirect_to baby_path(@pool.baby_id), notice: 'Thank you for betting. Good luck!' }
        format.json { render :show, status: :created, location: @pool }
      else
        format.html { render :new }
        format.json { render json: @pool.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pools/1
  # PATCH/PUT /pools/1.json
  def update
    respond_to do |format|
      if @pool.update(pool_params)
        format.html { redirect_to baby_path(@pool.baby_id), notice: 'Bet was successfully updated.' }
        format.json { render :show, status: :ok, location: @pool }
      else
        format.html { redirect_to baby_path(@pool.baby_id), notice: 'Bet was successfully updated.' }
        format.json { render json: @pool.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pools/1
  # DELETE /pools/1.json
  def destroy
    @pool.destroy
    respond_to do |format|
      format.html { redirect_to baby_path(@pool.baby_id), notice: 'Bet was successfully removed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pool
      @pool = Pool.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pool_params
      params.require(:pool).permit(:name, :email, :gender, :birth_date, :birth_time, :length, :weight, :admin_id, :baby_id, :paid)
    end
end
