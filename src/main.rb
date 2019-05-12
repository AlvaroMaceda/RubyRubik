
F = 10

class Banana
  F = 100
  def method_missing(*args)
    # puts args
  end
end

puts Banana.const_get('F')
Banana.new.bacalao(3)