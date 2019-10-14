require_relative 'cryptographer'
require 'minitest/autorun'
# Test file for Cryptographer class
class CryptographerTest < Minitest::Test
  describe 'Encrypt/decrypt using ROT-13 algorithm' do
    before do
      @cryptographer = Cryptographer.new
    end

    describe 'encrypt messages' do
      it 'must encrypt the sentance' do
        output = @cryptographer.rot_algortithm('MYA')
        assert_equal 'ZLN', output
      end

      it 'must encrypt the sentance with 1 space' do
        output = @cryptographer.rot_algortithm('My Message')
        assert_equal 'Zl Zrffntr', output
      end

      it 'must encrypt the sentance with several spaces' do
        output = @cryptographer.rot_algortithm('This is my secret')
        assert_equal 'Guvf vf zl frperg', output
      end

      it 'must encrypt the sentance with number' do
        output = @cryptographer.rot_algortithm('MY123')
        assert_equal 'ZL123', output
      end

      it 'must be case sensitive' do
        output = @cryptographer.rot_algortithm('MYmyMab')
        assert_equal 'ZLzlZno', output
      end

      it 'must decrypt the sentance with several spaces' do
        output = @cryptographer.rot_algortithm('Guvf vf zl frperg')
        assert_equal 'This is my secret', output
      end
    end
  end
end
