class PinsController < ApplicationController
	before_action :find_pin, only: [:show, :edit, :user, :update, :destroy, :upvote, :pin_owner]
	before_action :authenticate_user!, except: [:index, :show]
	before_action :pin_owner, only: [:edit, :update, :destroy]
	def index
		@pins = Pin.all.order("created_at DESC")
	end

	def show
		
	end

	def new
		@pin = current_user.pins.build
	end

	def create
		@pin = current_user.pins.build(pin_params)

		if @pin.save
			redirect_to @pin, notice: "Successfully created new Pin"
		else
			render 'new'
		end
	end

	def pin_owner
	unless @pin.user_id == current_user.id
      flash[:notice] = 'Nice try our kid, :wink: You can only edit the moods of the OP, log in to your account to edit this mood!'
      redirect_to pins_path
     end
	end

	def edit
	end

	def user
	end

	def update
		if @pin.update(pin_params)
			redirect_to @pin, notice: "Pin was Successfully updated"
		else 
			render 'edit'
		end
	end

	def destroy
		@pin.destroy
		redirect_to root_path
	end

	def upvote
		@pin.upvote_by current_user
		redirect_to :back
	end

	private

	def pin_params
		params.require(:pin).permit(:title, :description, :image, :mood)
	end

	def find_pin
		@pin = Pin.find(params[:id])
	end
end
