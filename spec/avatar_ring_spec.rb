# frozen_string_literal: true

RSpec.describe BoringAvatarsRuby::AvatarRing do
  it "should initialize successfully" do
    avatar = BoringAvatarsRuby::AvatarRing.new({name: "Fred Spec"})
    expect(avatar.svg.nil?).to be_falsey
  end

  it "should handle a nil name parameter" do
    avatar = BoringAvatarsRuby::AvatarRing.new({name: nil})
    expect(avatar.svg.nil?).to be_falsey
  end

  it "should create an svg avatar with custom colors and size" do
    avatar = BoringAvatarsRuby::AvatarRing.new({
      name: "Grace Hopper",
      colors: ["#264653", "#2a9d8f", "#e9c46a", "#f4a261", "#e76f51"],
      size: 120
    })
    expect(avatar.svg.nil?).to be_falsey
  end

  it "should create an svg avatar with custom colors, size and square shape" do
    avatar = BoringAvatarsRuby::AvatarRing.new({
      name: "Grace Hopper",
      colors: ["#264653", "#2a9d8f", "#e9c46a", "#f4a261", "#e76f51"],
      size: 120,
      square: true
    })
    expect(avatar.svg.nil?).to be_falsey
  end
end
