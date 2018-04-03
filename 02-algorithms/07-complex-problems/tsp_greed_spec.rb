include RSpec

require_relative 'city'
require_relative 'tsp_greed'

RSpec.describe TravelingSalesman, type: Class do
  let (:traveling_salesman) {TravelingSalesman.new}

  let (:boston) { City.new('Boston') }
  let (:hartford) { City.new('Hartford') }
  let (:new_york) { City.new('New York') }
  let (:springfield) { City.new('Springfield') }
  let (:providence) { City.new('Providence') }
  let (:new_haven) { City.new('New Haven') }

  before do
    boston.neighbors= {  hartford    =>  101,
                         new_york    =>  215,
                         new_haven   =>  138,
                         springfield =>  92,
                         providence  =>  51
                       }
    hartford.neighbors = {  boston      =>  101,
                            new_york    =>  116,
                            new_haven   =>  38,
                            springfield =>  28,
                            providence  =>  86
                          }
    new_york.neighbors = {  hartford    =>  116,
                            boston      =>  215,
                            new_haven   =>  80,
                            springfield =>  143,
                            providence  =>  185
                          }
    springfield.neighbors = {  hartford   =>  28,
                                boston     =>  92,
                                new_haven  =>  64,
                                new_york   =>  143,
                                providence =>  85
                             }
    providence.neighbors = {  hartford    =>  86,
                              boston      =>  51,
                              new_haven   =>  103,
                              new_york    =>  185,
                              springfield =>  85
                            }
    new_haven.neighbors = {  hartford    =>  38,
                             boston      =>  138,
                             new_york    =>  80,
                             springfield =>  64,
                             providence  =>  103
                           }
  end

  describe "#nearest_neighbor" do
    it "finds the nearest neigbor of Boston" do
      expect(traveling_salesman.nearest_neighbor(boston)).to eq(providence)
    end
    it "finds the nearest neigbor of New Haven" do
      expect(traveling_salesman.nearest_neighbor(new_haven)).to eq(hartford)
    end
  end

  describe "#travel" do
    it "finds path by going to closest unvisited city" do
      expect(traveling_salesman.travel(boston)).to eq(["Boston", "Providence", "Springfield", "Hartford", "New Haven", "New York"])
    end
    it "finds path by going to closest unvisited city" do
      expect(traveling_salesman.travel(hartford)).to eq(["Hartford", "Springfield", "New Haven", "New York", "Providence", "Boston"])
    end
  end
end
