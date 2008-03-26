ActiveRecord::Schema.define(:version => 0) do
  create_table :products, :force => true do |t|
    t.column :description, :string
    t.column :quantity, :int
    t.column :price, :decimal
    t.column :discount_price, :decimal
  end

  create_table :consultants, :force => true do |t|
    t.column :name, :string
    t.column :hourly_rate, :decimal
  end
end
