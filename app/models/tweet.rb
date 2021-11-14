class Tweet < ApplicationRecord
  belongs_to :user
  validates :body, length: { minimum: 1, maximum: 200 }
  validates :publish_at, presence: true

  after_initialize do
    self.publish_at ||= 24.hours.from_now
  end

  after_save_commit do
    TweetJob.set(wait_until: publish_at).perform_later(self) if publish_at_previously_changed?
  end

  def published?
    tweet_id?
  end

  def publish_to_twitter!
    tweet = user.twitter_client.update(body)
    update(tweet_id: tweet.id)
  end

  def exists
    user.twitter_client.status(tweet_id)
  rescue Twitter::Error::NotFound
    destroy
  end
end
