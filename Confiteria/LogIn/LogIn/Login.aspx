<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="LogIn.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" />
    <link rel="stylesheet" href="css/estilos.css" />
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <title>Login</title>
    <script>
        function InsertOk() {
            setTimeout(function () { swal("Usuario Registrado Correctamente!"); }, 2000);

        }
        function userNotExist() {
            swal("Usuario  o Contraseña incorrecto, intente nuevamente!");
        }
    </script>
</head>
<body>

    <div class="container">
        <div class="d-flex justify-content-center h-100">
            <div class="card">
                <div class="card-header">
                    <h3>INGRESA!</h3>
                    <div class="d-flex justify-content-end social_icon">
                        <a href="https://www.facebook.com/encode.sa/"><span><i class="fab fa-facebook-square"></i></span></a>
                        <span><i class="fab fa-instagram"></i></span>
                        <span><i class="fab fa-twitter-square"></i></span>
                    </div>
                </div>
                <div class="card-body">
                    <form runat="server">
                        <div class="input-group form-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"><i class="fas fa-user"></i></span>
                            </div>

                            <asp:TextBox runat="server" CssClass="form-control" placeholder="Usuario" ID="txtUsuario" />
                        </div>
                        <div class="input-group form-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"><i class="fas fa-key"></i></span>
                            </div>

                            <asp:TextBox runat="server" type="password" CssClass="form-control" placeholder="Contraseña" ID="txtContraseña" />
                        </div>

                        <div class="form-group d-flex justify-content-center">
                            <asp:Button Text="Iniciar Sesion!" runat="server" CssClass="btn float-right login_btn" ID="btnIniciar" OnClick="btnIniciar_Click" />
                        </div>
                 
                    </form>
                </div>
            </div>
        </div>
    </div>
    
</body>
</html>
