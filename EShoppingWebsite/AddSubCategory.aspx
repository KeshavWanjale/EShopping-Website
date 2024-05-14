<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMP.Master" AutoEventWireup="true" CodeBehind="AddSubCategory.aspx.cs" Inherits="EShoppingWebsite.WebForm5" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container ">
        <div class="form-horizontal ">
            <br />
            <br />

            <h2>Add SubCategory</h2>
            <hr />

            <div class="form-group">
                <asp:Label ID="Label2" CssClass="col-md-2 control-label " runat="server" Text="Main CategoryID"></asp:Label>
                <div class="col-md-3 ">

                    <asp:DropDownList ID="ddlMainCatID" CssClass="form-control" runat="server"></asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorMainCatID" runat="server" CssClass="text-danger " ErrorMessage="*plz Enter Main CategoryID" ControlToValidate="ddlMainCatID" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="form-group">
                <asp:Label ID="Label1" CssClass="col-md-2 control-label " runat="server" Text="Category Name"></asp:Label>
                <div class="col-md-3 ">

                    <asp:TextBox ID="txtSubCategory" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatortxtSubCategoryName" runat="server" CssClass="text-danger " ErrorMessage="*plz Enter Brandname" ControlToValidate="txtSubCategory" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="form-group">
                <div class="col-md-2 "></div>
                <div class="col-md-6 ">

                    <asp:Button ID="btnAddtxtSubCategory" CssClass="btn btn-success " runat="server" Text="Add SubCategory" OnClick="btnAddtxtSubCategory_Click" />

                </div>
            </div>
        </div>

        <h1>Sub Categories</h1>
        <hr />

        <div class="panel panel-default">

            <div class="panel-heading">All Sub Categories</div>


            <asp:Repeater ID="rptrSubCat" runat="server">

                <HeaderTemplate>
                    <table class="table">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Sub-Category</th>
                                <th>Main Category</th>
                                <th>Edit</th>

                            </tr>

                        </thead>

                        <tbody>
                </HeaderTemplate>


                <ItemTemplate>
                    <tr>
                        <th><%# Eval("SubCatID") %> </th>
                        <td><%# Eval("SubCatName") %>   </td>
                        <td><%# Eval("CatName") %>   </td>

                        <td>Edit</td>
                    </tr>
                </ItemTemplate>

                <FooterTemplate>
                    </tbody>

              </table>
                </FooterTemplate>

            </asp:Repeater>

        </div>
    </div>
</asp:Content>
