<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Create.aspx.cs" Inherits="Admin_Create"  EnableEventValidation="false"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="Style.css" rel="stylesheet" />
    <style>
        .right{
            margin-left: 500px;
        }
    </style>
</asp:Content>

<asp:Content ID="FormContent" ContentPlaceHolderID="Form" runat="Server">
    <h2 class="text-center" id="pageTittle">Add new tour place</h2>
    <div class="row g-3">
        <div class="col-12">
            <label for="txtPackName" class="form-label">Package Name <%# Tour.PackageName.Name %></label>
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
            <div style="display: flex;">
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalCenter" id="btnModal">
                    Upload Image
                </button>
                <p style="margin-left: 20px" id="image-name"></p>
            </div>

            <div class="modal fade" id="modalCenter" tabindex="-1" role="dialog" aria-labelledby="modalCenterTitle" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="modalCenterTitle">Upload Image</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <asp:Image Width="90%" ID="mImgUrl" runat="server" />
                            <input type="file" name="file" onchange="previewFile()"  runat="server" ID="imgUp" class="form-control" />
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Save</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-12" style="margin-top: 50px">
            <div class="form-check">
                <asp:CheckBox runat="server" ID="chkAgr" Text="&nbsp;&nbsp;Check to confirm the condtion" CssClass="c-pointer" />
            </div>
        </div>
        <div class="col-12">
            <asp:Button runat="server" ID="cmdSubmit" Text="Create" CssClass="btn btn-primary" OnClick="CmdSubmit_Click" />
            <asp:Button runat="server" ID="cmdDelete" Text="Delete" Visible="false" CssClass="btn btn-primary" OnClick="DeleteRecord" />
             <asp:Label CssClass="form-label text-primary" runat="server" ID="sucessLeel" Visible="false"> Successfully !</asp:Label>
            <asp:Button runat="server" ID="Button1" Text="Cancel"  CssClass="btn btn-danger right" OnClick="Cancel" />
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentScript" runat="Server">
    <script>

        const queryString = window.location.search;
        const urlParams = new URLSearchParams(queryString);
        const pId = urlParams.get('pId');

        const checkbox = document.getElementById("Form_chkAgr");
        const cmdSubmit = document.getElementById("Form_cmdSubmit");
        const cmdDelete = document.getElementById("Form_cmdDelete");

        checkbox.addEventListener('change', (event) => {
            if (event.currentTarget.checked) {
                cmdSubmit.removeAttribute('disabled');
                cmdDelete.removeAttribute('disabled');
            } else {
                cmdSubmit.setAttribute('disabled', 'disabled')
                cmdDelete.setAttribute('disabled', 'disabled')
            }
        })

        if (pId !== null && pId.length > 0) {
            const title = document.getElementById("pageTittle");
            const modalCenterTitle = document.getElementById("modalCenterTitle");
            const btnModal = document.getElementById("btnModal");
            title.innerHTML = "Update A Tour package";
            modalCenterTitle.innerHTML = "Update Image";
            btnModal.innerHTML = "Update Image";
        }

        function previewFile() {
            const imageN = document.getElementById("image-name");
            
            var preview = document.querySelector('#<%=mImgUrl.ClientID %>');
             var file = document.querySelector('#<%=imgUp.ClientID %>');
             var reader = new FileReader();

            reader.onloadend = function () {
                preview.src = reader.result;
                let ssss = file.value;
                imageN.innerHTML = ssss.substring(ssss.lastIndexOf('\\') + 1); 
             }

            if (file.files[0]) {
                reader.readAsDataURL(file.files[0]);
             } else {
                 preview.src = "";
             }
         }
    </script>
</asp:Content>

