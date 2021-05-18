require 'test_helper'

class ChannelTest < ActiveSupport::TestCase
  test "Can not save without name" do
    channel = Channel.new()
    channel.save()
    refute channel.valid?
  end

  test "Can't save channel name that is too small" do
    channel = Channel.new({name: "nam"})
    channel.save()
    refute channel.valid?
  end

  test "Can't save channel name that is too long" do
    channel = Channel.new({name: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"})
    channel.save()
    refute channel.valid?
  end

  test "Can't save channel's with same name" do
    channel1 = Channel.new({name: "name"})
    channel1.save
    assert channel1.valid?
    channel2 = Channel.new({name: "name"})
    channel2.save
    refute channel2.valid?
  end

  test "Can save valid channel" do
    channel = Channel.new({name: "name"})
    channel.save()
    assert channel.valid?
  end
end
