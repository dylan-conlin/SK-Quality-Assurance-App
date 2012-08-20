class NonconformancePdf < Prawn::Document
  require "open-uri"

  def initialize(nonconformance, view)
    super()
    @nonconformance = nonconformance
    @view = view

    nonconformance_letter
    start_new_page
    nonconformance_id
    instances
    move_down 40
    total_row
    move_down 40
    corrective_action
    move_down 40
    if @nonconformance.photo_1.file? or @nonconformance.photo_2.file? or @nonconformance.photo_3.file? or @nonconformance.photo_4.file?
      start_new_page
      images
    end
  end

  def nonconformance_letter
    text "SK Food Group, Reno"
    text "5555 Quail Manor Court, Suite 100"
    text "Reno, NV 89511"
    text "(775)284-2639 Phone"
    text "(775)284-2640 Fax"
    
    move_down 20
    
    if @nonconformance.component.supplier.long_name == nil?
      text "Dear #{@nonconformance.component.supplier.name},"
    else
      text "Dear #{@nonconformance.component.supplier.long_name},"
    end
    
    move_down 20
    
    text "#{@nonconformance.letter}"

    move_down 20

    text "Thank you,"
    text "Jodi Duvall"
    text "Quality Assurance"
    text "(775)284-2043 Phone"
    text "jodi.duvall@skfoodgroup.com"

  end


  def nonconformance_id
    text "Nonconforming Product Report ID:" + "#{@nonconformance.id}", size: 24, style: :bold
    move_down 30
    text "<b>Date:</b> " + Time.now.strftime("%D").to_s, :inline_format => true
    move_down 10
    text "<b>SK Item Information:</b> " + "#{@nonconformance.component.number} #{@nonconformance.component.sk_description}", :inline_format => true
    move_down 10
    text "<b>#{@nonconformance.component.supplier.name} Item Information:</b> " "#{@nonconformance.component.supplier_number}", :inline_format => true
    move_down 10
    text "<b>Reason for nonconformance:</b>" + " #{@nonconformance.reason}", :inline_format => true
    move_down 50
  end

  def instances
    table instance_rows, :cell_style => { :size => 8, :text_color => "346842" } do
      row(0).font_style = :bold
      self.row_colors = ["DDDDDD","FFFFFF"]
      self.header = true
      
    end
    
  end

  def instance_rows
    @price = @nonconformance.component.price_per_purchase_unit
    [["Date", "#{@nonconformance.component.supplier.name} lot ID", "PO Number", "Receipt Date", "Qty Rejected", "Labor", "Labor Cost", "Materials Cost", "Extended Cost"]] +
    @nonconformance.instances.map do |instance|
      [instance.created_at.strftime("%D").to_s, 
       instance.supplier_lot,
       instance.po_number,
       instance.receipt_date,
       instance.quantity.to_s + " " + instance.nonconformance.component.purchase_unit,
       instance.labor.to_s + " hrs",
       price(instance.nonconformance.labor_cost * instance.labor),
       price(instance.quantity * @price),
       price((instance.quantity * @price)+(instance.nonconformance.labor_cost * instance.labor))] 
    end

  end

  def total_row
    @all_tot = price(@nonconformance.instances.sum { |p| p.quantity * @nonconformance.component.price_per_purchase_unit + p.labor * @nonconformance.labor_cost })
    text "Total Credit Requested: #{@all_tot}", :indent_paragraphs => 290, size: 12, style: :bold

  end
  
  def corrective_action
    text "<b>Requested Corrective Action: </b>" + "Please provide a credit reference number and corrective action statement detailing what you would like done with the nonconforming product(destroy, donate, return to vendor, etc)", :inline_format => true
  end
  
def images
    text "Images", size: 14, style: :bold
    move_down 20  

      if @nonconformance.photo_1.file? 
        image open(@nonconformance.photo_1.url), :at => [0,700], :width => 250
      end
      if @nonconformance.photo_2.file?
        image open(@nonconformance.photo_2.url), :at => [0,350], :width => 250
      end
      if @nonconformance.photo_3.file?
        image open(@nonconformance.photo_3.url), :at => [260,700], :width => 250
      end
      if @nonconformance.photo_4.file?
        image open(@nonconformance.photo_4.url), :at => [260,350], :width => 250
      end
end


  def price(num)
    @view.number_to_currency(num)
  end
  
end
