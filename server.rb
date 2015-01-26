require 'sinatra'
require 'pry'

students = {
  0 => {
    id:0,
    name:"Genevieve",
    age:"30",
    favorite_spell: "accio"
  }
}
counter = 1

get '/students' do
  erb :index, locals: {students: students}
end

post '/student' do
  new_student = {
    id: counter,
    name: params["name"],
    age: params["age"],
    favorite_spell: params["favorite_spell"]
  }
  students[counter] = new_student
  counter += 1
  redirect '/students'
end

get '/student/:id' do
  this_student = students[params[:id].to_i]
  erb :show, locals: {this_student: this_student}
end

put '/student/:id' do
  student=students[params[:id].to_i]
  student[:name] = params["newname"]
  student[:age] = params["newage"]
  student[:favorite_spell] = params["newspell"]
  redirect '/students'
end
#figure out how to leave field blank without overwriting.
#Do something with the form?

delete '/student/:id' do
  students.delete(params[:id].to_i)
  redirect '/students'
end
