{"changed":true,"filter":false,"title":"users_test.rb","tooltip":"/test/models/users_test.rb","value":"require 'test_helper'\n\nclass UserTest < ActiveSupport::TestCase\n\n  def setup\n    @user = User.new(name: \"Example User\", email: \"user@example.com\",\n                     password: \"foobar\", password_confirmation: \"foobar\")\n  end\n\n  test \"should be valid\" do\n    assert @user.valid?\n  end\n\n  test \"name should be present\" do\n    @user.name = \"     \"\n    assert_not @user.valid?\n  end\n  \n  test \"email should be present\" do\n    @user.email = \"     \"\n    assert_not @user.valid?\n  end\n  \n  test \"name should not be too long\" do\n    @user.name = \"a\" * 51\n    assert_not @user.valid?\n  end\n\n  test \"email should not be too long\" do\n    @user.email = \"a\" * 256\n    assert_not @user.valid?\n  end\n  \n  test \"email validation should accept valid addresses\" do\n    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org\n                         first.last@foo.jp alice+bob@baz.cn]\n    valid_addresses.each do |valid_address|\n      @user.email = valid_address\n      assert @user.valid?, \"#{valid_address.inspect} should be valid\"\n    end\n  end\n  \n  test \"email validation should reject invalid addresses\" do\n    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.\n                           foo@bar_baz.com foo@bar+baz.com user@example..com user@example...com]\n    invalid_addresses.each do |invalid_address|\n      @user.email = invalid_address\n      assert_not @user.valid?, \"#{invalid_address.inspect} should be invalid\"\n    end\n  end\n  \n  test \"email addresses should be unique\" do\n    duplicate_user = @user.dup\n    duplicate_user.email = @user.email.upcase\n    @user.save\n    assert_not duplicate_user.valid?\n  end\n\n  test \"password should have a minimum length\" do\n    @user.password = @user.password_confirmation = \"a\" * 5\n    assert_not @user.valid?\n  end\n\nend","undoManager":{"mark":-1,"position":3,"stack":[[{"group":"doc","deltas":[{"start":{"row":0,"column":0},"end":{"row":0,"column":1},"action":"insert","lines":["r"]}]}],[{"group":"doc","deltas":[{"start":{"row":0,"column":1},"end":{"row":0,"column":2},"action":"insert","lines":["a"]}]}],[{"group":"doc","deltas":[{"start":{"row":0,"column":1},"end":{"row":0,"column":2},"action":"remove","lines":["a"]}]}],[{"group":"doc","deltas":[{"start":{"row":0,"column":0},"end":{"row":0,"column":1},"action":"remove","lines":["r"]}]}]]},"ace":{"folds":[],"scrolltop":0,"scrollleft":0,"selection":{"start":{"row":0,"column":0},"end":{"row":0,"column":0},"isBackwards":false},"options":{"guessTabSize":true,"useWrapMode":false,"wrapToView":true},"firstLineState":0},"timestamp":1417466781011}