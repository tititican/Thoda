class StaticPagesController < ApplicationController
  def home
    @message = Message.new
  end

  def about
  end

  def development
  end

  def design
  end

  def management
  end
end
