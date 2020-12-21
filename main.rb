# 旅行プラン
plans = [
  {name: "沖縄旅行", price: 10000},
  {name: "北海道旅行", price: 20000},
  {name: "九州旅行", price: 15000}
]

# 定数
FIRST_PRODUCT_NUM = 1
LAST_PRODUCT_NUM = (FIRST_PRODUCT_NUM + plans.size) - 1
DISCOUNT_STANDARD_VALUE = 5
DISCOUNT_RATE = 0.1
AFTER_DISCOUNT_RATE = 1 - DISCOUNT_RATE

# 旅行プランを表示
puts "旅行プランを選択して下さい。"
puts
plans.each.with_index(FIRST_PRODUCT_NUM) { |plan, i|
  puts "#{i}. #{plan[:name]}(#{plan[:price]})円"
}
puts

# 旅行プランを選択
while true
  print "プランの番号を選択 > " 
  select_plan_num = gets.to_i
  break if (FIRST_PRODUCT_NUM..LAST_PRODUCT_NUM).include?(select_plan_num)
  puts "#{FIRST_PRODUCT_NUM}〜#{LAST_PRODUCT_NUM}の番号を入力して下さい。"
end
chosen_plan = plans[select_plan_num - FIRST_PRODUCT_NUM]

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
if select_people >= DISCOUNT_STANDARD_VALUE
  puts "#{DISCOUNT_STANDARD_VALUE}名以上ですので#{(DISCOUNT_RATE*100).floor}%割引となります"
  total_price *= AFTER_DISCOUNT_RATE
end
puts "合計料金は#{total_price.floor}円になります。"