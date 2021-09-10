# frozen_string_literal: true

RSpec.describe BoringAvatarsRuby::AvatarPixel do
  it "should initialize successfully" do
    avatar = BoringAvatarsRuby::AvatarPixel.new({name: "Fred Spec"})
    expect(avatar.svg.nil?).to be_falsey
  end

  it "should handle a nil name parameter" do
    avatar = BoringAvatarsRuby::AvatarPixel.new({name: nil})
    expect(avatar.svg.nil?).to be_falsey
    avatar.save("tmp/pixel_blank_spec.svg")
    expect(File.exist?("tmp/pixel_blank_spec.svg")).to be_truthy
  end

  it "should save svg avatar to a given file name" do
    avatar = BoringAvatarsRuby::AvatarPixel.new({name: "Fred Spec"})
    expect(avatar.svg.nil?).to be_falsey
    avatar.save("tmp/pixel_fred_spec.svg")
    expect(File.exist?("tmp/pixel_fred_spec.svg")).to be_truthy
  end

  it "should save svg avatar with custom colors and size" do
    avatar = BoringAvatarsRuby::AvatarPixel.new({
      name: "Grace Hopper",
      colors: ["#264653", "#2a9d8f", "#e9c46a", "#f4a261", "#e76f51"],
      size: 120
    })
    expect(avatar.svg.nil?).to be_falsey
    avatar.save("tmp/pixel_grace_spec.svg")
    expect(File.exist?("tmp/pixel_grace_spec.svg")).to be_truthy
  end

  it "should save svg avatar with custom colors, size and square shape" do
    avatar = BoringAvatarsRuby::AvatarPixel.new({
      name: "Grace Hopper",
      colors: ["#264653", "#2a9d8f", "#e9c46a", "#f4a261", "#e76f51"],
      size: 120,
      square: true
    })
    expect(avatar.svg.nil?).to be_falsey
    avatar.save("tmp/pixel_grace_square_spec.svg")
    expect(File.exist?("tmp/pixel_grace_square_spec.svg")).to be_truthy
  end
end
