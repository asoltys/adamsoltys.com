atom_feed do |feed|
  feed.title "Adam Soltys' Posts" 
  feed.updated @posts.first.created_at 

  @posts.each do |post|
    feed.entry post do |entry| 
      entry.title 'Untitled'
      entry.content post.body, :type => 'html' 
    end
  end
end
