class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: {scope: [:artist_name, :release_year], message: "Cannot be repeated by the same artist in the same year"}
  validates :released, inclusion: { in: [true, false]}
  validates :artist_name, presence: true
  with_options if: :released? do |song|
    song.validates :release_year, numericality: { less_than_or_equal_to: Date.today.year}
  end


  def released?
    released
  end

end
