using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Reflection;
using System.Web.UI.WebControls;

public class Common
{
    public static string connectionString = ConfigurationManager.ConnectionStrings["LocalSqlServer"].ConnectionString;

    public static void Log(string message)
    {
        System.Diagnostics.Debug.WriteLine(message);
    }

    public static List<string> ColumnNames(Type table)
    {
        List<string> columnNames = new List<string>();

        FieldInfo[] fields = table.GetFields(BindingFlags.Public | BindingFlags.Static);

        foreach (FieldInfo field in fields)
        {
            if (typeof(Column).IsAssignableFrom(field.FieldType))
            {
                Column column = (Column)field.GetValue(null);
                if (column.Exclude == false)
                    columnNames.Add(column.Name);
            }
        }

        return columnNames;
    }

    public static string ColumnName(string columnName)
    {
        return columnName.Replace("@", "");
    }

    public static string ColumnParam(string columnName)
    {
        return "@" + columnName;
    }

    public static string ImagePath(string fileName)
    {
        return "Images/" + fileName;
    }

    public static string JoinTable(string mainTable, string joinTable, string joinOn)
    {
        var m = mainTable;
        var j = joinTable;
        return String.Format("{0} AS {1} INNER JOIN {2} AS {3} ON {4}.{5} = {6}.{7} ",
            m, m, j, j, m, joinOn, j, joinOn);
    }

    public static string InsertCmd(List<string> columns, string tableName)
    {
        string sqlString = "INSERT INTO " + tableName + " (";
        string valuesStr = " VALUES (";

        foreach (var item in columns)
        {
            sqlString += item + ", ";
            valuesStr += ColumnParam(item) + ", "; //These 2 charactors
        }

        sqlString = sqlString.Remove(sqlString.Length - 2, 1) + ")";
        sqlString += valuesStr.Remove(valuesStr.Length - 2, 1) + ")";

        return sqlString;
    }

    public static string UpdateCmd(List<string> columns, string tableName, string id)
    {
        string sqlString = "Update " + tableName + " Set ";
        foreach (var item in columns)
        {
            sqlString += item + " = " + ColumnParam(item) + ", ";
        }
        sqlString = sqlString.Remove(sqlString.Length - 2, 1);
        sqlString += " WHERE ID = " + id;

        return sqlString;
    }

    public static void SetList(DropDownList control, String table, string value, string name)
    {
        DataTable data = SelectAll(table, null);
        control.DataSource = data;
        control.DataTextField = name;
        control.DataValueField = value;
        control.DataBind();
    }


    public static DataTable SelectAll(string tableName, string whereCondition)
    {
        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            conn.Open();
            using (SqlDataAdapter adapter = new SqlDataAdapter("SELECT * FROM " + tableName + (string.IsNullOrEmpty(whereCondition) ? "" : " WHERE " + whereCondition), conn))
            {
                DataTable dataTable = new DataTable();
                adapter.Fill(dataTable);
                return dataTable;
            }
        }
    }

    public static bool Delete(string tableName, string id)
    {
        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            conn.Open();
            using (SqlCommand command = new SqlCommand("DELETE FROM " + tableName + " WHERE id = @id", conn))
            {
                command.Parameters.AddWithValue("@id", id);

                int rowsAffected = command.ExecuteNonQuery();
                Log($"Rows affected: {rowsAffected}");

                return rowsAffected > 0;
            }
        }
    }

    public static bool ExecuteNonQuery(Dictionary<Column, object> columns, string sqlString)
    {
        Log("SQL String: " + sqlString);

        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            conn.Open();
            using (SqlCommand command = new SqlCommand(sqlString, conn))
            {
                foreach (var item in columns)
                {
                    Log("Column Name: " + ColumnParam(item.Key.Name) + " Type: " + item.Key.Type + " Value: " + item.Value);
                    command.Parameters.AddWithValue(ColumnParam(item.Key.Name), item.Key.Type).Value = item.Value;
                }
                 return command.ExecuteNonQuery()  >  0;
            }
        }
    }
}