class VillagesController < ApplicationController
  before_action :set_village, only: [:show, :join, :start_game, :edit, :update, :destroy]

  # GET /villages
  # GET /villages.json
  def index
    @villages = Village.all
  end

  # GET /villages/1
  # GET /villages/1.json
  def show
    # MEMO もうゲーム開始していたら、強制的にリダイレクトする？
    @host = User.find(@village.created_by)
    @chats = @village.chats.all
    @current_user = current_user
  end

  def join
    if current_user.current_village
      redirect_to root_path, notice: 'すでに別の村に参加しています'
    else
      VillageUser.create(
        user_id: current_user.id,
        village_id: @village.id
      )
      current_user.update_attribute(:current_village, @village.id)
      redirect_to village_path(@village)
    end
  end

  def leave
    unless current_user.current_village
      redirect_to root_path, notice: 'エラーが発生しました'
    else
      VillageUser.find_by(user_id: current_user.id).destroy!
      current_user.update_attribute(:current_village, nil)
      # flash.now[:notice] = '村から退出しました'
      redirect_to root_path, notice: '村から退出しました'
    end
  end

  def start_game
    @village.is_locked = true
  end

  # GET /villages/new
  def new
    @village = Village.new
  end

  # GET /villages/1/edit
  def edit
    redirect_to @village unless current_user.id == @village.created_by
  end

  # POST /villages
  # POST /villages.json
  def create
    @village = Village.new(village_params)
    @village.created_by = current_user.id
    respond_to do |format|
      if @village.save
        format.html { redirect_to @village, notice: 'Village was successfully created.' }
        format.json { render :show, status: :created, location: @village }
      else
        format.html { render :new }
        format.json { render json: @village.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /villages/1
  # PATCH/PUT /villages/1.json
  def update
    respond_to do |format|
      if @village.update(village_params)
        format.html { redirect_to @village, notice: 'Village was successfully updated.' }
        format.json { render :show, status: :ok, location: @village }
      else
        format.html { render :edit }
        format.json { render json: @village.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /villages/1
  # DELETE /villages/1.json
  def destroy
    @village.destroy
    respond_to do |format|
      format.html { redirect_to villages_url, notice: 'Village was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_village
      @village = Village.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def village_params
      params.require(:village).permit(:name, :mode, :created_by)
    end
end
