include RSpec
require_relative 'bacon'

RSpec.describe Bacon, type: Class do
  let (:bacon) { Bacon.new() }
  let (:kevin_bacon) { Node.new("Kevin Bacon") }
  let (:zoe_saldana) { Node.new("Zoe Saldana") }
  let (:robert_downey_jr) { Node.new("Robert Downey Jr") }
  let (:chris_hemsworth) { Node.new("Chris Hemsworth") }
  let (:chris_evans) { Node.new("Chris Evans") }
  let (:mark_ruffalo) { Node.new("Mark Ruffalo") }
  let (:scarlett_johanssen) { Node.new("Scarlett Johanssen") }
  let (:elizabeth_olsen) { Node.new("Elizabeth Olsen") }
  let (:paul_rudd) { Node.new("Paul Rudd") }
  let (:tom_holland) { Node.new("Tom Holland") }
  let (:chris_pratt) { Node.new("Chris Pratt") }
  let (:bree_olsen) { Node.new("Bree Olsen") }
  let (:benedicht_cumberbatch) { Node.new("Benedicht Cumberbatch") }
  let (:michael_b_jordan) { Node.new("Michael B Jordan") }
  let (:chadwick_boseman) { Node.new("Chadwick Boseman") }
  let (:jeremy_renner) { Node.new("Jeremy Renner") }
  let (:samuel_l_jackson) { Node.new("Samuel L Jackson") }
  let (:bradley_cooper) { Node.new("Bradley Cooper") }
  let (:chris_pine) { Node.new("Chris Pine") }
  let (:gal_gadot) { Node.new("Gal Gadot") }
  let (:hugh_jackman) { Node.new("Hugh Jackman") }
  let (:patrick_stewart) { Node.new("Patrick Stewart") }
  let (:christian_bale) { Node.new("Christian Bale") }
  let (:no_connection) { Node.new("No Connection") }
  let (:no_actor) { Node.new("No Actor") }

  describe "successfully finds matches" do
    it "finds Chris Pratt" do
      kevin_bacon.film_actor_hash['First Film'] = [chris_hemsworth, chris_evans, robert_downey_jr]
      robert_downey_jr.film_actor_hash['First Film'] = [chris_hemsworth, chris_evans, kevin_bacon]
      chris_evans.film_actor_hash['First Film'] = [chris_hemsworth, robert_downey_jr, kevin_bacon]
      chris_hemsworth.film_actor_hash['First Film'] = [robert_downey_jr, chris_evans, kevin_bacon]
      chris_hemsworth.film_actor_hash['Second Film'] = [paul_rudd, chris_pratt, tom_holland]
      chris_pratt.film_actor_hash['Second Film'] = [paul_rudd, chris_hemsworth, tom_holland]
      paul_rudd.film_actor_hash['Second Film'] = [chris_pratt, chris_hemsworth, tom_holland]
      tom_holland.film_actor_hash['Second Film'] = [chris_pratt, chris_hemsworth, paul_rudd]
      result = ["Second Film", "First Film"]
      expect(bacon.find_kevin_bacon(chris_pratt)).to eq(result)
    end

    it "finds Michael B Jordan" do
      kevin_bacon.film_actor_hash['First Film'] = [chris_hemsworth, chris_evans, robert_downey_jr]
      robert_downey_jr.film_actor_hash['First Film'] = [chris_hemsworth, chris_evans, kevin_bacon]
      chris_evans.film_actor_hash['First Film'] = [chris_hemsworth, robert_downey_jr, kevin_bacon]
      chris_hemsworth.film_actor_hash['First Film'] = [chris_evans, robert_downey_jr, kevin_bacon]
      chris_hemsworth.film_actor_hash['Second Film'] = [chris_pratt, paul_rudd, tom_holland]
      chris_pratt.film_actor_hash['Second Film'] = [chris_hemsworth, paul_rudd, tom_holland]
      paul_rudd.film_actor_hash['Second Film'] = [chris_hemsworth, chris_pratt, tom_holland]
      tom_holland.film_actor_hash['Second Film'] = [chris_hemsworth, chris_pratt, paul_rudd]
      mark_ruffalo.film_actor_hash['Third Film'] = [scarlett_johanssen, elizabeth_olsen]
      scarlett_johanssen.film_actor_hash['Third Film'] = [mark_ruffalo, elizabeth_olsen]
      elizabeth_olsen.film_actor_hash['Third Film'] = [mark_ruffalo, scarlett_johanssen]
      tom_holland.film_actor_hash['Fourth Film'] = [bree_olsen, benedicht_cumberbatch, michael_b_jordan]
      benedicht_cumberbatch.film_actor_hash['Fourth Film'] = [bree_olsen, tom_holland, michael_b_jordan]
      bree_olsen.film_actor_hash['Fourth Film'] = [benedicht_cumberbatch, tom_holland, michael_b_jordan]
      michael_b_jordan.film_actor_hash['Fourth Film'] = [benedicht_cumberbatch, tom_holland, bree_olsen]
      result = ["Fourth Film", "Second Film", "First Film"]
      expect(bacon.find_kevin_bacon(michael_b_jordan)).to eq(result)
    end

    it "finds Gal Gadot" do
      kevin_bacon.film_actor_hash['First Film'] = [chris_hemsworth, chris_evans, robert_downey_jr]
      robert_downey_jr.film_actor_hash['First Film'] = [chris_hemsworth, chris_evans, kevin_bacon]
      chris_evans.film_actor_hash['First Film'] = [chris_hemsworth, robert_downey_jr, kevin_bacon]
      chris_hemsworth.film_actor_hash['First Film'] = [chris_evans, robert_downey_jr, kevin_bacon]
      chris_hemsworth.film_actor_hash['Second Film'] = [chris_pratt, paul_rudd, tom_holland]
      chris_pratt.film_actor_hash['Second Film'] = [chris_hemsworth, paul_rudd, tom_holland]
      paul_rudd.film_actor_hash['Second Film'] = [chris_hemsworth, chris_pratt, tom_holland]
      tom_holland.film_actor_hash['Second Film'] = [chris_hemsworth, chris_pratt, paul_rudd]
      mark_ruffalo.film_actor_hash['Third Film'] = [scarlett_johanssen, elizabeth_olsen]
      scarlett_johanssen.film_actor_hash['Third Film'] = [mark_ruffalo, elizabeth_olsen]
      elizabeth_olsen.film_actor_hash['Third Film'] = [mark_ruffalo, scarlett_johanssen]
      tom_holland.film_actor_hash['Fourth Film'] = [benedicht_cumberbatch, bree_olsen, michael_b_jordan]
      benedicht_cumberbatch.film_actor_hash['Fourth Film'] = [tom_holland, bree_olsen, michael_b_jordan]
      bree_olsen.film_actor_hash['Fourth Film'] = [tom_holland, benedicht_cumberbatch, michael_b_jordan]
      michael_b_jordan.film_actor_hash['Fourth Film'] = [tom_holland, benedicht_cumberbatch, bree_olsen]
      michael_b_jordan.film_actor_hash['Fifth Film'] = [jeremy_renner, chadwick_boseman, samuel_l_jackson]
      jeremy_renner.film_actor_hash['Fifth Film'] = [michael_b_jordan, chadwick_boseman, samuel_l_jackson]
      chadwick_boseman.film_actor_hash['Fifth Film'] = [michael_b_jordan, jeremy_renner, samuel_l_jackson]
      samuel_l_jackson.film_actor_hash['Fifth Film'] = [michael_b_jordan, jeremy_renner, chadwick_boseman]
      samuel_l_jackson.film_actor_hash['Sixth Film'] = [gal_gadot, chris_pine, bradley_cooper]
      chris_pine.film_actor_hash['Sixth Film'] = [gal_gadot, samuel_l_jackson, bradley_cooper]
      gal_gadot.film_actor_hash['Sixth Film'] = [chris_pine, samuel_l_jackson, bradley_cooper]
      bradley_cooper.film_actor_hash['Sixth Film'] = [chris_pine, samuel_l_jackson, gal_gadot]
      result = ["Sixth Film", "Fifth Film", "Fourth Film", "Second Film", "First Film"]
      expect(bacon.find_kevin_bacon(gal_gadot)).to eq(result)
    end
  end

  describe "If more than six degrees from Kevin Bacon" do
    it "Return if more than six degrees" do
      kevin_bacon.film_actor_hash['First Film'] = [chris_hemsworth, chris_evans, robert_downey_jr]
      robert_downey_jr.film_actor_hash['First Film'] = [chris_hemsworth, chris_evans, kevin_bacon]
      chris_evans.film_actor_hash['First Film'] = [chris_hemsworth, robert_downey_jr, kevin_bacon]
      chris_hemsworth.film_actor_hash['First Film'] = [chris_evans, robert_downey_jr, kevin_bacon]
      chris_hemsworth.film_actor_hash['Second Film'] = [chris_pratt, paul_rudd, tom_holland]
      chris_pratt.film_actor_hash['Second Film'] = [chris_hemsworth, paul_rudd, tom_holland]
      paul_rudd.film_actor_hash['Second Film'] = [chris_hemsworth, chris_pratt, tom_holland]
      tom_holland.film_actor_hash['Second Film'] = [chris_hemsworth, chris_pratt, paul_rudd]
      mark_ruffalo.film_actor_hash['Third Film'] = [scarlett_johanssen, elizabeth_olsen]
      scarlett_johanssen.film_actor_hash['Third Film'] = [mark_ruffalo, elizabeth_olsen]
      elizabeth_olsen.film_actor_hash['Third Film'] = [mark_ruffalo, scarlett_johanssen]
      tom_holland.film_actor_hash['Fourth Film'] = [benedicht_cumberbatch, bree_olsen, michael_b_jordan]
      benedicht_cumberbatch.film_actor_hash['Fourth Film'] = [tom_holland, bree_olsen, michael_b_jordan]
      bree_olsen.film_actor_hash['Fourth Film'] = [tom_holland, benedicht_cumberbatch, michael_b_jordan]
      michael_b_jordan.film_actor_hash['Fourth Film'] = [tom_holland, benedicht_cumberbatch, bree_olsen]
      michael_b_jordan.film_actor_hash['Fifth Film'] = [jeremy_renner, chadwick_boseman, samuel_l_jackson]
      jeremy_renner.film_actor_hash['Fifth Film'] = [michael_b_jordan, chadwick_boseman, samuel_l_jackson]
      chadwick_boseman.film_actor_hash['Fifth Film'] = [michael_b_jordan, jeremy_renner, samuel_l_jackson]
      samuel_l_jackson.film_actor_hash['Fifth Film'] = [michael_b_jordan, jeremy_renner, chadwick_boseman]
      samuel_l_jackson.film_actor_hash['Sixth Film'] = [chris_pine, gal_gadot, bradley_cooper]
      chris_pine.film_actor_hash['Sixth Film'] = [samuel_l_jackson, gal_gadot, bradley_cooper]
      gal_gadot.film_actor_hash['Sixth Film'] = [samuel_l_jackson, chris_pine, bradley_cooper]
      bradley_cooper.film_actor_hash['Sixth Film'] = [samuel_l_jackson, chris_pine, gal_gadot]
      gal_gadot.film_actor_hash['Seventh Film'] = [patrick_stewart]
      patrick_stewart.film_actor_hash['Seventh Film'] = [gal_gadot]
      patrick_stewart.film_actor_hash['Eighth Film'] = [hugh_jackman]
      hugh_jackman.film_actor_hash['Eighth Film'] = [patrick_stewart]
      hugh_jackman.film_actor_hash['Ninth Film'] = [christian_bale]
      christian_bale.film_actor_hash['Ninth Film'] = [hugh_jackman]
      result = "Can't find connection"
      expect(bacon.find_kevin_bacon(christian_bale)).to eq(result)
    end
  end

  describe "Successfully finds no match" do
    it "Doesn't find a test node match" do
      kevin_bacon.film_actor_hash['First Film'] = [chris_hemsworth, chris_evans, robert_downey_jr]
      robert_downey_jr.film_actor_hash['First Film'] = [chris_hemsworth, chris_evans, kevin_bacon]
      chris_evans.film_actor_hash['First Film'] = [chris_hemsworth, robert_downey_jr, kevin_bacon]
      chris_hemsworth.film_actor_hash['First Film'] = [chris_evans, robert_downey_jr, kevin_bacon]
      chris_hemsworth.film_actor_hash['Second Film'] = [chris_pratt, paul_rudd, tom_holland]
      chris_pratt.film_actor_hash['Second Film'] = [chris_hemsworth, paul_rudd, tom_holland]
      paul_rudd.film_actor_hash['Second Film'] = [chris_hemsworth, chris_pratt, tom_holland]
      tom_holland.film_actor_hash['Second Film'] = [chris_hemsworth, chris_pratt, paul_rudd]
      mark_ruffalo.film_actor_hash['Third Film'] = [scarlett_johanssen, elizabeth_olsen]
      scarlett_johanssen.film_actor_hash['Third Film'] = [mark_ruffalo, elizabeth_olsen]
      elizabeth_olsen.film_actor_hash['Third Film'] = [mark_ruffalo, scarlett_johanssen]
      tom_holland.film_actor_hash['Fourth Film'] = [benedicht_cumberbatch, bree_olsen, michael_b_jordan]
      benedicht_cumberbatch.film_actor_hash['Fourth Film'] = [tom_holland, bree_olsen, michael_b_jordan]
      bree_olsen.film_actor_hash['Fourth Film'] = [tom_holland, benedicht_cumberbatch, michael_b_jordan]
      michael_b_jordan.film_actor_hash['Fourth Film'] = [tom_holland, benedicht_cumberbatch, bree_olsen]
      michael_b_jordan.film_actor_hash['Fifth Film'] = [jeremy_renner, chadwick_boseman, samuel_l_jackson]
      jeremy_renner.film_actor_hash['Fifth Film'] = [michael_b_jordan, chadwick_boseman, samuel_l_jackson]
      chadwick_boseman.film_actor_hash['Fifth Film'] = [michael_b_jordan, jeremy_renner, samuel_l_jackson]
      samuel_l_jackson.film_actor_hash['Fifth Film'] = [michael_b_jordan, jeremy_renner, chadwick_boseman]
      samuel_l_jackson.film_actor_hash['Sixth Film'] = [chris_pine, gal_gadot, bradley_cooper]
      chris_pine.film_actor_hash['Sixth Film'] = [samuel_l_jackson, gal_gadot, bradley_cooper]
      gal_gadot.film_actor_hash['Sixth Film'] = [samuel_l_jackson, chris_pine, bradley_cooper]
      bradley_cooper.film_actor_hash['Sixth Film'] = [samuel_l_jackson, chris_pine, gal_gadot]
      no_connection.film_actor_hash['Seventh Film'] = [no_actor]
      result = "Can't find connection"
      expect(bacon.find_kevin_bacon(no_connection)).to eq(result)
    end
  end
end
