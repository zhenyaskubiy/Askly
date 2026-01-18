module ApplicationHelper
  def inclination(count, one, few, many)
    retuurn many if (count % 100).between?(11, 14)

    case count % 10
    when 1
      one
    when 2..4
      few
    else
      many
    end
  end
end
