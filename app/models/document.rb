class Document < ApplicationRecord
  validates :content, presence: true,
                      format: {
                        with: /\A[^龥A-Za-z]+\z/,
                        message: "漢字やアルファベットは使用できません。"
                      }
  is_impressionable
end
