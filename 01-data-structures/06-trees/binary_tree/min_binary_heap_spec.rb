include RSpec

require_relative 'min_binary_heap'

RSpec.describe MinBinaryHeap, type: Class do
  let (:pacific_rim) { Node.new("Pacific Rim", 72) }
  let (:braveheart) { Node.new("Braveheart", 78) }
  let (:jedi) { Node.new("Star Wars: Return of the Jedi", 80) }
  let (:donnie) { Node.new("Donnie Darko", 85) }
  let (:inception) { Node.new("Inception", 86) }
  let (:matrix) { Node.new("The Matrix", 87) }
  let (:district) { Node.new("District 9", 90) }
  let (:shawshank) { Node.new("The Shawshank Redemption", 91) }
  let (:martian) { Node.new("The Martian", 92) }
  let (:hope) { Node.new("Star Wars: A New Hope", 93) }
  let (:empire) { Node.new("Star Wars: The Empire Strikes Back", 94) }
  let (:mad_max_2) { Node.new("Mad Max 2: The Road Warrior", 98) }
  let (:tree) { MinBinaryHeap.new(braveheart) }

  describe "#insert(data)" do
    it "properly inserts a new node as the root" do
      tree.insert(donnie)
      tree.insert(pacific_rim)
      expect(tree.heap[0].title).to eq "Pacific Rim"
      # expect(tree.heap[0].left.title).to eq "Donnie Darko"
    end

    it "properly inserts a new node as a left child" do
      tree.insert(jedi)
      expect(tree.heap[1].title).to eq "Star Wars: Return of the Jedi"
      # expect(tree.heap[0].left.title).to eq "Star Wars: Return of the Jedi"
    end

    it "properly inserts a new node as a right child" do
      tree.insert(jedi)
      tree.insert(donnie)
      expect(tree.heap[2].title).to eq "Donnie Darko"
      # expect(tree.heap[0].right.title).to eq "Donnie Darko"
    end

    it "properly inserts a new node as a left-left child" do
      tree.insert(inception)
      tree.insert(donnie)
      tree.insert(jedi)
      expect(tree.heap[3].title).to eq "Inception"
      # expect(tree.heap[1].left.title).to eq "Inception"
    end

    it "properly inserts a new node as a left-right child" do
      tree.insert(inception)
      tree.insert(donnie)
      tree.insert(jedi)
      tree.insert(matrix)
      expect(tree.heap[4].title).to eq "The Matrix"
      # expect(tree.heap[1].right.title).to eq "The Matrix"
    end

    it "properly inserts a new node as a right-left child" do
      tree.insert(inception)
      tree.insert(district)
      tree.insert(donnie)
      tree.insert(jedi)
      tree.insert(matrix)
      expect(tree.heap[5].title).to eq "District 9"
      # expect(tree.heap[2].left.title).to eq "District 9"
    end

    it "properly inserts a new node as a right-right child" do
      tree.insert(inception)
      tree.insert(district)
      tree.insert(donnie)
      tree.insert(jedi)
      tree.insert(matrix)
      tree.insert(empire)
      expect(tree.heap[6].title).to eq "Star Wars: The Empire Strikes Back"
      # expect(tree.heap[2].right.title).to eq "Star Wars: The Empire Strikes Back"
    end
  end

  describe "#find(data)" do
    it "handles nil gracefully" do
      tree.insert(inception)
      tree.insert(district)
      expect(tree.find(nil)).to eq nil
    end

    it "properly finds a left node" do
      tree.insert(jedi)
      expect(tree.find(jedi.title).title).to eq "Star Wars: Return of the Jedi"
    end

    it "properly finds a right node" do
      tree.insert(jedi)
      tree.insert(donnie)
      expect(tree.find(donnie.title).title).to eq "Donnie Darko"
    end

    it "properly finds a left-left node" do
      tree.insert(inception)
      tree.insert(donnie)
      tree.insert(jedi)
      expect(tree.find(inception.title).title).to eq "Inception"
    end

    it "properly finds a left-right node" do
      tree.insert(inception)
      tree.insert(donnie)
      tree.insert(jedi)
      tree.insert(matrix)
      expect(tree.find(matrix.title).title).to eq "The Matrix"
    end

    it "properly finds a right-left node" do
      tree.insert(inception)
      tree.insert(district)
      tree.insert(donnie)
      tree.insert(jedi)
      tree.insert(matrix)
      expect(tree.find(matrix.title).title).to eq "The Matrix"
    end

    it "properly finds a right-right node" do
      tree.insert(inception)
      tree.insert(district)
      tree.insert(donnie)
      tree.insert(jedi)
      tree.insert(matrix)
      tree.insert(empire)
      expect(tree.find(empire.title).title).to eq "Star Wars: The Empire Strikes Back"
    end
  end

  describe "#delete(data)" do
    it "handles nil gracefully" do
      expect(tree.delete(nil)).to eq nil
    end

    it "properly deletes a left node" do
      tree.insert(jedi)
      tree.delete(jedi.title)
      expect(tree.find(jedi.title)).to be_nil
    end

    it "properly deletes a right node" do
      tree.insert(jedi)
      tree.insert(donnie)
      tree.delete(donnie.title)
      expect(tree.find(donnie.title)).to be_nil
    end

    it "properly deletes a left-left node" do
      tree.insert(inception)
      tree.insert(donnie)
      tree.insert(jedi)
      tree.delete(inception.title)
      expect(tree.find(inception.title)).to be_nil
    end

    it "properly deletes a left-right node" do
      tree.insert(inception)
      tree.insert(donnie)
      tree.insert(jedi)
      tree.insert(matrix)
      tree.delete(matrix.title)
      expect(tree.find(matrix.title)).to be_nil
    end

    it "properly deletes a right-left node" do
      tree.insert(inception)
      tree.insert(district)
      tree.insert(donnie)
      tree.insert(jedi)
      tree.insert(matrix)
      tree.delete(matrix.title)
      expect(tree.find(matrix.title)).to be_nil
    end

    it "properly deletes a right-right node" do
      tree.insert(inception)
      tree.insert(district)
      tree.insert(donnie)
      tree.insert(jedi)
      tree.insert(matrix)
      tree.insert(empire)
      tree.delete(empire.title)
      expect(tree.find(empire.title)).to be_nil
    end
  end

  describe "#print" do
    specify {
      expected_output = "Pacific Rim: 72\nStar Wars: Return of the Jedi: 80\nBraveheart: 78\nDonnie Darko: 85\nMad Max 2: The Road Warrior: 98\nStar Wars: The Empire Strikes Back: 94\nInception: 86\nThe Martian: 92\nThe Matrix: 87\n"
      tree.insert(donnie)
      tree.insert(empire)
      tree.insert(jedi)
      tree.insert(mad_max_2)
      tree.insert(inception)
      tree.insert(pacific_rim)
      tree.insert(martian)
      tree.insert(matrix)
      expect { tree.print }.to output(expected_output).to_stdout
    }
  end
end
