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
    def characters
      [
        "TK美",
        "Go!Let's be Go",
        "ちょんむげにが",
        "竹村まさし",
        "ちょえちょえアキラ",
        "山田ヤマーダ",
        "中城漸大"
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

class CharacterStatus
  attr_accessor :name, :power

  def initialize(name, hit_point, gu_power, choki_power, pa_power)
    @name = name
    @hit_point = hit_point
    @gu_power  = gu_power
    @choki_power = choki_power
    @pa_power = pa_power
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

# NOTE: キャラクターセッティング
all_character_list = 
CharacterStatus.new("TK美", 15000, 6000, 3000, 3000),
CharacterStatus.new("Go! Let's be Go", 15000, 3000, 3000, 6000),
CharacterStatus.new("ちょんむげにが", 15000, 3000, 6000, 3000),
CharacterStatus.new("竹村まさし", 15000, 3000, 3000, 6000),
CharacterStatus.new("ちょえちょえアキラ", 15000, 3000, 6000, 3000),
CharacterStatus.new("山田ヤマーダ", 15000, 6000, 3000, 3000),
CharacterStatus.new("中城漸大", 15000, 6000, 3000, 3000)

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


# NOTE: ここから表示部分

# NOTE: キャラクター選択
puts "1P: 戦うキャラクターを選べ"
bar
show_props_list(MasterDataList.characters)
blank

num = input_list_number
first_player_character = all_character_list[num]

blank
blank

# NOTE: 2P；キャラクター選択
puts "2P: 戦うキャラクターを選べ"
show_props_list(MasterDataList.characters)
blank

num = input_list_number
second_player_character = all_character_list[num]

blank
blank

# NOTE: 誰と誰が戦うか表示
puts "#{first_player_character.name} VS #{second_player_character.name}"
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
  puts "#{first_player_character.name}のyo!チェケラッチョyo!ベビースター！"
  blank
  first_player_baby_star = input_number

  bar
  # 2Pのじゃんけん選択
  puts "#{second_player_character.name}のyo!チェケラッチョyo!ベビースター！"
  blank
  second_player_baby_star = input_number

  # NOTE: じゃんけん結果っす！
  baby_star_result = baby_star_win_result(first_player_baby_star, second_player_baby_star)

  blank
  blank
  sleep 2

  # NOTE: 桜小路某神社「ビストロ寺のじゃんけんのリザルトっす！」
  case baby_star_result
  when "aiko"
    # 何もせずに最初に戻る
    puts "あいこ"
  when "1p_gu_win"
    # 1pがグーの攻撃
    # TODO: 本来はfirst_player_character.nameから呼び出す
    puts "#{first_player_character.name}がグーで勝ち"
  when "2p_gu_win"
    # 2pがグーの攻撃
    puts "#{second_player_character.name}がグーで勝ち"
  when "1p_choki_win"
    # 1pがチョキの攻撃
    puts "#{first_player_character.name}がチョキで勝ち"
  when "2p_choki_win"
    # 2pがチョキの攻撃
    puts "#{second_player_character.name}がチョキで勝ち"
  when "1p_pa_win"
    # 1pがパーの攻撃
    puts "#{first_player_character.name}がパーで勝ち"
  when "2p_pa_win"
    # 2pがパーの攻撃
    puts "#{second_player_character.name}がパーで勝ち"
  end

  sleep 2
  blank
  blank
  blank

end

  # NOTE: ダメージ表示フェーズ
    # 〇〇の攻撃（技名表示）
    # 二人の現在のHP表示

# NOTE: もしもバトルが終わってたらリザルトを表示
# NOTE: プログラムを終了
