class Document < ApplicationRecord
  validates :content, presence: true,
                      format: {
                        with: /\A[ぁ-んァ-ヶ0-9０-９ｧ-ﾝﾞﾟー－]+\z/,
                        message: "全角のひらがな、全角か半角のカタカナ、数字のみ利用可能です。"
                      }
  is_impressionable
end
