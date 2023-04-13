require 'date'
require 'bigdecimal/newton'
require 'bigdecimal/math'

include Newton

class Xirr
  def initialize(datevalues)
    @datevalues = datevalues
    @zero = BigDecimal("0.0")
    @one  = BigDecimal("1.0")
    @two  = BigDecimal("2.0")
    @ten  = BigDecimal("10.0")
    @eps  = BigDecimal("1.0e-16")
  end

  def eps; @eps end
  def one; @one end
  def two; @two end
  def ten; @ten end
  def zero; @zero end


  def values(x)
    initial = @datevalues[0][:date]
    xirr = Array.new

    xirr << @datevalues.reduce(0) do |acc, transaction|
      exponent = (transaction[:date] - initial) / BigDecimal("365")

      #nth = (@one + x[0]) ** exponent
      nth = BigMath.exp(exponent * BigMath.log(@one + x[0], 15), 15)
      iterant = transaction[:value] / nth
      
      acc + iterant
    end
    xirr
  end
end
