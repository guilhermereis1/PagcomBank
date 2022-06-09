module ApplicationHelper
  def real(value)
    number_to_currency(value, :unit => "R$ ", :separator => ",", :delimiter => ".")
  end

  def br_date(date)
    date.to_date.strftime("%d/%m/%Y")
  end
end
