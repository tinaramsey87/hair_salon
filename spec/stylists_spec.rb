require('spec_buddy')

describe(Stylist) do

  describe('#name') do
    it('returns the stylists name') do
      test_stylist = Stylist.new({:name => "Henry"})
      expect(test_stylist.name).to(eq("Henry"))
    end
  end

  describe('#id') do
    it('sets a stylists id when you save a new stylist') do
      test_stylist = Stylist.new({:name => "Henry"})
      test_stylist.save()
      expect(test_stylist.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe('.all') do
    it('returns list of all stylists -- is empty at first') do
      expect(Stylist.all).to(eq([]))
    end
  end

  describe('#save') do
    it('lets you save a new stylist to the stylists table') do
      test_stylist = Stylist.new({:name => "Henry"})
      test_stylist.save()
      expect(Stylist.all()).to(eq([test_stylist]))
    end
  end

  describe('#==') do
    it('is the same stylist if the name and id are the same') do
      test_stylist = Stylist.new({:name => "Henry"})
      test_stylist2 = Stylist.new({:name => "Henry"})
      expect(test_stylist).to(eq(test_stylist2))
    end
  end
end
