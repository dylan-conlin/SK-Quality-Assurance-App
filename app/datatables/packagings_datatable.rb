class PackagingsDatatable
  delegate :params, :h, :link_to, :gravatar_for,  to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
      {
        sEcho: params[:sEcho].to_i,
        iTotalRecords: Packaging.count,
        iTotalDisplayRecords: packagings.total_entries,
        aaData: data
      }

  end

private


  def data
    packagings.map do |packaging|
      [
        h(packaging.created_at),
        gravatar_for(packaging.user),
       link_to(packaging.user.name, packaging.user)

      ]
    end
  end

  def packagings
    @packagings ||= fetch_packagings
  end

  def fetch_packagings
    packagings = Packaging.order("#{sort_column} #{sort_direction}")
    packagings = packagings.page(page).per_page(per_page)
    if params[:sSearch].present?
      packagings = packagings.where("created_at like :search", search: "%#{params[:sSearch]}%")
    end
    packagings
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[created_at]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end

