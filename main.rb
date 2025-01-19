# NOTE: 定数定義
def bar
  puts "===================="
end

def blank
  puts ""
end

# NOTE: マスターデータ定義
class MasterDataList
  class << self
    def charactor
      [
        "TK美",
        "Go!Let's be Go",
        "ちょんむげにが",
        "竹村まさし",
        "ちょえちょえアキラ",
        "山田ヤマーダ"
      ]
    end

    #TODO: 今は使わない
    def weapon
      [
        "タライロンバーバー",
        "やちおんな",
        "なかじょうぜんた"
      ]
    end
  end
end

class CharactorStatus
  attr_accessor :name, :power

  def initialize(name, power)
    @name = name
    @power  = power
  end
end

#TODO: 今は使わない 
class WeaponStatus
  attr_accessor :name, :power

  def initialize(name, power)
    @name = name
    @power = power
  end
end

# TODO: 仮なので後で消す
firsr_charactor_status = CharactorStatus.new('山田ヤマーダ', 20000)
second_charactor_status = CharactorStatus.new('澁谷かのん', 660000)

# NOTE: メソット定義
def show_props_list(props)
  props.each.with_index(1) do |prop, index|
    puts "#{index}: #{prop}"
  end
end

def input_number
  gets.chomp.to_i
end

def input_list_number
  gets.chomp.to_i - 1
end

def baby_star_win_result(first_player, second_player)
  if first_player == 1 && second_player == 2
    "1p_gu_win"
  elsif first_player == 2 && second_player == 1
    "2p_gu_win"
  elsif first_player == 2 && second_player == 3
    "1p_choki_win"
  elsif first_player == 3 && second_player == 2
    "2p_choki_win"
  elsif first_player == 3 && second_player == 1
    "1p_pa_win"
  elsif first_player == 1 && second_player == 3
    "2p_pa_win"
  else
    "aiko"
  end
end

# NOTE: キャラクター選択
puts "1P: 戦うキャラクターを選べ"
bar
show_props_list(MasterDataList.charactor)

num = input_list_number
first_player_charactor = MasterDataList.charactor[num]

# NOTE: 数値振り分け
player_power = rand(99) * 1000
weapon_power = rand(10) * 1000
takemura_power = 1000000000
power = player_power + weapon_power
takemura_sum_power = takemura_power + weapon_power

# # NOTE: 紹介
# bar
# puts "キャラ・装備紹介"
# if first_player_charactor == "竹村まさし"
#   puts "「#{first_player_charactor}」 戦闘力： #{takemura_power} "
#   puts "「#{first_player_weapon}」 戦闘力：#{weapon_power}"
#   puts "合計戦闘力： #{takemura_sum_power}"
# else
#   puts "「#{first_player_charactor}」 戦闘力： #{player_power} "
#   puts "「#{first_player_weapon}」 戦闘力：#{weapon_power}"
#   puts "合計戦闘力： #{power}"
# end

# NOTE: 2P；キャラクター選択
puts "2P: 戦うキャラクターを選べ"
show_props_list(MasterDataList.charactor)

num = input_list_number
second_player_charactor = MasterDataList.charactor[num]


# NOTE: 数値振り分け
second_player_power = rand(99) * 1000
second_weapon_power = rand(10) * 1000
second_takemura_power = 1000000000
second_power = second_player_power + second_weapon_power
second_takemura_sum_power = second_takemura_power + second_weapon_power

# NOTE: 紹介
# bar
# puts "キャラ・装備紹介"
# if second_player_charactor == "竹村まさし"
#   puts "「#{second_player_charactor}」 戦闘力： #{second_takemura_power} "
#   puts "「#{second_player_weapon}」 戦闘力：#{second_weapon_power}"
#   puts "合計戦闘力： #{second_takemura_sum_power}"
# else
#   puts "「#{second_player_charactor}」 戦闘力： #{second_player_power} "
#   puts "「#{second_player_weapon}」 戦闘力：#{second_weapon_power}"
#   puts "合計戦闘力： #{second_power}"
# end

blank
blank

# NOTE: 誰と誰が戦うか表示
puts "#{first_player_charactor} VS #{second_player_charactor}"
sleep 1
puts "熱き戦いの火蓋が、切って落とされた！！"
sleep 3

# NOTE: 死亡フラグの初期設定
first_player_shibo_flag = 0
second_player_shibo_flag = 0

# NOTE: ループさせる・どちらかが戦闘不能でないか検証
until first_player_shibo_flag == 1 || second_player_shibo_flag == 1
  # NOTE: じゃんけんフェーズ
  # baby_star == yo! チェケラチョ yo! ベビースター！の意
  # ジャンケンのロジック: {1: グー, 2: チョキ, 3: パー}
  bar
  puts "じゃんけんするっす！"

  bar
  # 1Pのじゃんけん選択
  puts "#{first_player_charactor}のyo!チェケラッチョyo!ベビースター！"
  first_player_baby_star = input_number

  bar
  # 2Pのじゃんけん選択
  puts "#{second_player_charactor}のyo!チェケラッチョyo!ベビースター！"
  second_player_baby_star = input_number

  # NOTE: じゃんけん結果っす！
  baby_star_result = baby_star_win_result(first_player_baby_star, second_player_baby_star)

  # NOTE: 桜小路某神社「ビストロ寺のじゃんけんのリザルトっす！」
  case baby_star_result
  when "aiko"
    # 何もせずに最初に戻る
    puts "あいこ"
  when "1p_gu_win"
    # 1pがグーの攻撃
    # TODO: 本来はfirst_player_charactor.nameから呼び出す
    puts "#{first_player_charactor}がグーで勝ち"
  when "2p_gu_win"
    # 2pがグーの攻撃
    puts "#{second_player_charactor}がグーで勝ち"
  when "1p_choki_win"
    # 1pがチョキの攻撃
    puts "#{first_player_charactor}がチョキで勝ち"
  when "2p_choki_win"
    # 2pがチョキの攻撃
    puts "#{second_player_charactor}がチョキで勝ち"
  when "1p_pa_win"
    # 1pがパーの攻撃
    puts "#{first_player_charactor}がパーで勝ち"
  when "2p_pa_win"
    # 2pがパーの攻撃
    puts "#{second_player_charactor}がパーで勝ち"
  end
  sleep 2
  blank

end

  # NOTE: ダメージ表示フェーズ
    # 〇〇の攻撃（技名表示）
    # 二人の現在のHP表示

# NOTE: もしもバトルが終わってたらリザルトを表示
# NOTE: プログラムを終了
