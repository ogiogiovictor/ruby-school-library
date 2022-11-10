class Solver
  def factorial(num)
    if num >= 0
      return 1 if num.zero?

      answer = num
      until num == 1
        num -= 1
        answer *= num
      end
      return answer
    end
    'Error'
  end

  def reverse(word)
    word.reverse
  end
end
