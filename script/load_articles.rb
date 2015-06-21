Article.transaction do
   (0..100).each do |i|
     Article.create(title: "title #{i}", body: "#{i} Body is very important part of human being?^^;",excerpt: "#{i}Excerpt is excerpt")
   end
end
