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
        "中城漸大",
        "ありがとう、ババアとウエハース"
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
  attr_accessor :name, :hit_point, :gu_power, :choki_power, :pa_power, :gu_skill_name, :choki_skill_name, :pa_skill_name

  def initialize(name, hit_point, gu_power, choki_power, pa_power, gu_skill_name, choki_skill_name, pa_skill_name)
    @name = name
    @hit_point = hit_point
    @gu_power  = gu_power
    @choki_power = choki_power
    @pa_power = pa_power
    @gu_skill_name = gu_skill_name
    @choki_skill_name = choki_skill_name
    @pa_skill_name = pa_skill_name
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
CharacterStatus.new("TK美", 15000, 6000, 3000, 3000, "領域展開・ダイナミック違法建築カフェ", "核兵器デカ乳", "黒の熱帯雨林（ブラックタライロン）"),
CharacterStatus.new("Go! Let's be Go", 15000, 3000, 3000, 6000, "ユーラシアボンバー", "ごえごえhypersonik", "超舌魔術・滞りなくの匂いのアレックス君が踊りながらダンスして俺さー、ここココスはどすこいわっしょいをふっ、たわいもなくデシデシイヤーハ"),
CharacterStatus.new("ちょんむげにが", 15000, 3000, 6000, 3000, "プロセカ天井 at the レイク ALSA 増額たらいせーい", "国王のマゾ性癖爆発、ダブル中回転尻穴S-BULLピーポーセーイ", "そり立つムゲニの仮性包茎ち○ぽ100秒でびゅるびゅるドッカーン"),
CharacterStatus.new("竹村まさし", 15000, 3000, 3000, 6000, "たけちゃんマンぱんち真打", "「豚山行きたくねっ？」と言って不意打ち", "Dead end 尖閣まさし、ミニドラキャノン超絶地獄級"),
CharacterStatus.new("ちょえちょえアキラ", 15000, 3000, 6000, 3000, "皆伝による小指破壊", "ダーツライブ営業一課・課長のダーツめった刺し", "モーリタニア２軍と３軍の練習の成果"),
CharacterStatus.new("山田ヤマーダ", 15000, 6000, 3000, 3000, "俺にはヤマーダヤマーダしかないんすよ、、古舘伊知郎「そうでしょうねぇ〜」", "ぽ", "ここや！どこ？？"),
CharacterStatus.new("中城漸大", 15000, 6000, 3000, 3000, "あっとう、ありがとうございました！", "喋り方を変えてみようと思います！喋り方を変えるだけでね〜、視聴者の皆さんもそうだねーって思ってくれると良いんですが、、、良いと思いますね、はい", "ハムですね〜"),
CharacterStatus.new("ありがとう、ババアとウエハース", 15000, 6000, 3000, 3000, "自己破産免責許可証発行・又地諒に粘着する性自認が微妙な厄介なモエマー", "７シコカレーきしめん", "ばばあばあばあばばばああぁぁ")

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

def baby_star_skill_text(win_player_name, lose_player_name, win_player_skill_name, win_player_skill_power)
  sleep 1
  puts "#{win_player_name}の攻撃"
  sleep 2
  puts "#{win_player_skill_name}！！"
  sleep 1
  puts "#{lose_player_name}に#{win_player_skill_power}ダメージ！！"
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
blank
blank
blank
blank
sleep 3

# NOTE: 死亡フラグの初期設定
first_player_shibo_flag = 0
second_player_shibo_flag = 0

# NOTE: ゲーム内で変動するキャラクターのHPを設定
current_first_player_character_hit_point = first_player_character.hit_point
current_second_player_character_hit_point = second_player_character.hit_point

# NOTE: ターンの初期設定
turn = 1

# NOTE: ループさせる・どちらかが戦闘不能でないか検証
until first_player_shibo_flag == 1 || second_player_shibo_flag == 1
  # NOTE: じゃんけんフェーズ
  # baby_star == yo! チェケラチョ yo! ベビースター！の意
  # ジャンケンのロジック: {1: グー, 2: チョキ, 3: パー}

  # NOTE: 現在のラウンドを表示
  puts "#{turn}ターン目"
  # NOTE: 現在の各プレイヤーのHPを表示
  bar
  puts "#{first_player_character.name}の残りHP: #{current_first_player_character_hit_point}"
  puts "#{second_player_character.name}の残りHP: #{current_second_player_character_hit_point}"
  bar

  blank
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
    puts "#{first_player_character.name}がグーで勝ち"
    baby_star_skill_text(first_player_character.name, second_player_character.name, first_player_character.gu_skill_name, first_player_character.gu_power)
    current_second_player_character_hit_point -= first_player_character.gu_power
  when "2p_gu_win"
    # 2pがグーの攻撃
    puts "#{second_player_character.name}がグーで勝ち"
    baby_star_skill_text(second_player_character.name, first_player_character.name, second_player_character.gu_skill_name, second_player_character.gu_power)
    current_first_player_character_hit_point -= second_player_character.gu_power
  when "1p_choki_win"
    # 1pがチョキの攻撃
    puts "#{first_player_character.name}がチョキで勝ち"
    baby_star_skill_text(first_player_character.name, second_player_character.name, first_player_character.choki_skill_name, first_player_character.choki_power)
    current_second_player_character_hit_point -= first_player_character.choki_power
  when "2p_choki_win"
    # 2pがチョキの攻撃
    puts "#{second_player_character.name}がチョキで勝ち"
    baby_star_skill_text(second_player_character.name, first_player_character.name, second_player_character.choki_skill_name, second_player_character.choki_power)
    current_first_player_character_hit_point -= second_player_character.choki_power
  when "1p_pa_win"
    # 1pがパーの攻撃
    puts "#{first_player_character.name}がパーで勝ち"
    baby_star_skill_text(first_player_character.name, second_player_character.name, first_player_character.pa_skill_name, first_player_character.pa_power)
    current_second_player_character_hit_point -= first_player_character.pa_power
  when "2p_pa_win"
    # 2pがパーの攻撃
    puts "#{second_player_character.name}がパーで勝ち"
    baby_star_skill_text(second_player_character.name, first_player_character.name, second_player_character.pa_skill_name, second_player_character.pa_power)
    current_first_player_character_hit_point -= second_player_character.pa_power
  end

  sleep 2
  blank
  blank
  blank

  # NOTE: もし1Pが戦闘不能なら、死亡フラグを立てる
  if current_first_player_character_hit_point <= 0
    first_player_shibo_flag = 1
  end

  # NOTE: もし2Pが戦闘不能なら、死亡フラグを立てる
  if current_second_player_character_hit_point <= 0
    second_player_shibo_flag = 1
  end

  # NOTE: 次のターンの表示
  turn += 1

end

blank
blank
blank

# NOTE: もしもバトルが終わってたらリザルトを表示
sleep 2
puts "たたかいは 終わった"
blank
sleep 1

if first_player_shibo_flag == 1
  puts "勝者、#{second_player_character.name}！！"
elsif second_player_shibo_flag == 1
  puts "勝者、#{first_player_character.name}！！"
end

blank

# NOTE: プログラムを終了
