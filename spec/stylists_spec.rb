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

  describe('.find') do
    it('returns a stylist by their ID number') do
      test_stylist = Stylist.new({:name => "Henry"})
      test_stylist.save()
      test_stylist2 = Stylist.new({:name => "Michelle"})
      test_stylist2.save()
      expect(Stylist.find(test_stylist2.id())).to(eq(test_stylist2))
    end
  end

  describe('#clients') do
    it('returns all of the clients for the stylist') do
      test_stylist = Stylist.new({:name => "Henry"})
      test_stylist.save()
      test_client = Client.new({:name => "Betty", :stylist_id => test_stylist.id()})
      test_client.save()
      test_client2 = Client.new({:name => "Cindy", :stylist_id => test_stylist.id()})
      test_client2.save()
      expect(test_stylist.clients()).to(eq([test_client, test_client2]))
    end
  end

  describe('#update') do
    it('lets you edit names of stylists') do
      test_stylist = Stylist.new({:name => "Henry"})
      test_stylist.save()
      test_stylist.update({:name => "Henri"})
      expect(test_stylist.name()).to(eq("Henri"))
    end
  end
end
