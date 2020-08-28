class Document < ApplicationRecord
  validates :content, presence: true
  validates :english_content, presence: true
  is_impressionable
end
