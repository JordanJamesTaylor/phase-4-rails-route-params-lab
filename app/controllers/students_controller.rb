class StudentsController < ApplicationController

  def index

    if params[:name]
      # Where returns array
      # LIKE = SQL operator to see if something === something else
      # % % =  Indicates that there may be text before/after and to NOT take this into account when querying DB.
      # :name is the key in the params object sent to our route
      # "first_name LIKE ?..." = first_name is a key within the Student object. 
      # "%#{params[:name]}%" = What we're checking the first_name (with the LIKE ?) against (i.e. what is passed in with the URL)
      # OR last_name LIKE ?" = If query for first_name = nill, do the query again looking at the last_name key in each student object
      # "%#{params[:name]}%", "%#{params[:name]}%" = the values passed in from the user/URL. Must be in the same order as they are in   the LIKE query (i.e. check first_name with the first param, then the second name with the second param) 
      students = Student.where("first_name LIKE ? OR last_name LIKE ?", "%#{params[:name]}%", "%#{params[:name]}%")
      render json: students
    else
      render json: Student.all
    end
  end

  def show
    render json: Student.find(params[:id])
  end

end
