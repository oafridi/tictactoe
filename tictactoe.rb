class Tictactoe

	def initialize

		# Get users name
		puts "Please enter your name: "
		@name = gets.chomp.capitalize
	  
	  # Create blank board
	  @board = {a1:'-',b1:'-',c1:'-',
			a2:'-',b2:'-',c2:'-',
			a3:'-',b3:'-',c3:'-',}
    
    # Randomly assign nought or cross to players
		if rand > 0.5
			@computer = {play: 'O', name: 'Computer'}
			@user = {play: 'X', name: @name}
			@current_player = @computer[:name]

			display_board
			puts
			puts "#{@computer[:name]} goes first!"
			set_cell_comp			
		else
			@computer = {play: 'X', name: 'Computer'}
			@user = {play: 'O', name: @name}
			puts
			puts "#{@user[:name]} goes first!"
			display_board
			set_cell_user
		end
	end

	# Displays current board
	def display_board
		# puts "abc"
		print @board[:a1], @board[:b1], @board[:c1]
		puts
		print @board[:a2], @board[:b2], @board[:c2]
		puts
		print @board[:a3], @board[:b3], @board[:c3]
		puts
		puts		
	end

	# Takes input from user to select a cell
	def set_cell_user
		puts "Enter your move like so columnrow i.e. a2 : "
			@move = gets.chomp.to_sym
			if @board[@move] == '-'
				@board[@move] = @user[:play]
				display_board
				check_win

				# Move to computer move
				@current_player = @computer[:name]
				set_cell_comp
			else
				puts "This choice is invalid! Enter another!"
				set_cell_user
			end
	end

	# Computer sets first empty cell it can find (#stupid)
	def set_cell_comp		
		@board.each_key do |k|
			if @board[k] == '-'
				 @board[k] = @computer[:play]				 
				break
			end
		end
		display_board
		check_win

		#Switch player and invoke user move
		@current_player = @user[:name]
		set_cell_user
	end

	def check_win

		#8 Possible win combos. 

		#Horizontal win combos
		@combo_h1 = @board[:a1]==@board[:b1] && @board[:b1]==@board[:c1]&&@board[:a1]!='-'
		@combo_h2 = @board[:a2]==@board[:b2] && @board[:b2]==@board[:c2]&&@board[:a2]!='-'
		@combo_h3 = @board[:a3]==@board[:b3] && @board[:b3]==@board[:c3]&&@board[:a3]!='-'

		#Vetical win combos
		@combo_v1 = @board[:a1]==@board[:a2] && @board[:a2]==@board[:a3]&&@board[:a1]!='-'
		@combo_v2 = @board[:b1]==@board[:b2] && @board[:b2]==@board[:b3]&&@board[:b1]!='-'
		@combo_v3 = @board[:c1]==@board[:c2] && @board[:c2]==@board[:c3]&&@board[:c1]!='-'
		
		#Diagonal win combos
		@combo_d1 = @board[:a1]==@board[:b2] && @board[:b2]==@board[:c3]&&@board[:a1]!='-'
		@combo_d2 = @board[:c1]==@board[:b2] && @board[:b2]==@board[:a3]&&@board[:c1]!='-'
		
		if @combo_h1 || @combo_h2 || @combo_h3 || 
			 @combo_v1 || @combo_v2 || @combo_v3 ||
			 @combo_v1 || @combo_v2

				puts "#{@current_player} wins!"
				exit
		end
	end

end

new_game = Tictactoe.new