import csv

def generate_insert_statements(file_path, table_name="pokemon", delimiter=","):
    try:
        with open(file_path, "r") as file:
            reader = csv.reader(file, delimiter=delimiter)
            
            # Extract the header
            headers = next(reader)

            # Prepare the base SQL INSERT statement
            sql_statements = []

            for row in reader:
                values = []
                for value in row:
                    # Handle NULL values
                    if value.strip().lower() in ("null", ""):
                        values.append("NULL")
                    else:
                        values.append(value)
                
                # Construct the SQL statement
                sql = f"INSERT INTO {table_name} ({', '.join(headers)}) VALUES ({', '.join(values)});"
                sql_statements.append(sql)

            return "\n".join(sql_statements)

    except FileNotFoundError:
        return "Error: File not found."
    except Exception as e:
        return f"Error: {e}"

# Example usage:
file_path = "pokemon.csv"  # Replace with your file path
delimiter = ","  # Replace with your file's delimiter if not comma

script_output = generate_insert_statements(file_path, delimiter=delimiter)

# Save or print the SQL script
with open("insert_statements.sql", "w") as sql_file:
    sql_file.write(script_output)

print("SQL INSERT statements have been generated and saved to 'insert_statements.sql'.")
