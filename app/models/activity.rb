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
    validates :user_id, presence: true

end
