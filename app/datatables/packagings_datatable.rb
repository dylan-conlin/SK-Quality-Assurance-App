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
        link_to(packaging.user.name, packaging.user),
        h(packaging.workorder),
        h(packaging.item_number)
        # h(packaging.individual_label_placement),
        # h(packaging.individual_label_legibility),
        # h(packaging.individual_seal_integrity),
        # h(packaging.individual_label_accuracy),
        # h(packaging.individual_general_appearance),
        # h(packaging.master_label_placement),
        # h(packaging.master_label_legibility),
        # h(packaging.master_tape_glue),
        # h(packaging.master_case_appearance),
        # h(packaging.case_count),
        # h(packaging.case_weight),
        # h(packaging.comments)
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
      packagings = packagings.where("workorder ilike :search", search: "%#{params[:sSearch]}%")
    end
    packagings
  end
#  or comments ilike :search or case_count ilike :search or case_weight ilike :search
  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[created_at blank user_id workorder item_number]
    columns[params[:iSortCol_0].to_i]
  end
# individual_label_placement individual_label_legibility individual_seal_integrity individual_label_accuracy individual_general_appearance master_label_placement master_label_legibility master_tape_glue master_case_appearance case_count case_weight comments
  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end

