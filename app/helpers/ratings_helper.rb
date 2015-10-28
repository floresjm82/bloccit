module RatingsHelper

  def ratings_to_buttons(ratings)
    raw ratings.map {|r| link_to r.name, rating_path(id: r.id), class: 'btn-xs btn-primary'}.join(' ')
  end


end
