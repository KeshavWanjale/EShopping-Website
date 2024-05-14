<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignIn.aspx.cs" Inherits="EShoppingWebsite.SignIn" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SignIn</title>

    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1" />
    <meta http-equiv="X-UA-Compatible" content="Google Chrome" />
    <link href="css/Default.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="navbar navbar-default navbar-fixed-top" role="navigation">
                <div class="container">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                            <span class="sr-only">Toggle Navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="Default.aspx">
                            <span>
                                <img src="Icons/Logo.jpg" alt="Eshopping" height="30" />
                                FashionMantra</span>
                        </a>
                    </div>
                    <div class="navbar-collapse collapse">
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="Default.aspx">Home</a></li>
                            <li><a href="#">About</a></li>
                            <li><a href="#">Contact Us</a></li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Products<b class="caret"></b> </a>
                                <ul class="dropdown-menu">
                                    <li><a href="Products.aspx">All Products</a></li>
                                    <li role="separator" class="divider "></li>
                                    <li class="dropdown-header ">Men</li>
                                    <li role="separator" class="divider "></li>
                                    <li><a href="ManShirt.aspx">Topwear</a></li>
                                    <li><a href="ManPants.aspx">Bottomwear</a></li>
                                    <li><a href="ManDenims.aspx">Footwear</a></li>
                                    <li role="separator" class="divider "></li>
                                    <li class="dropdown-header ">Women</li>
                                    <li role="separator" class="divider "></li>
                                    <li><a href="WomanTop.aspx">Topwear</a></li>
                                    <li><a href="womanLegging.aspx">Bottomwear</a></li>
                                    <li><a href="WomanSarees.aspx">Footwear</a></li>
                                </ul>
                            </li>
                            <li><a href="SignUp.aspx">SignUp</a></li>
                            <li class="active"><a href="SignIn.aspx">SignIn</a></li>

                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <!-- Sign In Form starts -->

        <div class="center-page">

            <h2>Sign In Form</h2>
            <hr />

            <label class="col-xs-11">UserName:</label>
            <div class="col-xs-11">
                <asp:TextBox ID="txtUname" runat="server" Class="form-control" placeholder="Enter Your UserName"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorUname" runat="server" ErrorMessage="Plz Enter Valid Username" ControlToValidate="txtUname" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>



            <label class="col-xs-11">Email:</label>
            <div class="col-xs-11">
                <asp:TextBox ID="txtEmail" runat="server" Class="form-control" placeholder="Enter Your Email"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" runat="server" ErrorMessage="Plz Enter Registered Email" ControlToValidate="txtEmail" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>

            <label class="col-xs-11">Password:</label>
            <div class="col-xs-11">
                <asp:TextBox ID="txtPass" runat="server" TextMode="Password" Class="form-control" placeholder="Enter Your password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorPass" runat="server" ErrorMessage="Plz Enter Valid Password" ControlToValidate="txtPass" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>

            <label class="col-md-4">RememberMe</label>
            <div class="col-md-6">
                <asp:CheckBox ID="CheckBox1" runat="server" />
            </div>

            <label class="col-xs-11"></label>
            <div class="col-xs-11">
                <asp:Button ID="txtlogin" Class="btn btn-success" runat="server" Text="Login" OnClick="txtlogin_Click" />
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/SignUp.aspx">Sign Up</asp:HyperLink>
                <br />
                <asp:Label ID="lblMsg" runat="server" ForeColor="Red"></asp:Label>
                <br />
                <asp:HyperLink ID="HLforgotPwd" runat="server" NavigateUrl="~/ForgotPwd.aspx">Forgot Password</asp:HyperLink>
            </div>
            <br />
            <br />
            <br />
            <br />
        </div>




        <!-- Sign In Form ends -->

        <!-- Footer Starts Here -->
        <!--<footer class="footer-pos">
            <div class ="container ">
             <p class ="pull-right "><a href ="#">&nbsp; &nbsp; Back to top &nbsp; &nbsp;</a></p>
                <p class ="pull-right "><a href="#"> Admin Login  </a></p> 
                <p>&copy;2022 FashionMantra.in &middot; <a href ="Default.aspx">Home</a>&middot;<a href ="#">About</a>&middot;<a href ="#">Contact</a>&middot;<a href ="#">Products</a> </p>
            </div>
        </footer>-->
        <!-- Footer Ends Here -->



    </form>


</body>
</html>
