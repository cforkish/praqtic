module GraphHelper

  def category_to_node(category)
    { "name" => category.name,
      "id" =>category.id,
      "url" => category_path(category.id),
      "friends" => category.friends.map { |f| { "source" => category.id, "target" => f.id } },
      "quizes" => category.quizes.map { |c| quiz_to_node(c) },
      "children"   => category.children.map { |c| category_to_node(c) } # uncomment to add quiz leafs # + category.quizes.map { |c| quiz_to_node(c) }
    }
  end

  def quiz_to_node(quiz)
    { "name" => quiz.name,
      "id" =>quiz.id,
      "url" => quiz_path(quiz.id),
      "size"   => quiz.lessons.size + quiz.questions.size
    }
  end

  def quiz_prereq_graph(quiz)
    {
      "name" => quiz.name,
      "id" =>quiz.id,
      "url" => quiz_path(quiz.id),
      "children"   => quiz.prereqs.map { |c| quiz_prereq_graph(c) }
    }
  end

  def quiz_postreq_graph(quiz)
    {
      "name" => quiz.name,
      "id" =>quiz.id,
      "url" => quiz_path(quiz.id),
      "children"   => quiz.postreqs.map { |c| quiz_postreq_graph(c) }
    }
  end

end
