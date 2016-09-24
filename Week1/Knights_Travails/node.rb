class PolyTreeNode
  attr_reader :value
  attr_accessor :parent, :children

  def initialize(value)
    @value = value
    @children = []
    @parent = nil
  end

  def parent=(parent)
    @parent.children.delete(self) unless @parent.nil?
    
    if parent.nil?
      @parent = nil
    else
      @parent = parent
      @parent.add_child(self)
    end
  end

  def add_child(child)
    @children << child unless @children.include?(child)
  end

  def child

  end

  def inspect
    @value
  end
end
