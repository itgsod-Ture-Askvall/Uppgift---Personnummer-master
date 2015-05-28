def valid_pnr?(pnr:)


  summa=0
  pnr = pnr.to_s.split(//)
  i= 1
  pnr_integer = pnr.map(&:to_i)
  p pnr_integer

  until i==9
    pnr_integer.each do |nummer|
      if i.%(2).zero?
        nummeren = nummer * 2
        nummeren =
        nummeren.to_s.chars.map(&:to_i)
        nummeren.each do |tal|
          summa = summa + tal
          puts summa

        end
      end
    end
  end
end

p valid_pnr?(pnr:'19971223-3270')
p valid_pnr?(pnr:'19971223-3270')
p valid_pnr?(pnr:'19971223-3270')