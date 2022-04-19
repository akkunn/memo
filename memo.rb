require "csv"

puts "1(新規でメモを作成) 2(既存のメモを編集する)"

memo_type = gets.chomp.to_s

if memo_type == "1"
  puts "拡張子を除いたファイル名を入力してください"
  file_name = gets.chomp
  if file_name
    p "メモしたい内容を記入してください"
    p "完了したらをCtrl + Dを押します"
    text = readlines
    CSV.open("#{file_name}.csv", 'w', :quote_char => '') do |csv|
      text.each do |memo|
        re_memo = memo.chomp
        csv << [re_memo]  
      end
    end
    p "保存しました"
    p "---------------メモ---------------"
    puts CSV.read("#{file_name}.csv")
  end
elsif memo_type == "2"
  puts "拡張子を除いたファイル名を入力してください"
  refile_name = gets.chomp
  if refile_name
    CSV.open("#{refile_name}.csv", 'a', :quote_char => '') do |recsv|
      p "メモしたい内容を記入してください"
      p "完了したらをCtrl + Dを押します"
      p "---------------メモ---------------"
      puts CSV.read("#{refile_name}.csv")
      context = readlines
      context.each do |rememo|
        rerememo = rememo.chomp
        recsv << [rerememo]  
      end
    end
    p "保存しました"
    p "---------------メモ---------------"
    puts CSV.read("#{refile_name}.csv")
  end
else
  puts "1か2を入力してください。"
end



