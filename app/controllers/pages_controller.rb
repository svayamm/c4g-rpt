class PagesController < ApplicationController
    def show
      res = system('java -jar jruby.jar classify_script.rb fin.arff')
      render template: "pages/result", locals: {res: @res}
    end
  end