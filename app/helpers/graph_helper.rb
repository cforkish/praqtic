module GraphHelper

  def category_to_node(category)
    { "name" => category.name,
      "url" => category_path(category.id),
      "category_id" =>category.id,
      "children"   => category.children.map { |c| category_to_node(c) } # uncomment to add concept leafs # + category.concepts.map { |c| concept_to_node(c) }
    }
  end



  def concept_to_node(concept)
  { "name" => concept.name,
    "size"   => concept.lessons.size + concept.evaluators.size
  }
  end

end
