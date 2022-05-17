class GildedRose

  def initialize(items)
    @items = items
  end

  def update_item(item)
    if item.name == "Aged Brie"
      if item.quality < 50
          item.quality += 1
      end
      item.sell_in -=  1
      return
    end

    if item.name == "Backstage passes to a TAFKAL80ETC concert"
      if item.quality < 50
        if item.sell_in > 10
          item.quality += 1
        elsif item.sell_in <= 5
          item.quality += 3
        elsif item.sell_in <= 10
          item.quality += 2

        end

      end
      item.sell_in -=  1
      if item.sell_in < 0
        item.quality = item.quality - item.quality
      end
      return
    end

#common items without special conditions
        if item.quality > 0 && item.sell_in > 0
            item.quality -= 1
        end

        item.sell_in -=  1
      if item.sell_in < 0 && item.quality > 0
              item.quality -=  2
        end

  end

  def update_quality()
    @items.each do |item|
      if item.name == "Sulfuras, Hand of Ragnaros"
        next # guard clause (only for enum)
      end
      update_item(item)
    end
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
