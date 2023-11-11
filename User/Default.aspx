<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="User_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="ID" DataSourceID="SqlDataSource1">
        <ItemTemplate>
            <table style="width: 900px">
                <tr>
                    <td style="padding: 10px; vertical-align: central; width: 300px">
                        <asp:HyperLink runat="server" ID="imgButton" NavigateUrl='<%# Eval(Tour.DesUrl.Name) %>'>
                            <asp:Image ID="imgUrl" Width="300px" runat="server" ImageUrl='<%# "~/" + Eval(Tour.ImageUrl.Name) %>' />
                        </asp:HyperLink>
                    </td>
                    <td style="padding: 10px; vertical-align: top; font-size: 12pt; width: 600px">
                        <asp:HyperLink ID="PackageNameLabel" runat="server" Text='<%# Eval(Tour.PackageName.Name) %>' NavigateUrl='<%# Eval(Tour.DesUrl.Name) %>' Font-Bold="True" Font-Size="15pt" ForeColor="#33CCCC" />
                        <br />
                        Tour Types:
                    <asp:Label ID="TourTypesLabel" runat="server" Text='<%# Eval(TourType.TypeName.Name) %>' />
                        <br />
                        City:
                    <asp:Label ID="CityLabel" runat="server" Text='<%# Eval(Tour.City.Name) %>' />
                        &nbsp;Country:
                    <asp:Label ID="CountryLabel" runat="server" Text='<%# Eval(Tour.Country.Name) %>' />
                        <br />
                        Duration:
                    <asp:Label ID="DurationLabel" runat="server" Text='<%# Eval(Tour.Duration.Name) %>' />
                        <br />
                        About The Site:
                    <asp:Label ID="DesLabel" runat="server" Text='<%# Eval(Tour.Description.Name) %>' />
                        <br />
                        <asp:TextBox Visible="false" ID="txtId" runat="server" Text='<%# Eval(Tour.ID.Name) %>' />
                    </td>
                </tr>
            </table>
        </ItemTemplate>
        <LayoutTemplate>
            <div id="itemPlaceholderContainer" runat="server" style="">
                <span runat="server" id="itemPlaceholder" />
            </div>
            <div style="">
                <asp:DataPager ID="DataPager1" runat="server" PageSize="5">
                    <Fields>
                        <asp:NextPreviousPagerField ButtonType="Link" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="true" />
                        <asp:NumericPagerField ButtonCount="10" />
                        <asp:NextPreviousPagerField ButtonType="Link" ShowLastPageButton="True" ShowNextPageButton="true" ShowPreviousPageButton="False" />
                    </Fields>
                </asp:DataPager>
            </div>
        </LayoutTemplate>
    </asp:ListView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TourPackageConnectionString %>" ProviderName="<%$ ConnectionStrings:TourPackageConnectionString.ProviderName %>" SelectCommand="SELECT tblCategories.*, tblCategories.CATID AS Expr1, tblCategories.CATEGORY AS Expr2, tblTourPackages.*, tblTourTypes.*, tblTourTypes.TYPEID AS Expr3, tblTourTypes.TYPE AS Expr4, tblTourPackages.CATID AS Expr5, tblTourPackages.IN_DATE AS Expr7, tblTourPackages.IMAGE_URL AS Expr8, tblTourPackages.DESURL AS Expr9, tblTourPackages.DESCRIPTION AS Expr10, tblTourPackages.DURATION AS Expr11, tblTourPackages.CITY AS Expr12, tblTourPackages.COUNTRY AS Expr13, tblTourPackages.TYPEID AS Expr14, tblTourPackages.PACKAGENAME AS Expr15, tblTourPackages.ID AS Expr16, tblTourPackages.USERNAME AS Expr6 FROM tblCategories INNER JOIN tblTourPackages ON tblCategories.CATID = tblTourPackages.CATID INNER JOIN tblTourTypes ON tblTourPackages.TYPEID = tblTourTypes.TYPEID"></asp:SqlDataSource>
</asp:Content>

