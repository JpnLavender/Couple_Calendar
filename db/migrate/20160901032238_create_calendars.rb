class CreateCalendars < ActiveRecord::Migration
  def change
    create_table :calendars do |t|
      t.integer    :user_id
      t.integer    :category_id
      t.string     :event_title
      t.text       :bio
      t.datetime   :event_start
      t.datetime   :event_end
      t.timestamps null: false
    end
  end
end
