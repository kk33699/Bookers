class HomesController < ApplicationController
  def top
    @book = Book.first
  end
end
