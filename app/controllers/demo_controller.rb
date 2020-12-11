class DemoController < ApplicationController
  def index
  end

  def hello
    @array = [1, 2, 3, 4, 5]
    @id = params['id']
    @page = params[:page]
    #default setting...
    render ('hello')
   
  end

  def other_hello
    redirect_to(:action => 'index') 
  end

  def escape_output

  end

end
