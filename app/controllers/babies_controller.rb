class BabiesController < ApplicationController
  before_action :set_baby, only: [:show, :edit, :update, :destroy]
  helper_method :isPresent

  # GET /babies
  # GET /babies.json
  def index
    @babies = Baby.where(admin_id: current_admin.id)
  end

  # GET /babies/1
  # GET /babies/1.json
  def show
    @pools = Pool.where(baby_id: @baby.id)

    @boyCount = 0
    @girlCount = 0

    lengthTotal = 0.0
    weightTotal = 0.0
    lengthCount = 0
    weightCount = 0

    @dates = []
    @times = []

    @pools.each do |p|
      if p.gender == 'girl'
        @girlCount += 1
      else
        @boyCount += 1
      end

      if isPresent(p.length)
        lengthTotal += p.length.to_f
        lengthCount += 1
      end
      if isPresent(p.weight)
        weightTotal += p.weight.to_f
        weightCount += 1
      end

      @dates << p.birth_date
      if isPresent(p.birth_time)
        @times << p.birth_time
      end
    end

    if lengthCount > 0
      @lengthAverage = lengthTotal / lengthCount
    end
    if weightCount > 0
      @weightAverage = weightTotal / weightCount
    end
  end

  # GET /babies/new
  def new
    @baby = Baby.new
  end

  # GET /babies/1/edit
  def edit
  end

  # POST /babies
  # POST /babies.json
  def create
    @baby = Baby.new(baby_params)

    respond_to do |format|
      if @baby.save
        format.html { redirect_to @baby, notice: 'Baby pool was successfully created.' }
        format.json { render :show, status: :created, location: @baby }
      else
        format.html { render :new }
        format.json { render json: @baby.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /babies/1
  # PATCH/PUT /babies/1.json
  def update
    respond_to do |format|

      if @baby.update(baby_params)
        format.html { redirect_to @baby, notice: 'Baby pool was successfully updated.' }
        format.json { render :show, status: :ok, location: @baby }
      else
        format.html { render :edit }
        format.json { render json: @baby.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /babies/1
  # DELETE /babies/1.json
  def destroy
    @baby.destroy
    respond_to do |format|
      format.html { redirect_to babies_url, notice: 'Baby pool was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def baby_born
    @baby = Baby.find(params[:format])

    weight = ozToLbs(@baby.weight).split(' ')
    @weight_oz = weight[2]
    @weight_lbs = weight[0]
  end

  def baby_born_action
    if params[:baby][:weight_lbs] && params[:baby][:weight_oz]
      @baby.weight = (params[:baby][:weight_lbs].to_i * 16) + params[:baby][:weight_oz].to_i
    end
    respond_to do |format|

      if @baby.update(baby_params)
        @pools = Pool.where(baby_id: @baby.id)
    @pools.each do |p|
    end




        format.html { redirect_to @baby, notice: 'Baby pool was successfully updated.' }
        format.json { render :show, status: :ok, location: @baby }
      else
        format.html { render :edit }
        format.json { render json: @baby.errors, status: :unprocessable_entity }
      end
    end
  end

  def isPresent(var)
    if defined?(var) && var.present?
      return true
    end

    return false
  end
  private

    # Use callbacks to share common setup or constraints between actions.
    def set_baby
      @baby = Baby.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def baby_params
      params.require(:baby).permit(:title, :due_date, :end_date, :description, :admin_id, :gender, :payment_link, :registry_link, :baby_name, :birth_date, :birth_time, :length, :weight, :is_born)
    end
    def pool_params
      params.require(:pool).permit(:score)
    end
end
