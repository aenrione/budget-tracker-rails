module ApplicationHelper
  def get_pagination_for_records(records, params)
    params = update_param(params)
    if records.has_attribute?(params[:sort_by])
      get_pagination_result_from_relation(records, params)
    else
      get_pagination_result_from_array(records, params)
    end
  end

  private

  def get_pagination_result_from_relation(filtered_records, params)
    sorting_direction = params[:sort_desc] == 'true' ? 'DESC' : 'ASC'
    filtered_records
      .order("#{params[:sort_by]} #{sorting_direction}")
      .page(params[:page])
      .per(params[:limit])
  end

  def get_pagination_result_from_array(filtered_records, params)
    records = if params[:sort_desc] == 'true'
                filtered_records.sort_by(&params[:sort_by].to_sym).reverse!
              else
                filtered_records.sort_by(&params[:sort_by].to_sym)
              end
    Kaminari.paginate_array(records)
            .page(params[:page])
            .per(params[:limit])
  end

  private
  def update_param(params)
    params[:limit] = params[:limit] || 10
    params[:sort_by] = params[:sort_by] || 'created_at'
    params[:sort_desc] = params[:sort_desc] || 'true'
    params
  end
end
