class RegistrationsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def new
    @registration = Registration.new
  end

  def create
  end

  def show
  end
end
