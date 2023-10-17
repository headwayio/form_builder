class AddFormResponseReferenceToAnswers < ActiveRecord::Migration[7.0]
  def change
    add_reference :answers, :response, index: true
    remove_reference :answers, :version, index: true

    add_reference :answers, :question, index: true
  end
end
