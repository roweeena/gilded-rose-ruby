class Common
  attr_accessor :item
  def initialize(item)
    @item = item
  end

  def update
    if item.quality > 0 && item.sell_in > 0
      item.quality -= 1
      end

      decrease_sell_in
    if item.sell_in < 0 && item.quality > 0
      item.quality -=  2
    end
  end
  def decrease_sell_in
    item.sell_in -= 1
  end

end

class GildedRose

  def initialize(items)
    @items = items
  end

  def find_item(item)
    if item.name == "Aged Brie"
      AgedBrie.new(item)

    elsif item.name == "Backstage passes to a TAFKAL80ETC concert"
      BackStage.new(item)


    elsif item.name == "Conjured Mana Cake"

      ConjuredCake.new(item)

    elsif item.name == "Sulfuras, Hand of Ragnaros"
      Sulfuras.new(item)

    #common items without special conditions
    else
      Common.new(item)
    end
  end

  def update_item(item)
    find_item(item).update
  end

  def update_quality()
    @items.each do |item|
      update_item(item)
    end
  end
end

class AgedBrie < Common
  def update
    if item.quality < 50
      item.quality += 1
      end
      decrease_sell_in
    end
end

class BackStage < Common

  def update
    if item.quality < 50
      if item.sell_in > 10
        item.quality += 1
      elsif item.sell_in <= 5
        item.quality += 3
      elsif item.sell_in <= 10
        item.quality += 2
      end
    end
    decrease_sell_in
    if item.sell_in < 0
      item.quality = item.quality - item.quality
    end
  end
end

class ConjuredCake < Common

  def update
    item.quality -= 2
    decrease_sell_in
  end
end



class Sulfuras < Common

  def update

  end
end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
