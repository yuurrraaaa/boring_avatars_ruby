# frozen_string_literal: true

RSpec.describe BoringAvatarsRuby::AvatarIdenticon do
  it "should initialize successfully" do
    avatar = BoringAvatarsRuby::AvatarIdenticon.new({name: "Fred Spec"})
    expect(avatar.svg.nil?).to be_falsey
  end

  it "raises an error when a nil name value is provided" do
    expect { BoringAvatarsRuby::AvatarIdenticon.new({name: nil}) }.to raise_error("name cannot be nil")
  end

  it "raises an error when a short key size is provided" do
    expect {
      BoringAvatarsRuby::AvatarIdenticon.new({name: "rspec", key: "\x00\x11\x22\x33\x44"})
    }.to raise_error("key is nil or less than 16 bytes")
  end

  it "raises an error when an invalid grid size is provided" do
    expect {
      BoringAvatarsRuby::AvatarIdenticon.new({name: "rspec", grid_size: 2})
    }.to raise_error("grid_size must be between 4 and 9")

    expect {
      BoringAvatarsRuby::AvatarIdenticon.new({name: "rspec", grid_size: 20})
    }.to raise_error("grid_size must be between 4 and 9")
  end

  it "raises an error when an invalid square size is provided" do
    expect {
      BoringAvatarsRuby::AvatarIdenticon.new({name: "rspec", square_size: -2})
    }.to raise_error("invalid square size")
  end

  it "raises an error when an invalid border size is provided" do
    expect {
      BoringAvatarsRuby::AvatarIdenticon.new({name: "rspec", border_size: -2})
    }.to raise_error("invalid border size")
  end

  it "should create an svg avatar with custom colors and size" do
    avatar = BoringAvatarsRuby::AvatarIdenticon.new({
      name: "Grace Hopper",
      colors: ["#264653", "#2a9d8f", "#e9c46a", "#f4a261", "#e76f51"],
      square_size: 75,
      grid_size: 9,
      background_color: "#4488BB"
    })
    expect(avatar.svg.nil?).to be_falsey
  end
end
