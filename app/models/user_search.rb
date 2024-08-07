class UserSearch
  attr_accessor :query, :sort_field, :sort_direction, :profile, :state, :city, :page, :limit

  attr_reader :page_answers

  FILTERS = %w(vision_level competence_level resource_level infrastructure_level sample answered).freeze

  def initialize(options)

    @users = User
    
    aux_sort_direction = options.fetch(:sort_direction,nil)
    @sort_direction = aux_sort_direction.to_s == 'desc' ? -1 : 1
    @sort_field = options.fetch(:sort_field,nil)
    @state = options.fetch(:state,nil)
    @city = options.fetch(:city,nil)
    @profile = options.fetch(:profile,nil)
    @school = options.fetch(:school,nil)
    @query = options.fetch(:query,nil)
    aux_page = options.fetch(:page,1)
    @page = aux_page || 1
    @limit = options.fetch(:limit,nil)
    @affiliation_id = options.fetch(:affiliation_id,nil)


    filter_by_query
    filter_by_state
    filter_by_city
    filter_by_profile
    filter_by_affiliation
    order_answers
    paginate_answers
  end

  def filter_by_query
    @users = @users.full_text_search(query) if @query.present?
  end

  def order_answers
    @users =  case @sort_field
                when nil
                  @users.order(:nome.desc)
                when 'name'
                  @users.order(name: @sort_direction)
                when 'email'
                  @users.order(email: @sort_direction)
                when 'type'
                  @users.order(type: @sort_direction)
                else
                  @users.order(@sort_field => @sort_direction)
                end
  end

  def paginate_answers
    lim = 50
    if @limit
      lim = @limit
    end

    @page_answers = @users
  end

  def filter_by_state
    @users = @users.where(:state_id => @state._id, :active => true) if @state.present?
  end

  def filter_by_city
    @users = @users.where(:city_id => @city._id, :active => true) if @city.present?
  end

  def filter_by_profile
    @users = @users.where(:_profile.in => @profile, :active => true)
  end

  def filter_by_affiliation
    @users = @users.where(:affiliation_id => @affiliation_id, :active => true)
  end

  def limit
    @limit
  end

  def pages_count
    1
  end

  def total_count
    @users.count
  end

  def answered_sample_count
    @users.with_response.where(sample: true).count
  end
end
