class PortfoliosController < ApplicationController
  before_action :set_portfolio, only: %i[ show edit update destroy ]
  before_action :redirect_if_not_owner, only: %i[ edit update destroy ]

  # GET /portfolios or /portfolios.json
  def index
    @portfolios = Portfolio.where(private:false).order(created_at: :desc)
  end

  # GET /portfolios/1 or /portfolios/1.json
  def show
    redirect_to portfolios_path and return if @portfolio.nil?
    respond_to do |format|
      if @portfolio.private and @portfolio.user != current_user
        format.html { flash[:notice] = "Portfolio is marked private." and redirect_to action: :index }
        format.json { render :show, status: :created, location: {} }
      else
        format.html { render :show }
        format.json { render :show, status: :created, location: @portfolio }
      end
    end
  end

  # GET /portfolios/new
  def new
    @portfolio = Portfolio.new
  end

  # GET /portfolios/1/edit
  def edit
    redirect_to portfolios_path and return if @portfolio.nil?
  end

  # POST /portfolios or /portfolios.json
  def create
    @portfolio = Portfolio.new(portfolio_params.merge({user: current_user}))

    respond_to do |format|
      if @portfolio.save
        format.html { redirect_to @portfolio, notice: "Portfolio was successfully created." }
        format.json { render :show, status: :created, location: @portfolio }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @portfolio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /portfolios/1 or /portfolios/1.json
  def update
    redirect_to portfolios_path and return if @portfolio.nil?
    respond_to do |format|
      if @portfolio.update(portfolio_params)
        format.html { redirect_to @portfolio, notice: "Portfolio was successfully updated." }
        format.json { render :show, status: :ok, location: @portfolio }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @portfolio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /portfolios/1 or /portfolios/1.json
  def destroy
    redirect_to portfolios_path and return if @portfolio.nil?
    @portfolio.destroy
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: "Portfolio was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_portfolio
      @portfolio = Portfolio.find_by_id(params[:id])
    end

  def redirect_if_not_owner
    redirect_to (@portfolio or portfolios_path) unless current_user.present? and current_user == @portfolio.try(:user)
  end

    # Only allow a list of trusted parameters through.
    def portfolio_params
      params.require(:portfolio).permit(:description, :private)
    end
end
