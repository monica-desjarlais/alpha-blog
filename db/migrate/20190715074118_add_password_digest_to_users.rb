class AddPasswordDigestToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :password_digest, :string  #The has_secure_password method encrypts passwords by hashing and salting the passwords
                                                 # and generate 'password_digest', of type string
  end
end
