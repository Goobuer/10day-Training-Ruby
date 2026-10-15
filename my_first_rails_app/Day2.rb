
puts "THIS IS A DATE-BASED TO-DO LIST"


#the user defined function or method for displaying
def display_task(task_list)
    if task_list.empty?
        puts "NO TASKS YET"
    else
        puts "\nTASKS:"
        task_list.each_with_index do |task, index|
            puts "#{index + 1}. #{task}"
        end
    end
end



#array of the dates
schedule = []

#to get the date from the user
loop do
    puts "\n--- Enter a date (YYYY-MM-DD): "
    puts "\n--- Type 'exit' to quit."
    date = gets.chomp;

    break if date.downcase === 'exit'

    existing_dates = nil
    schedule.each do |entry|
        if entry[0] == date
            existing_dates = entry
            break
        end
    end


    if existing_dates
        puts "\n DATE #{date} FOUND"
        task_list = existing_dates[1]
        finished_tasks = existing_dates[2]
    else
        puts"\n CREATING TASK FOR DATE #{date}"
        task_list = []
        finished_tasks = []
        schedule << [date, task_list]
        schedule.sort_by! { |entry| entry[0] } 
    end


#To-Do list option and management for the date
    loop do
        puts "\n--- TASKS FOR [#{date}] ---"
        puts "(1) View Tasks"
        puts "(2) Add Task"
        puts "(3) Complete Task"
        puts "(4) View Finished Tasks"
        puts "(5) Switch Date / Back to Main Menu"

        print "SELECT A CHOICE (1-5): "

        choice = gets.chomp.to_i

        
        case choice
        when 1
            display_task(task_list)

        when 2
            puts "\nENTER NEW TASK:"
            new_task = gets.chomp
            task_list << new_task
            puts "TASK ADDED SUCCESSFULLY"

        when 3
            if task_list.empty?
                puts "NO TASKS TO COMPLETE"
            else
                display_task(task_list)
                puts "\nENTER THE NUMBER OF THE TASK TO COMPLETE:"
                task_number = gets.chomp.to_i

                if task_number.between?(1, task_list.length)
                    completed_task = task_list.delete_at(task_number - 1)
                    finished_tasks << completed_task
                    puts "TASK MARKED AS COMPLETED"
                else
                    puts "INVALID TASK NUMBER"
                end
            end

        when 4
            display_task(finished_tasks)

        when 5
            puts "\nRETURNING TO MAIN MENU"
            break
        else
            puts "INVALID CHOICE. PLEASE SELECT A NUMBER BETWEEN 1 AND 5."
        end
    end
end


        














