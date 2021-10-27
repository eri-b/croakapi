module GroupHelper

  def dm_lookup(u1, u2)
    [u1, u2].sort.join('-')
  end

end