require File.join(File.dirname(__FILE__), 'gilded_rose')

describe GildedRose do

  describe "#update_quality" do
    it "does not change the name" do
      items = [Item.new("foo", 0, 0)] #setup
      GildedRose.new(items).update_quality() #execution of test
      expect(items[0].name).to eq "foo" #assertion - expects it to act a certain way
    end

    it "lowers quality value each day" do 
      items = [Item.new("foo", 10, 10)] #setup
      GildedRose.new(items).update_quality() #execution of test
      expect(items[0].quality).to eq 9 #assertion - expects it to act a certain way
    end

    it "lowers the sell-value each day" do 
      items = [Item.new("foo", 10, 10)] #setup
      GildedRose.new(items).update_quality() #execution of test
      expect(items[0].sell_in).to eq 9
    end
  #   - Once the sell by date has passed, Quality degrades twice as fast
    context "when sell date has passed" do #describe == context (functionally the same, but subset)
      it "quality degrades twice as fast" do 
        items = [Item.new("foo", 0, 10)] #setup
        GildedRose.new(items).update_quality() #execution of test
        expect(items[0].quality).to eq 8
      end
    end


	# - The Quality of an item is never negative
    it "quality is never negative" do 
      items = [Item.new("foo", 0, 0)] 
      GildedRose.new(items).update_quality() 
      expect(items[0].quality).to eq 0
    end

	# - "Aged Brie" actually increases in Quality the older it gets
     context "Aged Brie" do
 
    end 

	# - The Quality of an item is never more than 50
    it "quality is never more than 50" do 
      items = [Item.new("foo", 0, 50)] 
      GildedRose.new(items).update_quality() 
      expect(items[0].quality).to be <= 50
    end
    # - "Sulfuras", being a legendary item, never has to be sold or decreases in Quality

    # - "Backstage passes", like aged brie, increases in Quality as its SellIn value approaches;
    # Quality increases by 2 when there are 10 days or less and by 3 when there are 5 days or less but

    # Quality drops to 0 after the concert
    context "at the TAFKAL80ETC concert" do 
      # it "quality increases by 2 when 10 days or less" do 
      #   items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 0)] #setup
      # GildedRose.new(items).update_quality() #execution of test
      # expect(items[0].quality).to eq 9
      # end

  
      it "quality drops to 0" do 
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 0, 5)] 
        GildedRose.new(items).update_quality() 
        expect(items[0].quality).to eq 0
      end
    end

end
end
