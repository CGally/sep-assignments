include RSpec
require_relative 'bacon'
require_relative 'film'

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
  let (:no_actor_2) { Node.new("No Actor 2") }

  let (:first) { Film.new("First Film", true) }
  let (:second) { Film.new("Second Film", false) }
  let (:third) { Film.new("Third Film", false) }
  let (:fourth) { Film.new("Fourth Film", false) }
  let (:fifth) { Film.new("Fifth Film", false) }
  let (:sixth) { Film.new("Sixth Film", false) }
  let (:seventh) { Film.new("Seventh Film", false) }
  let (:eighth) { Film.new("Eighth Film", false) }
  let (:ninth) { Film.new("Ninth Film", false) }
  let (:tenth) { Film.new("Tenth Film", true) }


  describe "successfully finds matches" do
    it "finds Chris Pratt" do
      kevin_bacon.film_actor_hash[first] = [chris_hemsworth, chris_evans, robert_downey_jr]
      robert_downey_jr.film_actor_hash[first] = [chris_hemsworth, chris_evans, kevin_bacon]
      chris_evans.film_actor_hash[first] = [chris_hemsworth, robert_downey_jr, kevin_bacon]
      chris_hemsworth.film_actor_hash[first] = [chris_evans, robert_downey_jr, kevin_bacon]
      chris_hemsworth.film_actor_hash[second] = [chris_pratt, paul_rudd, tom_holland]
      chris_pratt.film_actor_hash[second] = [paul_rudd, chris_hemsworth, tom_holland]
      paul_rudd.film_actor_hash[second] = [chris_hemsworth, chris_pratt, tom_holland]
      tom_holland.film_actor_hash[second] = [chris_hemsworth, chris_pratt, paul_rudd]
      mark_ruffalo.film_actor_hash[third] = [scarlett_johanssen, elizabeth_olsen]
      scarlett_johanssen.film_actor_hash[third] = [mark_ruffalo, elizabeth_olsen]
      elizabeth_olsen.film_actor_hash[third] = [mark_ruffalo, scarlett_johanssen]
      tom_holland.film_actor_hash[fourth] = [benedicht_cumberbatch, bree_olsen, michael_b_jordan]
      benedicht_cumberbatch.film_actor_hash[fourth] = [tom_holland, bree_olsen, michael_b_jordan]
      bree_olsen.film_actor_hash[fourth] = [tom_holland, benedicht_cumberbatch, michael_b_jordan]
      michael_b_jordan.film_actor_hash[fourth] = [tom_holland, benedicht_cumberbatch, bree_olsen]
      michael_b_jordan.film_actor_hash[fifth] = [jeremy_renner, chadwick_boseman, samuel_l_jackson]
      jeremy_renner.film_actor_hash[fifth] = [michael_b_jordan, chadwick_boseman, samuel_l_jackson]
      chadwick_boseman.film_actor_hash[fifth] = [michael_b_jordan, jeremy_renner, samuel_l_jackson]
      samuel_l_jackson.film_actor_hash[fifth] = [michael_b_jordan, jeremy_renner, chadwick_boseman]
      samuel_l_jackson.film_actor_hash[sixth] = [gal_gadot, chris_pine, bradley_cooper]
      chris_pine.film_actor_hash[sixth] = [gal_gadot, samuel_l_jackson, bradley_cooper]
      gal_gadot.film_actor_hash[sixth] = [chris_pine, samuel_l_jackson, bradley_cooper]
      bradley_cooper.film_actor_hash[sixth] = [chris_pine, samuel_l_jackson, gal_gadot]
      result = ["Second Film", "First Film"]
      expect(bacon.find_kevin_bacon(chris_pratt)).to eq(result)
    end

    it "finds Michael B Jordan" do
      kevin_bacon.film_actor_hash[first] = [chris_hemsworth, chris_evans, robert_downey_jr]
      robert_downey_jr.film_actor_hash[first] = [chris_hemsworth, chris_evans, kevin_bacon]
      chris_evans.film_actor_hash[first] = [chris_hemsworth, robert_downey_jr, kevin_bacon]
      chris_hemsworth.film_actor_hash[first] = [chris_evans, robert_downey_jr, kevin_bacon]
      chris_hemsworth.film_actor_hash[second] = [chris_pratt, paul_rudd, tom_holland]
      chris_pratt.film_actor_hash[second] = [chris_hemsworth, paul_rudd, tom_holland]
      paul_rudd.film_actor_hash[second] = [chris_hemsworth, chris_pratt, tom_holland]
      tom_holland.film_actor_hash[second] = [chris_hemsworth, chris_pratt, paul_rudd]
      mark_ruffalo.film_actor_hash[third] = [scarlett_johanssen, elizabeth_olsen]
      scarlett_johanssen.film_actor_hash[third] = [mark_ruffalo, elizabeth_olsen]
      elizabeth_olsen.film_actor_hash[third] = [mark_ruffalo, scarlett_johanssen]
      tom_holland.film_actor_hash[fourth] = [benedicht_cumberbatch, bree_olsen, michael_b_jordan]
      benedicht_cumberbatch.film_actor_hash[fourth] = [tom_holland, bree_olsen, michael_b_jordan]
      bree_olsen.film_actor_hash[fourth] = [tom_holland, benedicht_cumberbatch, michael_b_jordan]
      michael_b_jordan.film_actor_hash[fourth] = [tom_holland, benedicht_cumberbatch, bree_olsen]
      michael_b_jordan.film_actor_hash[fifth] = [samuel_l_jackson, jeremy_renner, chadwick_boseman]
      jeremy_renner.film_actor_hash[fifth] = [michael_b_jordan, chadwick_boseman, samuel_l_jackson]
      chadwick_boseman.film_actor_hash[fifth] = [michael_b_jordan, jeremy_renner, samuel_l_jackson]
      samuel_l_jackson.film_actor_hash[fifth] = [michael_b_jordan, jeremy_renner, chadwick_boseman]
      samuel_l_jackson.film_actor_hash[sixth] = [gal_gadot, chris_pine, bradley_cooper]
      chris_pine.film_actor_hash[sixth] = [gal_gadot, samuel_l_jackson, bradley_cooper]
      gal_gadot.film_actor_hash[sixth] = [chris_pine, samuel_l_jackson, bradley_cooper]
      bradley_cooper.film_actor_hash[sixth] = [chris_pine, samuel_l_jackson, gal_gadot]
      result = ["Fourth Film", "Second Film", "First Film"]
      expect(bacon.find_kevin_bacon(michael_b_jordan)).to eq(result)
    end

    it "finds Gal Gadot" do
      kevin_bacon.film_actor_hash[first] = [chris_hemsworth, chris_evans, robert_downey_jr]
      robert_downey_jr.film_actor_hash[first] = [chris_hemsworth, chris_evans, kevin_bacon]
      chris_evans.film_actor_hash[first] = [chris_hemsworth, robert_downey_jr, kevin_bacon]
      chris_hemsworth.film_actor_hash[first] = [chris_evans, robert_downey_jr, kevin_bacon]
      chris_hemsworth.film_actor_hash[second] = [chris_pratt, paul_rudd, tom_holland]
      chris_pratt.film_actor_hash[second] = [chris_hemsworth, paul_rudd, tom_holland]
      paul_rudd.film_actor_hash[second] = [chris_hemsworth, chris_pratt, tom_holland]
      tom_holland.film_actor_hash[second] = [chris_hemsworth, chris_pratt, paul_rudd]
      mark_ruffalo.film_actor_hash[third] = [scarlett_johanssen, elizabeth_olsen]
      scarlett_johanssen.film_actor_hash[third] = [mark_ruffalo, elizabeth_olsen]
      elizabeth_olsen.film_actor_hash[third] = [mark_ruffalo, scarlett_johanssen]
      tom_holland.film_actor_hash[fourth] = [benedicht_cumberbatch, bree_olsen, michael_b_jordan]
      benedicht_cumberbatch.film_actor_hash[fourth] = [tom_holland, bree_olsen, michael_b_jordan]
      bree_olsen.film_actor_hash[fourth] = [tom_holland, benedicht_cumberbatch, michael_b_jordan]
      michael_b_jordan.film_actor_hash[fourth] = [tom_holland, benedicht_cumberbatch, bree_olsen]
      michael_b_jordan.film_actor_hash[fifth] = [jeremy_renner, chadwick_boseman, samuel_l_jackson]
      jeremy_renner.film_actor_hash[fifth] = [michael_b_jordan, chadwick_boseman, samuel_l_jackson]
      chadwick_boseman.film_actor_hash[fifth] = [michael_b_jordan, jeremy_renner, samuel_l_jackson]
      samuel_l_jackson.film_actor_hash[fifth] = [michael_b_jordan, jeremy_renner, chadwick_boseman]
      samuel_l_jackson.film_actor_hash[sixth] = [gal_gadot, chris_pine, bradley_cooper]
      chris_pine.film_actor_hash[sixth] = [gal_gadot, samuel_l_jackson, bradley_cooper]
      gal_gadot.film_actor_hash[sixth] = [chris_pine, samuel_l_jackson, bradley_cooper]
      bradley_cooper.film_actor_hash[sixth] = [chris_pine, samuel_l_jackson, gal_gadot]
      result = ["Sixth Film", "Fifth Film", "Fourth Film", "Second Film", "First Film"]
      expect(bacon.find_kevin_bacon(gal_gadot)).to eq(result)
    end
  end

  describe "If more than six degrees from Kevin Bacon" do
    it "Return if more than six degrees" do
      kevin_bacon.film_actor_hash[first] = [chris_hemsworth, chris_evans, robert_downey_jr]
      robert_downey_jr.film_actor_hash[first] = [chris_hemsworth, chris_evans, kevin_bacon]
      chris_evans.film_actor_hash[first] = [chris_hemsworth, robert_downey_jr, kevin_bacon]
      chris_hemsworth.film_actor_hash[first] = [chris_evans, robert_downey_jr, kevin_bacon]
      chris_hemsworth.film_actor_hash[second] = [chris_pratt, paul_rudd, tom_holland]
      chris_pratt.film_actor_hash[second] = [chris_hemsworth, paul_rudd, tom_holland]
      paul_rudd.film_actor_hash[second] = [chris_hemsworth, chris_pratt, tom_holland]
      tom_holland.film_actor_hash[second] = [chris_hemsworth, chris_pratt, paul_rudd]
      mark_ruffalo.film_actor_hash[third] = [scarlett_johanssen, elizabeth_olsen]
      scarlett_johanssen.film_actor_hash[third] = [mark_ruffalo, elizabeth_olsen]
      elizabeth_olsen.film_actor_hash[third] = [mark_ruffalo, scarlett_johanssen]
      tom_holland.film_actor_hash[fourth] = [benedicht_cumberbatch, bree_olsen, michael_b_jordan]
      benedicht_cumberbatch.film_actor_hash[fourth] = [tom_holland, bree_olsen, michael_b_jordan]
      bree_olsen.film_actor_hash[fourth] = [tom_holland, benedicht_cumberbatch, michael_b_jordan]
      michael_b_jordan.film_actor_hash[fourth] = [tom_holland, benedicht_cumberbatch, bree_olsen]
      michael_b_jordan.film_actor_hash[fifth] = [jeremy_renner, chadwick_boseman, samuel_l_jackson]
      jeremy_renner.film_actor_hash[fifth] = [michael_b_jordan, chadwick_boseman, samuel_l_jackson]
      chadwick_boseman.film_actor_hash[fifth] = [michael_b_jordan, jeremy_renner, samuel_l_jackson]
      samuel_l_jackson.film_actor_hash[fifth] = [michael_b_jordan, jeremy_renner, chadwick_boseman]
      samuel_l_jackson.film_actor_hash[sixth] = [chris_pine, gal_gadot, bradley_cooper]
      chris_pine.film_actor_hash[sixth] = [samuel_l_jackson, gal_gadot, bradley_cooper]
      gal_gadot.film_actor_hash[sixth] = [samuel_l_jackson, chris_pine, bradley_cooper]
      bradley_cooper.film_actor_hash[sixth] = [samuel_l_jackson, chris_pine, gal_gadot]
      gal_gadot.film_actor_hash[seventh] = [patrick_stewart]
      patrick_stewart.film_actor_hash[seventh] = [gal_gadot]
      patrick_stewart.film_actor_hash[eighth] = [hugh_jackman]
      hugh_jackman.film_actor_hash[eighth] = [patrick_stewart]
      hugh_jackman.film_actor_hash[ninth] = [christian_bale]
      christian_bale.film_actor_hash[ninth] = [hugh_jackman]
      result = "Kevin Bacon is more than six degrees away"
      expect(bacon.find_kevin_bacon(christian_bale)).to eq(result)
    end
  end

  describe "Successfully finds no match" do
    it "Doesn't find a test node match" do
      kevin_bacon.film_actor_hash[first] = [chris_hemsworth, chris_evans, robert_downey_jr]
      robert_downey_jr.film_actor_hash[first] = [chris_hemsworth, chris_evans, kevin_bacon]
      chris_evans.film_actor_hash[first] = [chris_hemsworth, robert_downey_jr, kevin_bacon]
      chris_hemsworth.film_actor_hash[first] = [chris_evans, robert_downey_jr, kevin_bacon]
      chris_hemsworth.film_actor_hash[second] = [chris_pratt, paul_rudd, tom_holland]
      chris_pratt.film_actor_hash[second] = [chris_hemsworth, paul_rudd, tom_holland]
      paul_rudd.film_actor_hash[second] = [chris_hemsworth, chris_pratt, tom_holland]
      tom_holland.film_actor_hash[second] = [chris_hemsworth, chris_pratt, paul_rudd]
      mark_ruffalo.film_actor_hash[third] = [scarlett_johanssen, elizabeth_olsen]
      scarlett_johanssen.film_actor_hash[third] = [mark_ruffalo, elizabeth_olsen]
      elizabeth_olsen.film_actor_hash[third] = [mark_ruffalo, scarlett_johanssen]
      tom_holland.film_actor_hash[fourth] = [benedicht_cumberbatch, bree_olsen, michael_b_jordan]
      benedicht_cumberbatch.film_actor_hash[fourth] = [tom_holland, bree_olsen, michael_b_jordan]
      bree_olsen.film_actor_hash[fourth] = [tom_holland, benedicht_cumberbatch, michael_b_jordan]
      michael_b_jordan.film_actor_hash[fourth] = [tom_holland, benedicht_cumberbatch, bree_olsen]
      michael_b_jordan.film_actor_hash[fifth] = [jeremy_renner, chadwick_boseman, samuel_l_jackson]
      jeremy_renner.film_actor_hash[fifth] = [michael_b_jordan, chadwick_boseman, samuel_l_jackson]
      chadwick_boseman.film_actor_hash[fifth] = [michael_b_jordan, jeremy_renner, samuel_l_jackson]
      samuel_l_jackson.film_actor_hash[fifth] = [michael_b_jordan, jeremy_renner, chadwick_boseman]
      samuel_l_jackson.film_actor_hash[sixth] = [chris_pine, gal_gadot, bradley_cooper]
      chris_pine.film_actor_hash[sixth] = [samuel_l_jackson, gal_gadot, bradley_cooper]
      gal_gadot.film_actor_hash[sixth] = [samuel_l_jackson, chris_pine, bradley_cooper]
      bradley_cooper.film_actor_hash[sixth] = [samuel_l_jackson, chris_pine, gal_gadot]
      no_actor_2.film_actor_hash[seventh] = [no_actor]
      no_actor.film_actor_hash[seventh] = [no_actor_2]
      no_connection.film_actor_hash[eighth] = [no_actor]
      result = "Can't find connection"
      expect(bacon.find_kevin_bacon(no_connection)).to eq(result)
    end
  end

  describe "Stops at first Kevin Bacon movie" do
    it "Once Kevin is found it stops" do
      kevin_bacon.film_actor_hash[first] = [chris_hemsworth, chris_evans, robert_downey_jr]
      robert_downey_jr.film_actor_hash[first] = [chris_hemsworth, chris_evans, kevin_bacon]
      chris_evans.film_actor_hash[first] = [chris_hemsworth, robert_downey_jr, kevin_bacon]
      chris_hemsworth.film_actor_hash[first] = [chris_evans, robert_downey_jr, kevin_bacon]
      chris_hemsworth.film_actor_hash[second] = [chris_pratt, paul_rudd, tom_holland]
      chris_pratt.film_actor_hash[second] = [chris_hemsworth, paul_rudd, tom_holland]
      paul_rudd.film_actor_hash[second] = [chris_hemsworth, chris_pratt, tom_holland]
      tom_holland.film_actor_hash[second] = [chris_hemsworth, chris_pratt, paul_rudd]
      mark_ruffalo.film_actor_hash[third] = [scarlett_johanssen, elizabeth_olsen]
      scarlett_johanssen.film_actor_hash[third] = [mark_ruffalo, elizabeth_olsen]
      elizabeth_olsen.film_actor_hash[third] = [mark_ruffalo, scarlett_johanssen]
      tom_holland.film_actor_hash[tenth] = [benedicht_cumberbatch, kevin_bacon, michael_b_jordan]
      benedicht_cumberbatch.film_actor_hash[tenth] = [tom_holland, kevin_bacon, michael_b_jordan]
      kevin_bacon.film_actor_hash[tenth] = [tom_holland, benedicht_cumberbatch, michael_b_jordan]
      michael_b_jordan.film_actor_hash[tenth] = [tom_holland, benedicht_cumberbatch, kevin_bacon]
      michael_b_jordan.film_actor_hash[fifth] = [jeremy_renner, chadwick_boseman, samuel_l_jackson]
      jeremy_renner.film_actor_hash[fifth] = [michael_b_jordan, chadwick_boseman, samuel_l_jackson]
      chadwick_boseman.film_actor_hash[fifth] = [michael_b_jordan, jeremy_renner, samuel_l_jackson]
      samuel_l_jackson.film_actor_hash[fifth] = [michael_b_jordan, jeremy_renner, chadwick_boseman]
      samuel_l_jackson.film_actor_hash[sixth] = [chris_pine, gal_gadot, bradley_cooper]
      chris_pine.film_actor_hash[sixth] = [samuel_l_jackson, gal_gadot, bradley_cooper]
      gal_gadot.film_actor_hash[sixth] = [samuel_l_jackson, chris_pine, bradley_cooper]
      bradley_cooper.film_actor_hash[sixth] = [samuel_l_jackson, chris_pine, gal_gadot]
      gal_gadot.film_actor_hash[seventh] = [patrick_stewart]
      patrick_stewart.film_actor_hash[seventh] = [gal_gadot]
      result = ["Seventh Film", "Sixth Film", "Fifth Film", "Tenth Film"]
      expect(bacon.find_kevin_bacon(patrick_stewart)).to eq(result)
    end
  end
end
