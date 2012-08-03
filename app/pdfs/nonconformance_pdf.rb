class NonconformancePdf < Prawn::Document
  require "open-uri"

  def initialize(nonconformance, view)
    super()
    @nonconformance = nonconformance
    @view = view
    nonconformance_id
    instances
    
  end

  def nonconformance_id
    text "Nonconformance \##{@nonconformance.component.number}", size: 14, style: :bold
    move_down 100

      if @nonconformance.photo_1.file? 
        image open(@nonconformance.photo_1.url), :at => [0,500], :width => 100
      end
      if @nonconformance.photo_2.file?
        image open(@nonconformance.photo_2.url), :at => [100,500], :width => 100
      end
      if @nonconformance.photo_3.file?
        image open(@nonconformance.photo_3.url), :at => [200,500], :width => 100
      end
      if @nonconformance.photo_4.file?
        image open(@nonconformance.photo_4.url), :at => [300,500], :width => 100
      end

  end

  def instances
    move_down 20
    table instance_rows do
      row(0).font_style = :bold
      self.row_colors = ["DDDDDD","FFFFFF"]
      self.header = true
    end
  end

  def instance_rows
    @price = @nonconformance.component.price_per_purchase_unit
    [["Date", "#{@nonconformance.component.supplier.name} lot ID", "PO Number", "Receipt Date", "Qty Rejected", "Cost per #{@nonconformance.component.purchase_unit}", "Extended Cost"]] +
    @nonconformance.instances.map do |instance|
      [instance.created_at.strftime("%D").to_s, 
       instance.supplier_lot,
       instance.po_number,
       instance.receipt_date,
       instance.quantity.to_s + " " + instance.nonconformance.component.purchase_unit,
       price(instance.nonconformance.component.price_per_purchase_unit),
       price(instance.quantity * @price) ]
    end
  end
  

  def price(num)
    @view.number_to_currency(num)
  end
  
end
