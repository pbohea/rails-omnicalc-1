class CalcController < ApplicationController
  def home
    render({ :template => "templates/square_new"})
  end

  def square_new
    render({ :template => "templates/square_new"})
  end

  def square_results
    @num = params.fetch("number").to_f
    @result = @num ** 2
    render({ :template => "templates/square_results"})
  end

  def square_root_new
    render({ :template => "templates/square_root_new"})
  end

  def square_root_results
    @num = params.fetch("number").to_f
    @result = @num ** 0.5
    render({ :template => "templates/square_root_results"})
  end

  def payment_new
    render({ :template => "templates/payment_new"})
  end

  def payment_results
    apr = params.fetch("APR").to_f
    apr = (apr / 100)/12
    
    @months = (params.fetch("years").to_i)*12
    principal = params.fetch("principal").to_f
    numerator = apr * principal
    denominator = 1 - ((1 + apr) ** -@months)
    @payment_result = (numerator / denominator).to_fs(:currency)  
    @apr = params.fetch("APR").to_i.to_fs(:percentage, {:precision => 4})
    @principal = principal.to_fs(:currency)
    @years = params.fetch("years")
    render({ :template => "templates/payment_results"})
  end

  def random_new
    render({ :template => "templates/random_new"})
  end

  def random_results
    @min = params.fetch("min").to_f
    @max = params.fetch("max").to_f
    @result = rand(@min..@max)
    render({ :template => "templates/random_results"})
  end

end
