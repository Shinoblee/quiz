#-----------------------------------------------
#Quiz Redone

class Prompts
    #attr_accessor :question, :answer
    def initialize
        @questions = []
        @answers = []
    end
    
    def quiz_number
        num = gets.chomp.to_i
        if num <= 0
            puts "There must be at least 1 question on the quiz"
            quiz_number
        else
            quiz_loop(num)
        end
        good_luck = Quiz.new(@questions, @answers)
        good_luck.take_quiz
    end
    
    def quiz_loop(num)
        num.times do
            @questions.push(questions_prompt)
            @answers.push(answers_prompt)
        end
    end

    def questions_prompt
        puts "-> Question #{@questions.length + 1} is?"
        return gets.chomp
    end
    
    def answers_prompt
        puts "-> What is the answer to this question?"
        return gets.chomp.downcase
    end

end


class Quiz
    def initialize (questions, answers)
        @questions = questions
        @answers = answers
        @wrong_items = []
        @score = 0
    end

    def take_quiz
        system "clear"
        @questions.length.times do |x|
            puts "Question #{x + 1} is : #{@questions[x]}"
            scoring(x)
        end
        results
    end

    def scoring (x)
        puts "What is your answer?"
        response = gets.chomp.downcase
        response == @answers[x] ? @score += 1 : @wrong_items.push([question: @questions[x], answer: @answers[x]])
    end

    def results
       if @score == @questions.length 
            puts "Congrats! Perfect score: #{@score} out of #{@questions.length}" 
       else
            puts "You're score was #{@score} out of #{@questions.length}"
            wrong_answers
       end
       #print @wrong_items[0]
       #puts "The correct answer for #{@wrong_items[:question]} was #{@wrong_items[:keys]}"
    end

    def wrong_answers
        puts "Do you want the answers or to retake the quiz? - Type answers or retake"
        response = gets.chomp.downcase
        if response == 'answer'
            display_wrong_answer
        elsif response == 'retake'
            @wrong_items = []
            take_quiz
        else
            puts "Please type a valid response"
            wrong_answers
        end
    end

    def display_wrong_answer
        @wrong_items.length.times do |array|
            array.each do |k, v|
                puts "The answer to #{k} was #{v}"
            end
        end
    end

end

def start
    puts "Hi, we are going to make a quiz!"
    puts "How many questions would you like on it?"
end




start
prompt = Prompts.new()#question: [], answer: [] 
prompt.quiz_number