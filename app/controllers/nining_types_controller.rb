class NiningTypesController < ApplicationController
  before_action :set_nining_type, only: %i[ show edit update destroy ]

  # GET /nining_types or /nining_types.json
  def index
    @nining_types = NiningType.all
  end

  # GET /nining_types/1 or /nining_types/1.json
  def show
  end

  # GET /nining_types/new
  def new
    @nining_type = NiningType.new
  end

  # GET /nining_types/1/edit
  def edit
  end

  # POST /nining_types or /nining_types.json
  def create
    @nining_type = NiningType.new(nining_type_params)

    respond_to do |format|
      if @nining_type.save
        format.html { redirect_to nining_type_url(@nining_type), notice: "Nining type was successfully created." }
        format.json { render :show, status: :created, location: @nining_type }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @nining_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nining_types/1 or /nining_types/1.json
  def update
    respond_to do |format|
      if @nining_type.update(nining_type_params)
        format.html { redirect_to nining_type_url(@nining_type), notice: "Nining type was successfully updated." }
        format.json { render :show, status: :ok, location: @nining_type }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @nining_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nining_types/1 or /nining_types/1.json
  def destroy
    @nining_type.destroy

    respond_to do |format|
      format.html { redirect_to nining_types_url, notice: "Nining type was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nining_type
      @nining_type = NiningType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def nining_type_params
      params.require(:nining_type).permit(:description, :acronym)
    end
end
