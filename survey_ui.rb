require 'active_record'
require './lib/question'
require './lib/survey'


database_configurations = YAML::load(File.open('./db/config.yml'))
development_configuration = database_configurations['development']
ActiveRecord::Base.establish_connection(development_configuration)

def main_menu
  input=nil
  until input == 'x'
    puts "****************************************"
    puts "Welcome to the survey creator app"
    puts "****************************************"
    puts "If you are a survey designer press 'd'."
    puts "If you are a survey taker press 't'."
    puts "Press 'x' to exit."
    main_menu_choice = gets.chomp.downcase

    case main_menu_choice
    when 'd'
      creator_menu
    when 't'
      taker_menu
    when 'x'
      puts "Goodbye!"
      exit
    else
      puts "Sorry try again."
      main_menu
    end
  end
end

def creator_menu
  puts "Enter 'ns' to create a new survey"
  puts "Enter 'aq' to add new questions to survey"
  puts "Enter 'ls' to list all survays"

  user_input = gets.chomp.downcase
  case user_input
  when 'ns'
    new_survey
  when 'aq'
    add_question
  when 'ls'
    list_surveys
  end
end

def new_survey
  puts "Enter the name of the survey you want to create."
  survey_name = gets.chomp
  survey = Survey.create(:name => survey_name)
  puts "You have created a new survey named #{survey_name}"
end

def add_question
  puts "Enter the qustions you want to ask in the survey"
  survey_question = gets.chomp
  question = Question.new({:questions => survey_question})
  question.save
  puts "You added the new question #{survey_question}"
end

def list_surveys
  puts "Here is a list of all surveys!!"
    survey.all.each_with_index do |survey, index|
    puts "#{index + 1}: #{survey.name}"
  end
end

main_menu



