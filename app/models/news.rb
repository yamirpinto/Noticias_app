class News < ApplicationRecord
    belongs_to :user
    validates :title, presence: true, length: { minimum: 5, maximum: 255}
    validates :subtitle, presence: true, length: { minimum: 5, maximum: 255}
    validates :author, presence: true, length: { minimum: 5, maximum: 55}
    validates :description, presence: true, length: { minimum: 10, maximum: 10500}
    validates :link, presence: true
end