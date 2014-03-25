class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :tweet_id
      t.text :content
      t.string :long
      t.string :lat
      t.string :coords
      t.timestamps
    end
  end
end