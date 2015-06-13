Article.transaction do
   (0..101).each do |i|
     Article.create(title: "Titler #{i}", body: "#{i}Ruby is great gem",published_at:Time.now.strftime("%b-%d %Y %A"),excerpt: 'Pagination testing',location:'testing-only',user_id:1,slug:'testing-only')
   end
end
