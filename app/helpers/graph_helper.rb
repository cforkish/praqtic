module GraphHelper

  def category_to_node(category)
    { "name" => category.name,
      "id" =>category.id,
      "url" => category_path(category.id),
      "friends" => category.friends.map { |f| { "source" => category.id, "target" => f.id } },
      "concepts" => category.concepts.map { |c| concept_to_node(c) },
      "children"   => category.children.map { |c| category_to_node(c) } # uncomment to add concept leafs # + category.concepts.map { |c| concept_to_node(c) }
    }
  end

  def concept_to_node(concept)
    { "name" => concept.name,
      "id" =>concept.id,
      "url" => concept_path(concept.id),
      "size"   => concept.lessons.size + concept.evaluators.size
    }
  end

  def concept_prereq_graph(concept)
    {
      "name" => concept.name,
      "id" =>concept.id,
      "url" => concept_path(concept.id),
      "children"   => concept.prereqs.map { |c| concept_prereq_graph(c) }
    }
  end

  def concept_postreq_graph(concept)
    {
      "name" => concept.name,
      "id" =>concept.id,
      "url" => concept_path(concept.id),
      "children"   => concept.postreqs.map { |c| concept_postreq_graph(c) }
    }
  end

end
