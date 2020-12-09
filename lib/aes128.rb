class Aes128
  def self.decrypt(session_key, iv, encrypted_data)
    cipher = OpenSSL::Cipher::AES.new(128, :CBC)
    cipher.decrypt
    sk_code = Base64.decode64(session_key)
    ed_code = Base64.decode64(encrypted_data)
    iv_code = Base64.decode64(iv)
    cipher.key = sk_code
    cipher.iv = iv_code
    cipher.update(ed_code) << cipher.final
  end
end