class KittensController < ApplicationController
    include KittensHelper

    def index
        @kittens = Kitten.all

        respond_to do |format|
            format.html
            format.xml { render :xml => @kittens }
            format.json { render :json => @kittens }
        end
    end

    def show
        @kitten = Kitten.find(params[:id])

        respond_to do |format|
            format.html
            format.xml { render :xml => @kitten }
            format.json { render :json => @kitten }
        end
    end

    def new
        @kitten = Kitten.new
    end

    def create
        @kitten = Kitten.new(kitten_params)
        if @kitten.save
            redirect_to kitten_path(@kitten), notice: "Kitten '#{@kitten.name}' Created!"
          else
            flash.now.notice = "Error in saving"
            render :new
        end
    end

    def destroy
        @kitten = Kitten.find(params[:id])
        @kitten.destroy
        flash.notice = "Kitten '#{@kitten.name}' Deleted!"
        redirect_to root_path
    end

    def edit
        @kitten = Kitten.find(params[:id])
    end

    def update
        @kitten = Kitten.find(params[:id])
        if @kitten.update(kitten_params)
            redirect_to kitten_path(@kitten), notice: "Kitten '#{@kitten.name}' Updated!"
          else
            flash.now.notice = "Error in updating"
            render :edit
        end
    end
end
