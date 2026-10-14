
loans = []

loop do
    puts "\n---PAYMENT TRACKER---"
    puts "(1) Add Borrower"
    puts "(2) Find Borrower & Their Loans"
    puts "(3) View All Borrowers & Total Payments"
    puts "(4) Check Borrowers with over $1000 Total Payments"
    puts "(5) To Exit"

    print "Choice: "

    choice = gets.chomp.to_i

    case choice
    when 1
        puts "\nADDING BORROWER"
        print "Enter Borrower Name: "
        name = gets.chomp.strip
        name.upcase!

        print "Enter Loan Amount:"
        amount = gets.chomp.to_f

        print "Enter Reason: "
        reason = gets.chomp.strip

#this is to check if the Borrower already has existing loans
        existing_name = loans.find { |loans_record| loans_record[0] == name}

        if existing_name
            existing_name[1].push({ amount: amount, reason: reason })
            puts "ADDED NEW LOAN FOR #{name}"
        else
            loans.push([name, [{ amount: amount, reason: reason }]])
            puts "NEW BORROWER SAVED (#{name})"
        end


    when 2
        puts "\nSEARCHING FOR BORROWER"
        printf "Enter Borrower Name: "
        search_name = gets.chomp.strip
        search_name.upcase!

#this is to find the Borrower in the loans[] array
        found_name = loans.find { |loans_record| loans_record[0] == search_name}
        
        if found_name
            borrower_name = found_name[0]
            borrower_amount = found_name[1]
            #borrower_reason = found_name[2]

#this is to print all the loans and the reason under the searched name
            puts "\nFOUND #{search_name}"
            borrower_amount.each { |x| puts "- $#{x[:amount]} -- #{x[:reason]}" }
            
#this part is to calculate for the total payment of the searched name
            total_payment = borrower_amount.reduce(0) { |sum, x| sum + x[:amount] }
            puts "Total Amount: $#{total_payment}"

        else
            puts "\n#{search_name} NOT FOUND!"

        end


    when 3
        if loans.empty?
            puts "\nNO LOANS YET"
        else
            puts "\nALL BORROWERS & THEIR TOTAL PAYMENTS"

#this maps the inner array of the loans[] array, calculates the total_payment, and stores it into summaries, which is another array containing the names and their total payments 
            summaries = loans.map do |borrower_name, borrower_amount|
                total_payment = borrower_amount.reduce(0) { |sum, x| sum + x[:amount] }
                "#{borrower_name}: $#{total_payment}"
            end

#this is where the new array containing each names and their total_payment is printed
            summaries.each { |summary| puts "- #{summary}"}
        end


    when 4
        if loans.empty?
            puts "\nNO LOANS YET"
        else
            puts "\nCHECKING BORROWERS WITH OVER $1000 PAYMENT"

#calculates using .any? andd .all? to check
            any_over_1000 = loans.any? do |borrower_name, borrower_amount|
                total_payment = borrower_amount.reduce(0) { |sum, x| sum + x[:amount] }
                total_payment > 1000
            end

            all_over_1000 = loans.all? do |borrower_name, borrower_amount|
                total_payment = borrower_amount.reduce(0) { |sum, x| sum + x[:amount]}
                total_payment > 1000
            end

            puts "Are there any borrowers over $1000? #{any_over_1000 ? 'YES' : 'NO'}"
            puts "Are all borrowers over $1000? #{all_over_1000 ? 'YES' : 'NO'}"

#if it is YES, then this is where those borrowers over $1000 payment will be stored to be printed
            redflag_borrowers = loans.select do |borrower_name, borrower_amount|
                total_payment = borrower_amount.reduce(0) { |sum, x| sum + x[:amount] }
                total > 1000
            end

            unless redflag_borrowers.empty?
                puts "BORROWERS WITH OVER $1000 PAYMENT:"
                redflag_borrowers.each do |name, borrower_amount|
                    total_payment = borrower_amount.reduce(0) { |sum, x| sum + x[:amount] }
                    puts "- #{name} : $#{total_payment}"
                end
            end
        end


    when 5
        puts "\nEXITING..."
        break;
    else
        puts "\nINVALID CHOICE. CHOOSE (1-5)"
    end

end

        



