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
    public bool Exclude { get; } = false;

    private Column(string name, SqlDbType type)
    {
        Name = name;
        Type = type;
    }

    private Column(string name, SqlDbType type, bool exclude)
    {
        Name = name;
        Type = type;
        Exclude = exclude;
    }

    public static Column Create(string name, SqlDbType type)
    {
        return new Column(name, type);
    }

    public static Column Create(string name, SqlDbType type, bool exclude)
    {
        return new Column(name, type, exclude);
    }
}