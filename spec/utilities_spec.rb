RSpec.describe BoringAvatarsRuby::Utilities do
  describe "get_number" do
    it "returns the sum of chars in a string" do
      expect(BoringAvatarsRuby::Utilities.get_number("ABC")).to eq("A".ord + "B".ord + "C".ord)
    end
  end

  describe "get_random_color" do
    it "returns the expected color" do
      number = BoringAvatarsRuby::Utilities.get_number("ABC")
      colors = ["red", "blue", "green"]

      color = BoringAvatarsRuby::Utilities.get_random_color(
        number,
        colors,
        colors.size
      )
      expect(color).to eq("red")

      color = BoringAvatarsRuby::Utilities.get_random_color(
        number + 1,
        colors,
        colors.size
      )
      expect(color).to eq("blue")

      color = BoringAvatarsRuby::Utilities.get_random_color(
        number + 2,
        colors,
        colors.size
      )
      expect(color).to eq("green")

      color = BoringAvatarsRuby::Utilities.get_random_color(
        number + 3,
        colors,
        colors.size
      )
      expect(color).to eq("red")
    end
  end
end
