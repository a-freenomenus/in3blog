class Post < ActiveRecord::Base
  acts_as_taggable_on :tags
  has_friendly_id :title, :use_slug => true

  has_many :comments, :dependent => :destroy, :order => 'created_at ASC'
  has_many :audios
  has_many :pictures
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

  def audios=(params)
    params.each do |object_hash|
      audio = Audio.find(object_hash[:id])

      if object_hash[:delete].blank?
        self.audios << audio
      elsif object_hash[:delete].to_i == 1
        audio.destroy
      end
    end
  end

  def pictures=(params)
    params.each do |object_hash|
      picture = Picture.find(object_hash[:id])

      if object_hash[:delete].blank?
        self.pictures << picture
      elsif object_hash[:delete].to_i == 1
        picture.destroy
      end
    end
  end

  private

  def self.primitive_search_conditions(query)
    query.split(/\s+/).map do |word|
      '(' + %w[title body].map { |col| "#{col} LIKE #{sanitize('%' + word.to_s + '%')}" }.join(' OR ') + ')'
    end.join(' AND ')
  end

end
