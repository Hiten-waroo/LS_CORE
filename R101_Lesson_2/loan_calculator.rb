# Loan_calculator.rb

# Capture loan amount
# capture APR
# caoture loan duration in years

# output monthly repayment
# loan duration in months
# Monthly interest rate

def loan_dur_month(loan_duration)
  loan_duration.to_i * 12
end

loop do
  Kernel.puts("Hello - welcome to the Loan calucator")

  Kernel.puts("How much are you looking to loan?")
  amount = ''
  loop do
    amount = Kernel.gets().chomp()
    if amount.empty?() || amount.to_f() < 0
      prompt("Must enter positive number.")
    else
      break
    end
  end

  Kernel.puts("Enter annual interest rate(APR)? eg 5 for 5%")
  apr = ""
  loop do
    apr = Kernel.gets().chomp()

    if apr.empty?() || apr.to_f() < 0
      prompt("Must enter positive number.")
    else
      break
    end
  end

  Kernel.puts("how many years is the loan for?")
  loan_duration = ''
  loop do
    loan_duration = Kernel.gets().chomp()

    if loan_duration.empty?() || loan_duration.to_i() < 0
      prompt("Enter a valid number")
    else
      break
    end
  end

  Kernel.puts("Borrowing £#{amount} over #{loan_duration} years #{apr}% APR")

  annual_int_rate = apr.to_f() / 100
  monthly_interest_rate = annual_int_rate / 12
  monthly_payment = amount.to_f() * (monthly_interest_rate /
  (1 - (1 + monthly_interest_rate)**(-loan_dur_month(loan_duration))))
  total_repayment = monthly_payment * loan_dur_month(loan_duration)

  Kernel.puts("your monthly repayment=  £#{format('%.2f', monthly_payment)}")
  Kernel.puts("Total repayment = £#{format('%.2f', total_repayment)}")

  Kernel.puts("Another loan calculation? Y to continue")
  answer = Kernel.gets().chomp()

  break unless answer.downcase().start_with?('y')
end

Kernel.puts("goodbye")
