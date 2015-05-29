def valid_pnr?(pnr:)
  i = 0
  summan = 0
  pnr= pnr.to_s.split(//)

  if pnr.length > 11
    raise ArgumentError.new
  elsif pnr.length <= 0
    raise ArgumentError.new("Pnr must not be empty")
  end

  while i < 9 do

    if pnr[i] == '-'
      pnr.delete_at(i)

    elsif i.modulo(2).zero?

      nummer = pnr[i].to_i
      list = nummer * 2
      list = list.to_s.split(//)
      nummerett = list[0].to_i
      nummertvå = list[1].to_i
      summan = summan + nummerett + nummertvå
      i = i + 1

    else

      nummer = pnr[i].to_i
      summan = summan + nummer
      i = i + 1

    end
  end

  nummer = pnr[9].to_i
  summan = summan + nummer

  if summan % 10 == 0
    message = true

  else

    message = false

  end

  return message

end

# p valid_pnr?(pnr:'971223-3270')

def random_digits(max:)
  digits = rand(1..max).to_s
  if digits.length == 1
    digits = "0#{digits}"
  end
  return digits
end

def generate_pnr (birth_year:, birth_county:, sex:)
  county = {"Stockholm" => rand(0..13),"Kristianstad" => rand(35..38),"Kopparberg" => rand(71..73),"Uppsala" => rand(14..15),"Malmöhus" => rand(39..45)}
  #kommer inte hinna lägga in alla värden så använder bara några
  birth_year = birth_year
  sex = sex
  birth_county = birth_county
  month = random_digits(max: 12)
  day = random_digits(max: 28)
  p day
  p month


  if sex == "female"
    sexnumber = rand(0..9)
    if sexnumber.modulo(2) != 0
      sexnumber = sexnumber + 1
    end
  elsif sex == "male"
    sexnumber = rand(0..9)
    if sexnumber.modulo(2).zero?
       sexnumber = sexnumber + 1
    end
  end
ninefirst = birth_year + month.to_s + day.to_s + county[birth_county].to_s + sexnumber.to_s
p ninefirst
  ninefirst_array = ninefirst.split("")
  ninefirst_integer = ninefirst_array.map(&:to_i)
  p ninefirst_integer
  sum = 0
  ninefirst_integer.each { |a| sum += a }
  p ninefirst_integer
  p sum
  # sen ta sum modulo(10).zero? och göra if loop med +1 och spara i en counter
  # tills sum modulo(10).zero? stämmer och lägga in den sista siffran som counter
end

p generate_pnr(birth_year:"97",birth_county:"Stockholm",sex: "female")







