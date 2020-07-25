class Post < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true    # can't create anything without an valid user_id
  validates :content, presence: true, length: { maximum:140 } # tweets are capped at 140 chars.

#https://stackoverflow.com/questions/3393687/default-sort-order-for-a-rails-model/5609947
#  default_scope order('created_at DESC')
#  default_scope -> { order (created_at: :desc) }
  default_scope -> { order(created_at: :desc) } #newest tweets / posts first
# ---can't get this order right.. so just have to leave without this function for now... perhaps.
end
