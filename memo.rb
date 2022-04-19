require "csv"

puts "1(新規でメモを作成) 2(既存のメモを編集する)"

memo_type = gets.chomp.to_s

if memo_type == "1"
  puts "拡張子を除いたファイル名を入力してください"
  file_name = gets.chomp
  if file_name
    p "メモしたい内容を記入してください"
    p "完了したらをEnterを押します"
    text = gets.chomp

    CSV.open("#{file_name}.csv", 'w') do |csv|
      csv << [text]
    end
  end
elsif memo_type == "2"
  puts "拡張子を除いたファイル名を入力してください"
  refile_name = gets.chomp
  if refile_name
    CSV.open("#{refile_name}.csv", 'a') do |recsv|
      p "メモしたい内容を記入してください"
      context = gets.chomp
      recsv << [context]
    end
    puts "----------＜メモ＞----------"
    CSV.foreach("#{refile_name}.csv") do |row|
      puts row.join(",")
    end    
  end
else
  puts "1か2を入力してください。"
end

