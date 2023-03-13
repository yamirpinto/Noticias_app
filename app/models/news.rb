class News < ApplicationRecord
    validates :title, presence: true, length: { minimum: 12, maximum: 55}
    validates :subtitle, presence: true, length: { minimum: 12, maximum: 55}
    validates :author, presence: true, length: { minimum: 12, maximum: 55}
    validates :description, presence: true, length: { minimum: 255, maximum: 1250}
    validates :link, presence: true
end