image_offset = 10
if @business.image.path
	pdf.float do
		pdf.bounding_box [0, pdf.bounds.top], :width => 100 do
			logo = @business.image.path
			pdf.image logo, :width => 100, :position => :left
		end
	end
	image_offset = 120
end

pdf.float do
	pdf.bounding_box [image_offset, pdf.bounds.top - 10], :width => 200 do
		pdf.text "#{@business.name}", :size => 20, :style => :bold
		pdf.text "#{@business.street}"
		pdf.text "#{@business.street_2}"
		pdf.text "#{@business.city}, #{@business.state}  #{@business.zipcode}"
		pdf.text "#{number_to_phone @business.phone}"
	end
end

pdf.move_down 120

pdf.text "#{@consigner.name}", :style => :bold
pdf.text "#{@consigner.biz_name}", :style => :bold
pdf.text "#{@consigner.street}"
pdf.text "#{@consigner.street_2}"
pdf.text "#{@consigner.city}, #{@consigner.state}  #{@consigner.zipcode}"
pdf.text "#{number_to_phone @consigner.phone}"

pdf.move_down 20

items = @products.each_pair.map do |prod, pair|
	[
		prod.name,
		pair.values[0],
		number_to_currency (pair.keys[0]),
		number_to_currency (pair.keys[0] * pair.values[0])
	]
end

pdf.table items, :border_style => :grid,
	:row_colors => ["ffffff", "dddddd"],
	:headers => ["Product Name", "QTY","Wholesale",  "Total"],
	:widths => 400,
	:align => {0 => :left, 1 => :right, 2 => :right, 3 => :right}
	
pdf.move_down(30)

pdf.text "Invoice Total: #{number_to_currency @invoice.total}", :style => :bold, :align => :center