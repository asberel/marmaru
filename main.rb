# NOTE: 定数定義
def bar
  puts "===================="
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

class WeaponStatus
  attr_accessor :name, :power

  def initialize(name, power)
    @name = name
    @power = power
  end
end

firsr_charactor_status = CharactorStatus.new('山田ヤマーダ', 20000)
second_charactor_status = CharactorStatus.new('澁谷かのん', 660000)

# NOTE: メソット定義
def show_props_list(props)
  props.each.with_index(1) do |prop, index|
    puts "#{index}: #{prop}"
  end
end

# NOTE: キャラクター選択
puts "1P: 戦うキャラクターを選べ"
bar
show_props_list(MasterDataList.charactor)

num = gets.chomp.to_i - 1
first_player_charactor = MasterDataList.charactor[num]

# NOTE: 武器選択
puts "1P: 戦う武器を選べ"
bar
show_props_list(MasterDataList.weapon)

num = gets.chomp.to_i - 1
first_player_weapon = MasterDataList.weapon[num]

# NOTE: 数値振り分け
player_power = rand(99) * 1000
weapon_power = rand(10) * 1000
takemura_power = 1000000000
power = player_power + weapon_power
takemura_sum_power = takemura_power + weapon_power

# NOTE: 紹介
bar
puts "キャラ・装備紹介"
if first_player_charactor == "竹村まさし"
  puts "「#{first_player_charactor}」 戦闘力： #{takemura_power} "
  puts "「#{first_player_weapon}」 戦闘力：#{weapon_power}"
  puts "合計戦闘力： #{takemura_sum_power}"
else
  puts "「#{first_player_charactor}」 戦闘力： #{player_power} "
  puts "「#{first_player_weapon}」 戦闘力：#{weapon_power}"
  puts "合計戦闘力： #{power}"
end

# NOTE: 2P；キャラクター選択
puts "2P: 戦うキャラクターを選べ"
show_props_list(MasterDataList.charactor)

num = gets.chomp.to_i - 1
second_player_charactor = MasterDataList.charactor[num]

# NOTE: 武器選択
puts "2P: 戦う武器を選べ"
bar
show_props_list(MasterDataList.weapon)

num = gets.chomp.to_i - 1
second_player_weapon = MasterDataList.charactor[num]

# NOTE: 数値振り分け
second_player_power = rand(99) * 1000
second_weapon_power = rand(10) * 1000
second_takemura_power = 1000000000
second_power = second_player_power + second_weapon_power
second_takemura_sum_power = second_takemura_power + second_weapon_power

# NOTE: 紹介
bar
puts "キャラ・装備紹介"
if second_player_charactor == "竹村まさし"
  puts "「#{second_player_charactor}」 戦闘力： #{second_takemura_power} "
  puts "「#{second_player_weapon}」 戦闘力：#{second_weapon_power}"
  puts "合計戦闘力： #{second_takemura_sum_power}"
else
  puts "「#{second_player_charactor}」 戦闘力： #{second_player_power} "
  puts "「#{second_player_weapon}」 戦闘力：#{second_weapon_power}"
  puts "合計戦闘力： #{second_power}"
end

# NOTE: 下記をループさせる
# NOTE: どちらかが戦闘不能でないか検証

  # NOTE: じゃんけんフェーズ
    # 1Pのジャンケン選択
    # 2Pのジャンケン選択
    # あいこになったら何もせず、じゃんけんフェーズの最初に戻る

  # NOTE: ダメージ計算フェーズ
    # 〇〇の攻撃（技名表示）
    # 二人の現在のHP表示

# NOTE: もしもバトルが終わってたらリザルトを表示
# NOTE: プログラムを終了
