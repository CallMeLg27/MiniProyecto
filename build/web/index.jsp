<%-- 
    Document   : index
    Created on : Aug 25, 2020, 3:52:11 PM
    Author     : Usuario
--%>

<%@page import="pe.edu.unmsm.sistemas.Articulo"%>
<%@page import="pe.edu.unmsm.sistemas.Articulos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <title>JSP Page</title>
        <style type="text/css">
            .fondo{
                background-image: url("/MiniProyecto/imagenes/fondo.jpg"); 
                width:100%; 
                height:100%;
                background-size: cover;
                background-position: center;
            }
            .titulo{
                color: black;
            }
        </style>
    </head>
    <body>
        <div class="fondo">
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                <a class="navbar-brand" href="#">MiniProyecto</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item active">
                            <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link" href="#">Ver carrito</a>
                        </li>
                    </ul>
                    <span class="navbar-text">
                        Llena tu carrito de compras!
                    </span>
                </div>
            </nav>


            <div class="container mt-5">
                <div class="row">
                    <%
                        Articulos catalogo = Articulos.Singleton();
                        for (Articulo item : catalogo.getArticulos()) {
                    %>
                    <div class="col-md-4">
                        <div class="card my-2">
                            <div class="card-header text-center">
                                En venta
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-7">
                                        <form action="index.jsp" method="get">
                                            <p><strong>Producto: </strong><%= item.getDescripcion()%> </p>
                                            <p><strong>Precio: </strong>S/. <%= item.getPrecioDeVenta()%> </p>
                                            <p><strong>Stock: </strong> <%= item.getStock()%> </p>
                                            <button class="btn btn-primary mt-2" 
                                                    data-toggle="modal" data-target="#exampleModal<%= item.getCodigo()%>"
                                                    type="button"
                                                    >Agregar</button>
                                            <button class="btn btn-danger mt-2"
                                                    type="button"
                                                    >Quitar</button>
                                            <!-- Modal -->
                                            <div class="modal fade" id="exampleModal<%= item.getCodigo()%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                <div class="modal-dialog" role="document">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="exampleModalLabel">Ingrese la cantidad de productos</h5>
                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                <span aria-hidden="true">&times;</span>
                                                            </button>
                                                        </div>
                                                        <div class="modal-body">
                                                            <div class="form-group">
                                                                <input class="form-control" type="number"
                                                                       name="cantidad"
                                                                       ></input>
                                                            </div>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                            <button type="submit" class="btn btn-primary"
                                                                    name="codigo"
                                                                    value="<%= item.getCodigo()%>"
                                                                    >Save changes</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                    <div clas="col-md-5">
                                        <img src="/MiniProyecto/imagenes/<%= item.getUrl()%>.jpg" width="140" height="155">
                                    </div>                              
                                </div>
                            </div>
                        </div>
                    </div>
                    <%
                        }
                        String codigo = request.getParameter("codigo");
                        String cantidad = request.getParameter("cantidad");
                        out.println(codigo + cantidad);
                    %>
                </div>
            </div>
        </div>    
    </body>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
</html>