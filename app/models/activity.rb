class Activity < ActiveRecord::Base

	validates :description, presence: true, :length => {
    :minimum   => 5,
    :maximum   => 1000,
    :tokenizer => lambda { |str| str.scan(/\w+/) },
    :too_short => "Must be at least %{count} words.",
    :too_long  => "Must have at most %{count} words."
}

    validates :title, presence: true, :length => {
    :minimum   => 5,
    :maximum   => 255,
    :too_short => "Must be at least %{count} characters.",
    :too_long  => "Must have at most %{count} characters."
}

    belongs_to :user
    has_attached_file :activity_image, :styles => { :small => "75x75#", :medium => "325x325#", :large => "1000x1000>" }

    validates :user_id, presence: true
    validates_attachment :activity_image, presence: true,
                        content_type: {content_type: ['image/jpeg', 'image/jpg', 'image/png', 'image/gif']},
                        size: {less_than: 5.megabytes}


end
