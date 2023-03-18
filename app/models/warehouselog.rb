class Warehouselog < ApplicationRecord
    self.table_name = "warehouselog"
    self.inheritance_column = :_type_disabled
end  