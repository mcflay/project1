require 'spec_helper'

describe Post do
	before { @post = Post.new(title: "Lorem ipsum", content: "Lorem ipsum dolor") }
	subject { @post }

	it { should respond_to(:title) }
	it { should respond_to(:content) }

end