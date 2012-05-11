class DepartmentsDatatable
  delegate :params, :h, :link_to, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Department.count,
      iTotalDisplayRecords: departments.total_entries,
      aaData: data
    }
  end

private

  def data
    departments.map do |department|
      [
        link_to(department.name, department),

        h(department.created_at)
      ]
    end
  end

  def departments
    @departments ||= fetch_departments
  end

  def fetch_departments
    departments = Department.order("#{sort_column} #{sort_direction}")
    departments = departments.page(page).per_page(per_page)
    if params[:sSearch].present?
      departments = departments.where("name ilike :search", search: "%#{params[:sSearch]}%")
    end
    departments
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[name created_at]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end
