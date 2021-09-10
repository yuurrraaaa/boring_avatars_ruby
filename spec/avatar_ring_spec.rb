# frozen_string_literal: true

RSpec.describe BoringAvatarsRuby::AvatarRing do
  it "should initialize successfully" do
    avatar = BoringAvatarsRuby::AvatarRing.new({name: "Fred Spec"})
    expect(avatar.svg.nil?).to be_falsey
  end

  it "should handle a nil name parameter" do
    avatar = BoringAvatarsRuby::AvatarRing.new({name: nil})
    expect(avatar.svg.nil?).to be_falsey
    avatar.save("tmp/ring_blank_spec.svg")
    expect(File.exist?("tmp/ring_blank_spec.svg")).to be_truthy
  end

  it "should save svg avatar to a given file name" do
    avatar = BoringAvatarsRuby::AvatarRing.new({name: "Fred Spec"})
    expect(avatar.svg.nil?).to be_falsey
    avatar.save("tmp/ring_fred_spec.svg")
    expect(File.exist?("tmp/ring_fred_spec.svg")).to be_truthy
  end

  it "should save svg avatar with custom colors and size" do
    avatar = BoringAvatarsRuby::AvatarRing.new({
      name: "Grace Hopper",
      colors: ["#264653", "#2a9d8f", "#e9c46a", "#f4a261", "#e76f51"],
      size: 120
    })
    expect(avatar.svg.nil?).to be_falsey
    avatar.save("tmp/ring_grace_spec.svg")
    expect(File.exist?("tmp/ring_grace_spec.svg")).to be_truthy
  end

  it "should save svg avatar with custom colors, size and square shape" do
    avatar = BoringAvatarsRuby::AvatarRing.new({
      name: "Grace Hopper",
      colors: ["#264653", "#2a9d8f", "#e9c46a", "#f4a261", "#e76f51"],
      size: 120,
      square: true
    })
    expect(avatar.svg.nil?).to be_falsey
    avatar.save("tmp/ring_grace_square_spec.svg")
    expect(File.exist?("tmp/ring_grace_square_spec.svg")).to be_truthy
  end
end
