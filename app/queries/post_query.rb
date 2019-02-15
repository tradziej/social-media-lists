class PostQuery
  attr_reader :relation

  def initialize(relation = Post.unscoped)
    @relation = relation
  end

  def narrow(filters = {})
    query = clone

    if filters[:custom_lists].present?
      query.send(:filter_by_custom_lists, filters[:custom_lists])
    end
    if filters[:social_accounts].present?
      query.send(:filter_by_social_accounts, filters[:social_accounts])
    end
    if filters.values_at(:from, :to).all?(&:present?)
      query.send(:filter_by_date, filters[:from], filters[:to])
    end

    query
  end

 private
  def filter_by_custom_lists(lists)
    @relation = @relation
      .joins(person: :custom_lists)
      .where("custom_lists.name IN (?)", lists)
    @relation
  end

  def filter_by_social_accounts(accounts)
    @relation = @relation
      .joins(:social_media_account)
      .where("social_media_accounts.kind IN (?)", accounts)
    @relation
  end

  def filter_by_date(from, to)
    @relation = @relation
      .where('posts.posted_at BETWEEN ? AND ?', from, to)
    @relation
  end
end