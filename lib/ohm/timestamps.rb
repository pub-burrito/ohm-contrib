require File.expand_path("../datatypes", __FILE__)

module Ohm
  # Provides created_at / updated_at timestamps.
  #
  # @example
  #
  #   class Post < Ohm::Model
  #     include Ohm::Timestamps
  #   end
  #
  #   post = Post.create
  #   post.created_at.to_i == Time.now.utc.to_i
  #   # => true
  #
  #   post = Post[post.id]
  #   post.save
  #   post.updated_at.to_i == Time.now.utc.to_i
  #   # => true
  module Timestamps
    def self.included(model)
      model.attribute :created_at, DataTypes::Type::Timestamp
      model.attribute :updated_at, DataTypes::Type::Timestamp
    end

    def save!
      self.created_at = DataTypes::ISO8601Time.now.utc if new?
      self.updated_at = DataTypes::ISO8601Time.now.utc

      super
    end
  end
end
