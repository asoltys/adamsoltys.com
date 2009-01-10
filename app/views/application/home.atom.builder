atom_feed do |feed|
  feed.title "Adam Soltys' Posts" 
  feed.updated @posts.first.created_at 

  i = @posts.length
  @posts.each do |post|
    feed.entry post do |entry| 
      entry.title 'Adam Soltys ' + i.to_s
      entry.content post.body, :type => 'html' 
      i = i-1
    end
  end
end
