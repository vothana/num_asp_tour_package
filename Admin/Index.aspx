<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="Admin_Index" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="Style.css" rel="stylesheet" />
    <style>
        .image {
            border-radius: 15px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Form" runat="Server">

    <asp:Repeater ID="CategoryRepeater" runat="server">
        <HeaderTemplate>
            <ul class="nav nav-pills mb-5">
        </HeaderTemplate>
        <ItemTemplate>
            <li class="nav-item c-pointer" style="cursor: pointer">
                <a class='<%# Container.ItemIndex == 0 ? "nav-link active" : "nav-link" %>' aria-current="page" onclick="clickEd1(<%# Eval(TourCategory.CatId.Name) %>)">
                    <%# Eval(TourCategory.Category.Name) %>
                </a>
            </li>
        </ItemTemplate>
        <FooterTemplate>
            </ul>
        </FooterTemplate>
    </asp:Repeater>

    <asp:ListView ID="ListView1" runat="server" GroupPlaceholderID="groupPlacehoder1" ItemPlaceholderID="itemPlaceholder1" OnPagePropertiesChanging="OnPagePropertiesChanging" OnItemCommand="ListView1_ItemCommand">
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
                            <asp:Image CssClass="image" ID="imgUrl" Width="300px" runat="server" ImageUrl='<%# "~/" + Eval(Tour.ImageUrl.Name) %>' />
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
                        <br />
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp; 
                    <asp:LinkButton CommandName="editInfo" ID="editInfo" Text="Edit Info" runat="server" Font-Bold="false" ForeColor="#009999" Font-Italic="true"></asp:LinkButton>
                    </td>
                    </td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:ListView>
</asp:Content>

<asp:Content ID="ContentScrript" ContentPlaceHolderID="ContentScript" runat="server">
    <script>
        function clickEd1(catId) {
            const currentUrl = window.location.origin;
            const path = window.location.pathname;

            console.log(currentUrl);
            if (path.includes("Admin")) {
                window.location.assign(currentUrl + "/" + path.split("/")[1] + "\\Admin\\Index.aspx?catId=" + catId)
            } else {
                window.location.assign(currentUrl + "/" + path.split("/")[1] + "\\Index.aspx?catId=" + catId)
            }
        }
    </script>
</asp:Content>
