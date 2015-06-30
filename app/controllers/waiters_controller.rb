class WaitersController < ApplicationController

  def index
    @waiters = Waiter.all
  end

  def show
    @waiter =
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def get_waiter
    @waiter =
  end

  def waiter_params
  end


end
