using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Reflection;
using System.Web;

public class Column
{
    public Column() { }

    public string Name { get; }
    public SqlDbType Type { get; }

    private Column(string name, SqlDbType type)
    {
        Name = name;
        Type = type;
    }

    public static Column Create(string name, SqlDbType type)
    {
        return new Column(name, type);
    }
}