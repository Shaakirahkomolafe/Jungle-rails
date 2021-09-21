require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should be created with a password and password confirmation' do
      @user = User.new(email:'test@test.com',password: 'ghijhkhdhhf', password_confirmation: 'ghijhkhdhhf', name: 'something')
      expect(@user).to be_valid
    end
    it 'should have a unique email' do
      @user = User.new(email: 'test@test.com', password: 'dhkkjhde', name:'something')
      expect(@user).to be_valid
    end
    it 'should not be capitalized' do
      @user = User.new(email: 'TEST@TEST.com', password: 'passsword')
      expect(@user).to_not be_valid  
    end
    it 'should have a password length greater than 8' do
      @user = User.new(email: 'test@test.com', password: 'passtu')
      expect(@user).to_not be_valid
    end
  end
  describe '.authenticate_with_credentials' do
    # examples for this class method here
    it 'should authenticates email and password' do
    @user = User.authenticate_with_credentials('test@test.com', 'password')
    expect(@user).to_not be_present
    end
    it 'should login successfully with white spaces' do
      @user = User.authenticate_with_credentials(' damolakomolafe.dk@gmail.com ', 'password')
      expect(@user).to be true
    end
  end
  end
