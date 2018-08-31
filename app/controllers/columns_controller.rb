class ColumnsController < ApplicationController
  def index
    @column = Column.all
  end
  
end
