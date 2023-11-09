﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Create.aspx.cs" Inherits="Admin_Create" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="Style.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="FormContent" ContentPlaceHolderID="Form" runat="Server">
    <h2 class="text-center">Add new tour place</h2>
    <div class="row g-3">
        <div class="col-12">
            <label for="txtPackName" class="form-label">Package Name</label>
            <asp:TextBox runat="server" ID="txtPackName" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="col-md-6">
            <label for="tourType" class="form-label">Tour Type</label>
            <asp:DropDownList runat="server" ID="tourType" CssClass="form-select"></asp:DropDownList>
        </div>
        <div class="col-md-6">
            <label for="category" class="form-label">Category</label>
            <asp:DropDownList runat="server" ID="category" CssClass="form-select"></asp:DropDownList>
        </div>
        <div class="col-2">
            <label for="duration" class="form-label">Duration</label>
            <asp:TextBox runat="server" ID="duration" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="col-5">
            <label for="country" class="form-label">Country</label>
            <asp:TextBox runat="server" ID="country" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="col-5">
            <label for="city" class="form-label">City</label>
            <asp:TextBox runat="server" ID="city" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="col-12">
            <label for="link" class="form-label">Link</label>
            <asp:TextBox runat="server" ID="link" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="col-12">
            <label for="description" class="form-label">Description</label>
            <asp:TextBox runat="server" ID="description" TextMode="MultiLine" CssClass="form-control" Rows="5"></asp:TextBox>
        </div>
        <div class="col-md-12">
            <label for="imgUp" class="form-label">City</label>
            <asp:FileUpload runat="server" ID="imgUp" CssClass="form-control" />
        </div>
        <div class="col-12">
            <div class="form-check">
                <asp:CheckBox runat="server" ID="chkAgr" Text="&nbsp;&nbsp;Check to confirm the condtion" CssClass="c-pointer" />
            </div>
        </div>
        <div class="col-12">
            <asp:Button runat="server" ID="cmdAddBtn" Text="Add New" class="btn btn-primary" OnClick="CmdUpdate_Click" />
        </div>
    </div>
</asp:Content>

