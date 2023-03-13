class News < ApplicationRecord
    validates :title, presence: true, length: { minimum: 5, maximum: 55}
    validates :subtitle, presence: true, length: { minimum: 5, maximum: 55}
    validates :author, presence: true, length: { minimum: 5, maximum: 55}
    validates :description, presence: true, length: { minimum: 10, maximum: 255}
    validates :link, presence: true
end