class PhoneNumber
  attr_reader :phone_string

  WRONG_NUMBER = '0000000000'

  def initialize(phone_string)
    @phone_string = phone_string
  end

  def number
    return WRONG_NUMBER if contains_letters?
    digits = phone_string.gsub(/\D/, '')
    return WRONG_NUMBER unless digits.size.between? 10, 11
    if digits.size == 11
      return digits[0] == '1' ? digits[1..-1] : WRONG_NUMBER
    end
    digits
  end

  def area_code
    number[0..2]
  end

  def local_number
    number[3..-1]
  end

  def to_s
    sprintf('(%s) %s-%s', area_code, local_number[0..2], local_number[3..-1])
  end

  private

  def contains_letters?
    phone_string =~ /[a-zA-Z]/
  end
end
