class Page < ActiveRecord::Base
  attr_accessible :parent_id, :content, :name

  has_ancestry

  def self.arrange_as_array(options={}, hash=nil)                                                                                                                                                            
    hash ||= arrange(options)

    arr = []
    hash.each do |node, children|
      arr << node
      arr += arrange_as_array(options, children) unless children.nil?
    end
    arr
  end

  def name_for_selects
    "#{'-' * depth} #{name}"
  end

  def possible_parents
    parents = Page.arrange_as_array(:order => 'name')
    return new_record? ? parents : parents - subtree
  end
end
