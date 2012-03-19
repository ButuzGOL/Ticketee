class Ticket < ActiveRecord::Base
  belongs_to :project
  belongs_to :user

  validates :title, :presence => true
  validates :description, :presence => true
  validates :description, :presence => true,
            :length => { :minimum => 10 }

  paginates_per 50

  has_attached_file :asset

  has_many :assets
  accepts_nested_attributes_for :assets

  has_many :comments
  belongs_to :state

  has_and_belongs_to_many :tags

  def tag!(tags)
    tags = tags.split(" ").map do |tag|
      Tag.find_or_create_by_name(tag)
    end
    self.tags << tags
  end

  searcher do
    label :tag, :from => :tags, :field => :name
    label :state, :from => :state, :field => "name"
  end

  has_and_belongs_to_many :watchers, :join_table => "ticket_watchers",
                          :class_name => "User"

  after_create :creator_watches_me

  private

  def creator_watches_me
    self.watchers << user
  end

end
