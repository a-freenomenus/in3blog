xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Posts"
    xml.description "Posts of in3blog"
    xml.link posts_url(:format => :rss)
    
    for post in @posts
      xml.item do
        xml.title post.title
        xml.description strip_cut(post.body)
        xml.pubDate post.created_at.to_s(:rfc822)
        xml.link post_url(post)
        xml.guid post_url(post)
      end
    end
  end
end
