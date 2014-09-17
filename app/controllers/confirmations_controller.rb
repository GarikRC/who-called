class ConfirmationsController < ApplicationController
	def index
		@confirmations = Confirmation.all
	end
end