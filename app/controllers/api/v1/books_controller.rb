module API
  module V1
    class BooksController < API::V1::BaseController

      def index
        books = Book.all
        render json: books, status: 200
      end

      def create
        book = Book.new(book_params)
        book.save!
        render json: book, status: 201
      end

      def update
        book = Book.find(params[:id])
        book.update!(book_params)
        render json: book, status: 200
      end

      def destroy
        book = Book.find(params[:id])
        book.destroy!
        render nothing: true, status: 204
      end

      private

      def book_params
        params.permit(:title, :author, :isbn, :review, :rating,
                                     :genre)
      end
    end
  end
end
