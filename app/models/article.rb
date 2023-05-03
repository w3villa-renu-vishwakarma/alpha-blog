class Article < ApplicationRecord
    belongs_to :user
    validates :title, presence: true, length: { minimum: 6, maximim: 80 }
    validates :description, presence: true, length: { minimum: 10, maximim: 200 }

end
