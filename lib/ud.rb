# update and delete methods for use with other classes
class UD

  def delete_item attributes
    item_id = attributes[:item_id]
    table = attributes[:table]
    DB.exec("DELETE FROM #{table} WHERE id = #{item_id};")
  end

  def update(attributes)
    item_id = attributes[:item_id]
    table = attributes[:table]
    column = attributes[:column]
    values = attributes[:values]
    DB.exec("UPDATE #{table}
             SET #{column} = #{values}
             WHERE id= #{item_id};")
  end
end
