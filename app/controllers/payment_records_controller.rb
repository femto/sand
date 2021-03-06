class PaymentRecordsController < ApplicationController
  before_action :set_payment_record, only: [:show, :edit, :update, :destroy]

  # GET /payment_records
  # GET /payment_records.json
  def index
    if params[:user_name].present?
      @user = User.find_or_create_by(name: params[:user_name])
    else
      @user = User.find(session[:user_id]) #default using session user
    end

    session[:user_id] = @user.id
    #@payment_records = PaymentRecord.all
    @payment_records = @user.payment_records
    @payment_record = PaymentRecord.new

    @total = @payment_records.inject(0) do |sum, payment_record|
      sum+=payment_record.money
    end
  end

  # GET /payment_records/1
  # GET /payment_records/1.json
  def show
  end

  # GET /payment_records/new
  def new
    @payment_record = PaymentRecord.new
  end

  # GET /payment_records/1/edit
  def edit
  end

  # POST /payment_records
  # POST /payment_records.json
  def create
    @payment_record = PaymentRecord.new(payment_record_params)
    @payment_record.user_id = session[:user_id]

    respond_to do |format|
      if @payment_record.save
        #format.html { redirect_to @payment_record, notice: 'Payment record was successfully created.' }
        format.html { redirect_to "/payment_records" }
        format.json { render :show, status: :created, location: @payment_record }
      else
        format.html { render :new }
        format.json { render json: @payment_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /payment_records/1
  # PATCH/PUT /payment_records/1.json
  def update
    respond_to do |format|
      if @payment_record.update(payment_record_params)
        format.html { redirect_to @payment_record, notice: 'Payment record was successfully updated.' }
        format.json { render :show, status: :ok, location: @payment_record }
      else
        format.html { render :edit }
        format.json { render json: @payment_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payment_records/1
  # DELETE /payment_records/1.json
  def destroy
    @payment_record.destroy
    respond_to do |format|
      format.html { redirect_to payment_records_url, notice: 'Payment record was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payment_record
      @payment_record = PaymentRecord.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def payment_record_params
      params.require(:payment_record).permit(:name, :money)
    end
end
