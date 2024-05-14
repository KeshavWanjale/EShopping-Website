<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserHome.aspx.cs" Inherits="EShoppingWebsite.UserHome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Welcome User</title>

    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1" />
    <meta http-equiv="X-UA-Compatible" content="Google Chrome" />
    <link href="css/Default.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous">

    </script>

    <script>
        $(document).ready(function myfunction() {
            $("#btnCart").click(function myfunction() {
                window.location.href = "Cart.aspx"
            });
        });
    </script>

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
                            <li class="active"><a href="Default.aspx">Home</a></li>
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
                            <li>
                                <button id="btnCart" class="btn btn-primary navbar-btn" type="button">
                                Cart<span class="badge" id="pCount" runat="server"></span>

                            </button>
                            </li>
                            <li>
                                <asp:Button ID="btnsignin" runat="server" CssClass="btn btn-default navbar-btn" Text="Sign In" OnClick="signin_Click" />
                                <asp:Button ID="btnsignout" runat="server" CssClass="btn btn-default navbar-btn" Text="Sign Out" OnClick="signout_Click" />
                            </li>

                        </ul>
                    </div>
                </div>
            </div>

        </div>
        <br />
        <br />
        <br />
        <br />
        <br />

        <asp:Label ID="lblSuccess" runat="server" CssClass="text-success"></asp:Label>

        <hr />
        <!-- Footer Starts Here -->
        <footer>
            <div class="container ">
                <p class="pull-right "><a href="#">&nbsp; &nbsp; Back to top &nbsp; &nbsp;</a></p>
                <p class="pull-right "><a href="#">Admin Login  </a></p>
                <p>&copy;2022 FashionMantra.in &middot; <a href="Default.aspx">Home</a>&middot;<a href="#">About</a>&middot;<a href="#">Contact</a>&middot;<a href="#">Products</a> </p>
            </div>
        </footer>
        <!-- Footer Ends Here -->
    </form>
</body>
</html>
