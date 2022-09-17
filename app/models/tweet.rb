class Tweet < ApplicationRecord
	has_many :collections, dependent: :destroy
end
