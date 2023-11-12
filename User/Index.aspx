<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="User_Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Form" runat="Server">
    <asp:ListView ID="ListView1" runat="server" GroupPlaceholderID="groupPlacehoder1" ItemPlaceholderID="itemPlaceholder1" OnPagePropertiesChanging="OnPagePropertiesChanging">
        <LayoutTemplate>
            <table style="width: 900px">
                <tr>
                    <th></th>
                    <th></th>
                </tr>
                <asp:PlaceHolder runat="server" ID="groupPlacehoder1"></asp:PlaceHolder>
                <tr>
                    <td colspan="2">

                        <asp:DataPager ID="DataPager1" runat="server" PagedControlID="ListView1" PageSize="5">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Link" ShowFirstPageButton="True" ShowNextPageButton="false" ShowPreviousPageButton="False" />
                                <asp:NumericPagerField ButtonCount="10" />
                                <asp:NextPreviousPagerField ButtonType="Link" ShowLastPageButton="True" ShowNextPageButton="false" ShowPreviousPageButton="False" />
                            </Fields>
                        </asp:DataPager>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
        <GroupTemplate>
            <tr>
                <asp:PlaceHolder runat="server" ID="itemPlaceholder1"></asp:PlaceHolder>
            </tr>
        </GroupTemplate>
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
    </asp:ListView>
</asp:Content>

