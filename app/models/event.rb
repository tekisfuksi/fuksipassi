    class Event < ApplicationRecord
      has_many :participations, dependent: :destroy
      has_many :participation_requests, through: :participations
      belongs_to :year

      # accepts_nested_attributes_for :participations
      attr_accessor :points

      scope :future, -> {where("date > ?", Time.zone.now)}
      scope :past, -> {where("date < ?", Time.zone.now)}

      def unconfirmed_count
        participation_requests.unconfirmed.count
      end


      def points
        if self.participations
          participations.map { |p| p.points }.inject(:+)
        else
          0
        end
      end

      def future?
        date > Time.zone.now
      end


    end
