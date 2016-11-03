class Api::V1::MoviesController < ApplicationController 

	def create
		@movie=Movie.new(movie_params)
		if @movie.save
			render json: {message: 'Successfully created', data: @movie, status_code: 201}
		else
			render json: {message: 'Failure', data: @movie.errors, status_code: 422}
		end
	end

	def index
		if @movies=Movie.all
			render json: {message: 'List of movies', data: @movies, status_code: 201}
		else
			render json: {message: 'Failure', data: @movies.errors, status_code: 422}
		end
	end

	def show
		@movie=Movie.find_by_title(params[:title])
		render json: {message: 'Movie', data: @movie, status_code: 201}
	end

	def update
		@movie=Movie.find_by_id(params[:id])
		
		if @movie.update_attributes(movie_params)
			render json: {message: 'Successfully Updated', data: @movie, status_code: 201}
		else
			render json: {message: 'Failure', data: @movie.errors, status_code: 422}
		end
	end

	def destroy
		@movie=Movie.find_by_id(params[:id])
		if @movie.destroy
			render json: {message: 'Successfully Deleted', data: @movie, status_code: 201}
		else
			render json: {message: 'Failure', data: @movie.errors, status_code: 422}
		end

	end

	private
		def movie_params
			params.require(:movie).permit(:title,:year,:rating,:language,:actors,:director,:producer)
		end
end