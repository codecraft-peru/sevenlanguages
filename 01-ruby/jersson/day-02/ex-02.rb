# The Tree class was interesting, but it did not allow you to specify a new tree
# with a clean user interface. 
# Let the initializer accept a nested structure of hashes. 
# You should be able to specify a tree like this: 
# {’grandpa’ => { ’dad’ => {’child 1’ => {}, ’child 2’ => {} }, 
#                 ’uncle’ => {’child 3’ => {}, ’child 4’ => {} } } }.

class Tree
    attr_accessor :children, :node_name
    
    def initialize(tree)
        @node_name = tree.keys[0]
        @children = tree[@node_name].map do |child| 
            subtree = Hash[*child]
            Tree.new(subtree)
        end
    end

    def visit_all(&block)
        visit &block
        children.each {|c| c.visit_all &block}
    end
    
    def visit(&block)
        block.call self
    end
end

family_tree = Tree.new({"grandpa" =>
                        {
                            "dad" => {
                                "child 2" => {}, "child 1" => {}
                            },
                            "uncle" => {
                                "child 4" => {}, "child 3" => {}
                            }
                        }
                    })

puts "visiting root"
family_tree.visit {|node| puts node.node_name}
puts

puts "visiting entire tree"
family_tree.visit_all {|node| puts node.node_name}
puts

# You can run this exercise using this command in the terminal
# ruby ex-02.rb