class MessagesController < ApplicationController
  before_action :set_message, only: %i[ show edit update destroy ]

  # GET /messages or /messages.json
  def index
  end

  # GET /messages/1 or /messages/1.json
  def show
  end

  def rabin
    @messages = Message.all
    @message = Message.new
  end

  def crush
    @messages = Message.all
    @message = Message.new
  end

  # GET /messages/new
  def new
    @message = Message.new
  end

  # GET /messages/1/edit
  def edit
  end

  # POST /messages or /messages.json
  def create
    if params[:message][:sender].present?
      params[:message][:sender] = params[:message][:sender].to_i
    end
    @message = Message.new(message_params)

    if @message.save
      ActionCable.server.broadcast 'message_channel', message: render_message(@message)
    end
    redirect_to request.referrer || root_url
  end

  # PATCH/PUT /messages/1 or /messages/1.json
  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to message_url(@message), notice: "Message was successfully updated." }
        format.json { render :show, status: :ok, location: @message }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1 or /messages/1.json
  def destroy
    @message.destroy

    respond_to do |format|
      format.html { redirect_to messages_url, notice: "Message was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def message_params
      params.require(:message).permit(:body, :status, :sender)
    end

    def render_message(message)
      MessagesController.renderer.render(partial: 'messages/message', locals: { message: message })
    end
end
