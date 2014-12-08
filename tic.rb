$gameon = true

def win_combo
	return [[$board[1][0] + $board[1][1] + $board[1][2]],[$board[2][0] + $board[2][1] + $board[2][2]],[$board[3][0] + $board[3][1] + $board[3][2]], [$board[1][0] + $board[2][0] + $board[3][0]], [$board[1][1] + $board[2][1] + $board[3][1]], [$board[1][2] + $board[2][2] + $board[3][2]], [$board[1][0] + $board[2][1] + $board[3][2]], [$board[1][2] + $board[2][1] + $board[3][0]]]
end

def check_winner
	win_combo.each do |arr|
	str = arr.join
      		if str == "xxx"
        		puts "Congratulation you have beaten the computer!"
        		$gameon = false
			break
      		elsif str == "ooo"
        		puts "Oh well you lost, better luck next time!"
        		$gameon = false
			break
		end
	end

   	$full = "yes"
        	$board.each do |r|
                	r[1].each do |c|
                        	if c != "x" and c != "o"
                                	$full = "no"
                        	end
                	end
        	end
        	if $full == "yes"
                	puts "Its a tie!"
                	$gameon = false
        end
end
#**********************************************************************************************************************

$board = {1=>[' ',' ',' '], 2=>[' ',' ',' '], 3=>[' ',' ',' ']}

def show_board
system 'clear'
spacing = "___|___|___"	
i = 1
while i < 4
	puts "   |   |   "		
	row1 = " " + $board[i][0].to_s + " | " + $board[i][1].to_s + " | " + $board[i][2].to_s
	puts row1
	if i < 3
		then	
		puts spacing
		else
	i+=1
	end
i+=1
end
end

def ticx(r,c)
	$board[r][c] = "x"
	return $board[r][c]
end

def computer_turn
puts "Now its the computers turn..."
sleep(1)

r = rand(3) + 1
c = rand(3)
        if $board[r][c] == "o"
                puts "The computer is stupid, its trying again."
                computer_turn
        elsif $board[r][c] == "x"
                puts "The computer is stupid, its trying again."
                computer_turn
        else
 		$board[r][c] = "o"
        end
puts show_board
end


#*********************************************************************************************************

while $gameon == true
	puts show_board
	puts "What row would you like to put your x (1,2,3)?"
	r = gets.to_i
	puts "What column would you like to put your x (0,1,2)?"
	c = gets.to_i

	if r == 1 or r == 2 or r == 3
		puts " "
	else
		puts "Try again, watch which number you enter for the row."
		puts "What row would you like to put your x (1,2,3)?"
		r = gets.to_i
		puts "What column would you like to put your x (0,1,2)?"
		c = gets.to_i
	end

	if c == 0 or c == 1 or c == 2
		puts " "
	else
		puts "Try again, watch which number you enter for the column."
		puts "What row would you like to put your x (1,2,3)?"
		r = gets.to_i
		puts "What column would you like to put your x (0,1,2)?"
		c = gets.to_i
	end

	if $board[r][c] == "x"
        	system "clear"
        	show_board
        	puts "Space is already taken"
        	puts "Please try again..."
        	sleep 1
        	show_board
        	puts "What row would you like to put your x (1,2,3)?"
                r = gets.to_i
                puts "What column would you like to put your x (0,1,2)?"
                c = gets.to_i
	elsif $board[r][c] == "o"
        	system "clear"
        	show_board
        	puts "Space is already taken"
        	puts "Please try again..."
       	 	sleep 1
        	show_board
        	puts "What row would you like to put your x (1,2,3)?"
                r = gets.to_i
                puts "What column would you like to put your x (0,1,2)?"
                c = gets.to_i
	else
        	$board[r][c] = "x"
	end
	
	tic = ticx(r,c)
	puts "\n"
	check_winner
	puts show_board

	if $gameon == false
                puts "Congratulations.  You have beaten the computer!"
		puts "\n"
		puts "Game Over"
                break
        else
                puts " "
        end
	computer_turn
	puts "\n"
	check_winner
	puts show_board
		
	if $gameon == false
		puts "Congratulations.  You have lost to the computer!"
		puts "\n"
		puts "Game Over"
		break
	else
		puts " "
	end	
end
