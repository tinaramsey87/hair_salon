require('spec_buddy')

describe(Client) do
  describe('#name') do
    it('returns the name of the client') do
          test_client = Client.new({:name => "Betty"})
          expect(test_client.name()).to(eq("Betty"))
        end
      end

  describe('#id') do
    it('returns the client id') do
      test_client = Client.new({:name => "Betty"})
      test_client.save()
      expect(test_client.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe('.all') do
    it('contains list of all clients -- is empty at first') do
      expect(Client.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('adds a client to the list of saved clients') do
      test_client = Client.new({:name => "Betty"})
      test_client.save()
      expect(Client.all()).to(eq([test_client]))
    end
  end

  describe('#==') do
    it('is the same client if the name and id are the same') do
      test_client = Client.new({:name => "Betty"})
      test_client2 = Client.new({:name => "Betty"})
      expect(test_client).to(eq(test_client2))
    end
  end
end
