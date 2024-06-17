require 'sqlite3'
require 'io/console'



def continue_story                                                                                                               
  print "press any key"                                                                                                    
  STDIN.getch                                                                                                              
  print "            \r"                                                                                                           
end                                                                                                                        



#Бесконечный цикл
while 0 < 1 do

puts("Поиск по новостям. Введите слова")

text = gets.chomp
puts ('')
 
#Подключаем базу данных SQLite3
def get_db
	db = SQLite3::Database.new 'articles.db'
	return db
end


db = get_db

articles_count 	  = db.execute  'select count(id)                                     from main where  title || body   like REPLACE(?, " " , "%") ', ['%' + text + '%'] 
articles 	      = db.execute  'select lower(title || " " || body || " " || date_in) from main where  title || body   like REPLACE(?, " " , "%") ', ['%' + text + '%'] 

puts("Найденные новости")
puts (articles_count)
puts ('-------------------')
 

articles.each do |article|
       puts  (article)
	   puts ('')
end

#Ожидание нажатия любой клавиши
continue_story                 

#Очистка экрана терминала                                                                                                  
system ("cls") 

end