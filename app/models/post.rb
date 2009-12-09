class Post < ActiveRecord::Base
  acts_as_taggable_on :tags
  has_friendly_id :title, :use_slug => true

  belongs_to :user

  validates_presence_of :body, :title

  named_scope :recent, :order => 'created_at DESC'

  def self.primitive_search(query)
    find(:all, :conditions => primitive_search_conditions(query))
  end

  def self.paginated_primitive_search(query, options = {})
    paginate(:page => options[:page], :per_page => options[:per_page], 
             :conditions => primitive_search_conditions(query))
  end

  private

  def self.primitive_search_conditions(query)
    query.split(/\s+/).map do |word|
      '(' + %w[title body].map { |col| "#{col} LIKE #{sanitize('%' + word.to_s + '%')}" }.join(' OR ') + ')'
    end.join(' AND ')
  end

end
