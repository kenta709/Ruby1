require "csv"
 
puts "1(新規でメモを作成) 2(既存のメモ編集する)"

memo_type = gets.chomp.to_s

if memo_type == "1"
    puts "拡張子を除いたファイルを入力してください"
    file_name = gets.chomp
    p "メモしたい内容を記入してください"
    p "完了したらCtrl+Dをおします"
    memo_content = $stdin.read
    CSV.open("#{file_name}.csv",'w') do |csv|
        csv << ["#{memo_content}"]        
    end
elsif memo_type == "2"
    puts "編集したいファイルを選択してください"
    Dir.foreach('.') do |item|
        next if item == '.' or item == '..'
        puts item
    end
    file_name = gets.chomp
    p "メモしたい内容を記入してください"
    p "完了したらCtrl+Dをおします"
    memo_content = $stdin.read
    CSV.open("#{file_name}.csv",'a') do |csv|
        csv << ["#{memo_content}"]        
    end
else
    puts "1か2を選択してください"
end