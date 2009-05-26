atom_feed do |feed|
  feed.title "Adam Soltys" 
  feed.updated @posts.first.created_at 

  i = @posts.length
  @posts.each do |post|
    feed.entry post do |entry| 
      entry.title post.title
      entry.content post.body, :type => 'html' 
      i = i-1
    end
  end
end
