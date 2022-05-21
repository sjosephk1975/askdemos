class InboxesController < ApplicationController
  before_action :set_inbox, only: %i[show edit update destroy]
  before_action :authorize_inbox, only: %i[edit update destroy]

  # GET /inboxes or /inboxes.json
  def index
 #   set_meta_tags title: %w[Inboxes All]
 #   set_meta_tags title: "Inboxes"
     set_meta_tags title: controller_name.capitalize
    @inboxes = Inbox.all
  end

  # GET /inboxes/1 or /inboxes/1.json
  def show
    set_meta_tags title: @inbox.name
  end

  # GET /inboxes/new
  def new
    set_meta_tags title: "#{action_name.capitalize} #{controller_name.capitalize.singularize}"
    @inbox = Inbox.new
  end

  # GET /inboxes/1/edit
  def edit
    set_meta_tags title: "#{action_name.capitalize} #{controller_name.capitalize.singularize}"
  end

  # POST /inboxes or /inboxes.json
  def create
    @inbox = current_user.inboxes.new(inbox_params)

    respond_to do |format|
      if @inbox.save
        format.html { redirect_to inbox_url(@inbox), notice: 'Inbox was successfully created.' }
        format.json { render :show, status: :created, location: @inbox }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @inbox.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inboxes/1 or /inboxes/1.json
  def update
    respond_to do |format|
      if @inbox.update(inbox_params)
        format.html { redirect_to inbox_url(@inbox), notice: 'Inbox was successfully updated.' }
        format.json { render :show, status: :ok, location: @inbox }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @inbox.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inboxes/1 or /inboxes/1.json
  def destroy
    @inbox.destroy
    respond_to do |format|
      format.html { redirect_to inboxes_url, notice: 'Inbox was successfully destroyed.' }
    end
  end

  private

  def authorize_inbox
    authorize @inbox
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_inbox
    @inbox = Inbox.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def inbox_params
    params.require(:inbox).permit(:name)
  end
end
