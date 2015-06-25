module Categories
  extend ActiveSupport::Concern

  
 
   def ruby_programming
      categories_articles(1)
   end
  
   def linux
      categories_articles(2)
   end

   def travel
      categories_articles(3)
   end

   def music
       categories_articles(4)
   end
  
  
   def movie
       categories_articles(5)
   end
  
   def ballgame
      categories_articles(6)
   end
    
    
end