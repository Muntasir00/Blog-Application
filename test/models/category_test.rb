require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

    test "Category should be valid" do
        @category = Category.new(name: "sports")
        assert @category.valid?
    end

    test "name should be present" do
        @category = Category.new(name: " ")
        assert_not @category.valid?
    end

    test "name should be unique" do
        @category = Category.new(name: "Sports") 
        @category.save 
        @category2 = Category.new(name: "Sports")
        assert_not @category2.valid?
    end

    test "name should not be too long" do
        @category = Category.new(name: "Reea"*20)
        assert_not @category.valid?
    end 

    test "name should not be too small" do 
        @category = Category.new(name: "a")
        @category.valid?
    end

end