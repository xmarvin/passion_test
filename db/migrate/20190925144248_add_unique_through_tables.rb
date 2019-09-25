class AddUniqueThroughTables < ActiveRecord::Migration[5.2]
  def change

    sql = %{
    CREATE FUNCTION is_name_exists(varchar)
      RETURNS boolean AS
    $func$
       SELECT EXISTS (SELECT 1 from verticals where name = $1 UNION SELECT 1 from categories where name = $1)
    $func$ LANGUAGE sql;

    ALTER TABLE categories ADD CONSTRAINT unique_name CHECK(not is_name_exists(name));
    ALTER TABLE verticals ADD CONSTRAINT unique_name CHECK(not is_name_exists(name));
    }

    execute(sql)
  end
end
