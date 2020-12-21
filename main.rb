# 旅行プラン
plans = [
  {name: "沖縄旅行", price: 10000},
  {name: "北海道旅行", price: 20000},
  {name: "九州旅行", price: 15000}
]

# 旅行プランを表示
puts "旅行プランを選択して下さい。"
puts
plans.each.with_index(1) { |plan, i|
  puts "#{i}. #{plan[:name]}(#{plan[:price]})円"
}
puts

# 旅行プランを選択
while true
  print "プランの番号を選択 > " 
  select_plan_num = gets.to_i
  break if (1..3).include?(select_plan_num)
  puts "1〜3の番号を入力して下さい。"
end
chosen_plan = plans[select_plan_num - 1]

# 人数を決定
puts "#{chosen_plan[:name]}ですね。"
while true
  print "何名で予約されますか？ > "
  select_people = gets.to_i
  break if select_people > 0
  puts "1以上を入力して下さい。"
end

# 合計金額を計算
puts "#{select_people}名ですね。"
total_price = chosen_plan[:price] * select_people
if select_people >= 5
  puts "5名以上ですので10%割引となります"
  total_price *= 0.9
end
puts "合計料金は#{total_price.floor}円になります。"