module ApplicationHelper
  TAG_COLORS = %w[#e91e93 #9c27b0 #00bcd4 #4caf50 #ff9800 #2196f3].freeze

  def inclination(count, one, few, many)
    return many if (count % 100).between?(11, 14)

    case count % 10
    when 1
      one
    when 2..4
      few
    else
      many
    end
  end

  def tag_color(tag)
    TAG_COLORS[tag.bytes.sum % TAG_COLORS.length]
  end

  def user_initials(user)
    user.nickname.first.upcase
  end

  def avatar_bg(user)
    colors = %w[#9c27b0 #e91e63 #2196f3 #4caf50 #ff9800 #00bcd4 #673ab7 #f44336]
    colors[user.id % colors.length]
  end
end
