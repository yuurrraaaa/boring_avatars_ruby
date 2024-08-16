# frozen_string_literal: true

RSpec.describe BoringAvatarsRuby::Avatar do
  it "should create an avatar object using the default variant" do
    avatar = BoringAvatarsRuby::Avatar.create({name: "Fred Spec"})

    expect(avatar.class).to eq(BoringAvatarsRuby::AvatarMarble)
    expect(avatar.svg.nil?).to be_falsey
  end

  it "should create an avatar object using the default variant when an invalid variant is supplied" do
    avatar = BoringAvatarsRuby::Avatar.create({
      name: "Fred Spec",
      variant: :invalid_variant
    })

    expect(avatar.class).to eq(BoringAvatarsRuby::AvatarMarble)
    expect(avatar.svg.nil?).to be_falsey
  end

  it "should create an Identicon avatar object using the supplied options" do
    avatar = BoringAvatarsRuby::Avatar.create({
      colors: ["#264653", "#2a9d8f", "#e9c46a", "#f4a261", "#e76f51"],
      name: "Grace Hopper",
      size: 120,
      variant: :identicon
    })

    expect(avatar.class).to eq(BoringAvatarsRuby::AvatarIdenticon)
    expect(avatar.svg.nil?).to be_falsey
  end

  it "should create a Marble avatar object using the supplied options" do
    avatar = BoringAvatarsRuby::Avatar.create({
      colors: ["#264653", "#2a9d8f", "#e9c46a", "#f4a261", "#e76f51"],
      name: "Grace Hopper",
      size: 120,
      variant: :marble
    })

    expect(avatar.class).to eq(BoringAvatarsRuby::AvatarMarble)
    expect(avatar.svg.nil?).to be_falsey
  end

  it "should create a Pixel avatar object using the supplied options" do
    avatar = BoringAvatarsRuby::Avatar.create({
      colors: ["#264653", "#2a9d8f", "#e9c46a", "#f4a261", "#e76f51"],
      name: "Grace Hopper",
      size: 120,
      variant: :pixel
    })

    expect(avatar.class).to eq(BoringAvatarsRuby::AvatarPixel)
    expect(avatar.svg.nil?).to be_falsey
  end

  it "should create a Ring avatar object using the supplied options" do
    avatar = BoringAvatarsRuby::Avatar.create({
      colors: ["#264653", "#2a9d8f", "#e9c46a", "#f4a261", "#e76f51"],
      name: "Grace Hopper",
      size: 120,
      variant: :ring
    })

    expect(avatar.class).to eq(BoringAvatarsRuby::AvatarRing)
    expect(avatar.svg.nil?).to be_falsey
  end

  it "should create a Sunset avatar object using the supplied options" do
    avatar = BoringAvatarsRuby::Avatar.create({
      colors: ["#264653", "#2a9d8f", "#e9c46a", "#f4a261", "#e76f51"],
      name: "Grace Hopper",
      size: 120,
      variant: :sunset
    })

    expect(avatar.class).to eq(BoringAvatarsRuby::AvatarSunset)
    expect(avatar.svg.nil?).to be_falsey
  end

  it "should create a Beam avatar object using the supplied options" do
    avatar = BoringAvatarsRuby::Avatar.create({
      colors: ["#264653", "#2a9d8f", "#e9c46a", "#f4a261", "#e76f51"],
      name: "Grace Hopper",
      size: 120,
      variant: :beam
    })

    expect(avatar.class).to eq(BoringAvatarsRuby::AvatarBeam)
    expect(avatar.svg.nil?).to be_falsey
  end

  it "should create a Bauhaus avatar object using the supplied options" do
    avatar = BoringAvatarsRuby::Avatar.create({
      colors: ["#264653", "#2a9d8f", "#e9c46a", "#f4a261", "#e76f51"],
      name: "Grace Hopper",
      size: 120,
      variant: :bauhaus
    })

    expect(avatar.class).to eq(BoringAvatarsRuby::AvatarBauhaus)
    expect(avatar.svg.nil?).to be_falsey
  end
end
