require 'spec_helper'

describe Order do
  subject(:order) { FactoryGirl.build(:order) }
  context '#before_validation' do
    # before(:each) { @order = FactoryGirl.build(:order) }

    # after(:each) { order.save! }

    # it 'is invalid without an order number' do
    #   order2 = Order.new
    #   order2.should_not be_valid
    # end

    # it 'should validate order number is present' do
    #   order = Order.new
    #   order.save.should
    # end

    # it 'should set_defaults before validation' do
    #   order = @order
    #   order.should_receive(:set_defaults)
    #   order.save!
    # end

    # it 'should call Utils.generate_random_string' do
    #   order = @order
    #   Utils.should_receive(:generate_random_string)
    #   order.save!
    # end

    it 'should have an order number on save' do
      order.save!
      order.order_number.should_not be_nil
    end

    # before(:each) { order.save! }
  end
end