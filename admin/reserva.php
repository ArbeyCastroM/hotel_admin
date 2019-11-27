<?php  
session_start();  
if(!isset($_SESSION["user"]))
{
 header("location:index.php");
}
?> 

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
      <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title> HOTEL Softel </title>
	<!-- Bootstrap Styles-->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
     <!-- FontAwesome Styles-->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
    
	<link rel="stylesheet" href="assets/css/morris.css">
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js//raphael-min.js"></script>
	<script src="assets/js/morris.min.js"></script>

   
        <!-- Custom Styles-->
    <link href="assets/css/custom-styles.css" rel="stylesheet" />
     <!-- Google Fonts-->
   <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
     <!-- TABLE STYLES-->
    <link href="assets/js/dataTables/dataTables.bootstrap.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">


</head>
<body>
    <div id="wrapper">
        
        <nav class="navbar navbar-default top-navbar" role="navigation">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                    <span class="sr-only">Navegación de palanca</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <h1 align="center"><img src="assets/img/softel.png"></h1><a class="navbar-brand" href="home.php"><?php echo $_SESSION["user"]; ?> </a>
            </div>

            <ul class="nav navbar-top-links navbar-right">
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
                        <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="usersetting.php"><i class="fa fa-user fa-fw"></i> Perfil del usuario</a>
                        </li>
                        <li><a href="settings.php"><i class="fa fa-gear fa-fw"></i> Configuraciones</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="logout.php"><i class="fa fa-sign-out fa-fw"></i> Cerrar sesión</a>
                        </li>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
            </ul>
        </nav>
        <!--/. NAV TOP  -->
        <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">

                    <li>
                        <a class="active-menu"  href="home.php"><i class="fa fa-dashboard"></i> Estado Reservaciones </a>
                    </li>
                    <li>
                        <a href="messages.php"><i class="fa fa-desktop"></i> Boletines informativos </a>
                    </li>
                    <li>
                        <a href="payment.php"><i class="fas fa-money-check-alt"></i> Pagos y Facturación </a>
                    </li>
                    <li>
                        <a  href="profit.php"><i class="fa fa-bar-chart-o"></i> Informes </a>
                    </li>
                    <li>
                        <a  href="gestion_personal.php"><i class="fas fa-user-friends"></i> Gestión de Personal </a>
                    </li>
                    <li>
                        <a  href="gestion_activos.php"><i class="fa fa-qrcode"></i> Gestión de Activos </a>
                    </li>
                    <li>
                        <a href="logout.php"><i class="fa fa-sign-out fa-fw"></i> Cerrar sesión </a>
                    </li>
                    

                    
            </div>

        </nav>
        <!-- /. NAV SIDE  -->
        <div id="page-wrapper" >
            <div id="page-inner">
             <div class="row">
                    <div class="col-md-12">
                        <h1 class="page-header">
                            RESERVACION <small></small>
                        </h1>
                    </div>
                </div> 
                 
                                 
            <div class="row">
                
                <div class="col-md-5 col-sm-5">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
INFORMACION PERSONAL
                        </div>
                        <div class="panel-body">
                        <form name="form" method="post">
                            <div class="form-group">
                                            <label>Titulo*</label>
                                            <select name="title" class="form-control" required >
                                                <option value selected ></option>
                                                <option value="Dr.">Dr.</option>
                                                <option value="Miss.">Miss.</option>
                                                <option value="Mr.">Mr.</option>
                                                
                                            </select>
                              </div>
                              <div class="form-group">
                                            <label>Nombre</label>
                                            <input name="fname" class="form-control" required>
                                            
                               </div>
                               <div class="form-group">
                                            <label>Apellido</label>
                                            <input name="lname" class="form-control" required>
                                            
                               </div>
                               <div class="form-group">
                                            <label>Email</label>
                                            <input name="email" type="email" class="form-control" required>
                                            
                               </div>
                               <div class="form-group">
                                            <label>Nacionalidad*</label>
                                            <label class="radio-inline">
                                                <input type="radio" name="nation"  value="Colombiano" checked="">Colombiano
                                            </label>
                                            <label class="radio-inline">
                                                <input type="radio" name="nation"  value="Otro ">Otro 
                                            </label>
                         
                                </div>
                                <?php

                                $countries = array("Afghanistan", "Albania", "Algeria", "American Samoa", "Andorra", "Angola", "Anguilla", "Antarctica", "Antigua and Barbuda", "Argentina", "Armenia", "Aruba", "Australia", "Austria", "Azerbaijan", "Bahamas", "Bahrain", "Bangladesh", "Barbados", "Belarus", "Belgium", "Belize", "Benin", "Bermuda", "Bhutan", "Bolivia", "Bosnia and Herzegowina", "Botswana", "Bouvet Island", "Brazil", "British Indian Ocean Territory", "Brunei Darussalam", "Bulgaria", "Burkina Faso", "Burundi", "Cambodia", "Cameroon", "Canada", "Cape Verde", "Cayman Islands", "Central African Republic", "Chad", "Chile", "China", "Christmas Island", "Cocos (Keeling) Islands", "Colombia", "Comoros", "Congo", "Congo, the Democratic Republic of the", "Cook Islands", "Costa Rica", "Cote d'Ivoire", "Croatia (Hrvatska)", "Cuba", "Cyprus", "Czech Republic", "Denmark", "Djibouti", "Dominica", "Dominican Republic", "East Timor", "Ecuador", "Egypt", "El Salvador", "Equatorial Guinea", "Eritrea", "Estonia", "Ethiopia", "Falkland Islands (Malvinas)", "Faroe Islands", "Fiji", "Finland", "France", "France Metropolitan", "French Guiana", "French Polynesia", "French Southern Territories", "Gabon", "Gambia", "Georgia", "Germany", "Ghana", "Gibraltar", "Greece", "Greenland", "Grenada", "Guadeloupe", "Guam", "Guatemala", "Guinea", "Guinea-Bissau", "Guyana", "Haiti", "Heard and Mc Donald Islands", "Holy See (Vatican City State)", "Honduras", "Hong Kong", "Hungary", "Iceland", "India", "Indonesia", "Iran (Islamic Republic of)", "Iraq", "Ireland", "Israel", "Italy", "Jamaica", "Japan", "Jordan", "Kazakhstan", "Kenya", "Kiribati", "Korea, Democratic People's Republic of", "Korea, Republic of", "Kuwait", "Kyrgyzstan", "Lao, People's Democratic Republic", "Latvia", "Lebanon", "Lesotho", "Liberia", "Libyan Arab Jamahiriya", "Liechtenstein", "Lithuania", "Luxembourg", "Macau", "Macedonia, The Former Yugoslav Republic of", "Madagascar", "Malawi", "Malaysia", "Maldives", "Mali", "Malta", "Marshall Islands", "Martinique", "Mauritania", "Mauritius", "Mayotte", "Mexico", "Micronesia, Federated States of", "Moldova, Republic of", "Monaco", "Mongolia", "Montserrat", "Morocco", "Mozambique", "Myanmar", "Namibia", "Nauru", "Nepal", "Netherlands", "Netherlands Antilles", "New Caledonia", "New Zealand", "Nicaragua", "Niger", "Nigeria", "Niue", "Norfolk Island", "Northern Mariana Islands", "Norway", "Oman", "Pakistan", "Palau", "Panama", "Papua New Guinea", "Paraguay", "Peru", "Philippines", "Pitcairn", "Poland", "Portugal", "Puerto Rico", "Qatar", "Reunion", "Romania", "Russian Federation", "Rwanda", "Saint Kitts and Nevis", "Saint Lucia", "Saint Vincent and the Grenadines", "Samoa", "San Marino", "Sao Tome and Principe", "Saudi Arabia", "Senegal", "Seychelles", "Sierra Leone", "Singapore", "Slovakia (Slovak Republic)", "Slovenia", "Solomon Islands", "Somalia", "South Africa", "South Georgia and the South Sandwich Islands", "Spain", "Sri Lanka", "St. Helena", "St. Pierre and Miquelon", "Sudan", "Suriname", "Svalbard and Jan Mayen Islands", "Swaziland", "Sweden", "Switzerland", "Syrian Arab Republic", "Taiwan, Province of China", "Tajikistan", "Tanzania, United Republic of", "Thailand", "Togo", "Tokelau", "Tonga", "Trinidad and Tobago", "Tunisia", "Turkey", "Turkmenistan", "Turks and Caicos Islands", "Tuvalu", "Uganda", "Ukraine", "United Arab Emirates", "United Kingdom", "United States", "United States Minor Outlying Islands", "Uruguay", "Uzbekistan", "Vanuatu", "Venezuela", "Vietnam", "Virgin Islands (British)", "Virgin Islands (U.S.)", "Wallis and Futuna Islands", "Western Sahara", "Yemen", "Yugoslavia", "Zambia", "Zimbabwe");

                                ?>
                                <div class="form-group">
                                            <label>Pasaporte*</label>
                                            <select name="country" class="form-control" required>
                                                <option value selected ></option>
                                                <?php
                                                foreach($countries as $key => $value):
                                                echo '<option value="'.$value.'">'.$value.'</option>'; //close your tags!!
                                                endforeach;
                                                ?>
                                            </select>
                                </div>
                                <div class="form-group">
                                            <label>Phone Number</label>
                                            <input name="phone" type ="text" class="form-control" required>
                                            
                               </div>
                               
                        </div>
                        
                    </div>
                </div>
                
                  
            <div class="row">
                <div class="col-md-6 col-sm-6">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                     INFORMACIÓN DE RESERVA

                        </div>
                        <div class="panel-body">
                                <div class="form-group">
                                            <label>Tipo de habitación*</label>
                                            <select name="troom"  class="form-control" required>
                                                <option value selected ></option>
                                                <option value="Superior Room">  HABITACIÓN SUPERIOR</option>
                                                <option value="Deluxe Room">HABITACIÓN DE LUJO</option>
                                                <option value="Guest House">CASA DE HUESPEDES</option>
                                                <option value="Single Room">HABITACIÓN INDIVIDUAL
</option>
                                            </select>
                              </div>
                              <div class="form-group">
                                            <label>Tipo de cama
</label>
                                            <select name="bed" class="form-control" required>
                                                <option value selected ></option>
                                                <option value="Single">Simple</option>
                                                <option value="Double">Doble</option>
                                                <option value="Triple">Triple</option>
                                                <option value="Quad">Cuatro</option>
                                                <option value="None">Ninguna</option>
                                                
                                             
                                            </select>
                              </div>
                              <div class="form-group">
                                            <label>No. de habitación *</label>
                                            <select name="nroom" class="form-control" required>
                                                <option value selected ></option>
                                                <option value="101">101</option>
                                                <option value="102">102</option>
                                                <option value="103">103</option>
                                                <option value="104">104</option>
                                                <option value="105">105</option>
                                                <option value="106">106</option>
                                                <option value="107">107</option> 
                                                <option value="108">108</option>
                                                <option value="109">109</option>
                                                <option value="110">110</option>
                                                <option value="201">201</option>
                                                <option value="202">202</option>
                                                <option value="203">203</option>
                                                <option value="204">204</option>
                                                <option value="205">205</option>
                                                <option value="206">206</option>
                                                <option value="207">207</option> 
                                                <option value="208">208</option>
                                                <option value="209">209</option>
                                                <option value="210">210</option>
                                            </select>
                              </div>
                             
                             
                              <div class="form-group">
                                            <label>Régimen de comidas</label>
                                            <select name="meal" class="form-control"required>
                                                <option value selected ></option>
                                                <option value="Room only">Sólo habitación
</option>
                                                <option value="Breakfast">Desayuno</option>
                                                <option value="Half Board">almuerzo</option>
                                                <option value="Full Board">Pensión completa</option>
                                                
                                                
                                             
                                            </select>
                              </div>
                              <div class="form-group">
                                            <label>Entrada</label>
                                            <input name="cin" type ="date" class="form-control">
                                            
                               </div>
                               <div class="form-group">
                                            <label>Salida</label>
                                            <input name="cout" type ="date" class="form-control">
                                            
                               </div>
                       </div>
                        
                    </div>
                </div>
                
                
                <div class="col-md-12 col-sm-12">
                    <div class="well">
                        <h4>VERIFICACIÓN HUMANA</h4>
                        <p>Escriba debajo de este código
 <?php $Random_code=rand(); echo$Random_code; ?> </p><br />
                        <p>Ingrese el código aleatorio
<br /></p>
                            <input  type="text" name="code1" title="random code" />
                            <input type="hidden" name="code" value="<?php echo $Random_code; ?>" />
                        <input type="submit" name="submit" class="btn btn-primary">
                        <?php
                            if(isset($_POST['submit']))
                            {
                            $code1=$_POST['code1'];
                            $code=$_POST['code']; 
                            if($code1!="$code")
                            {
                            $msg="Invalide code"; 
                            }
                            else
                            {
                            
                                    $con=mysqli_connect("localhost","root","","hotel");
                                    $check="SELECT * FROM roombook WHERE email = '$_POST[email]'";
                                    $rs = mysqli_query($con,$check);
                                    $data = mysqli_fetch_array($rs, MYSQLI_NUM);
                                    if($data[0] > 1) {
                                        echo "<script type='text/javascript'> alert('El usuario ya existe')</script>";
                                        
                                    }

                                    else
                                    {
                                        $new ="Not Conform";
                                        $newUser="INSERT INTO `roombook`(`Title`, `FName`, `LName`, `Email`, `National`, `Country`, `Phone`, `TRoom`, `Bed`, `NRoom`, `Meal`, `cin`, `cout`,`stat`,`nodays`) VALUES ('$_POST[title]','$_POST[fname]','$_POST[lname]','$_POST[email]','$_POST[nation]','$_POST[country]','$_POST[phone]','$_POST[troom]','$_POST[bed]','$_POST[nroom]','$_POST[meal]','$_POST[cin]','$_POST[cout]','$new',datediff('$_POST[cout]','$_POST[cin]'))";
                                        if (mysqli_query($con,$newUser))
                                        {
                                            echo "<script type='text/javascript'> alert('Su solicitud de reserva ha sido enviada')</script>";
                                            
                                        }
                                        else
                                        {
                                            echo "<script type='text/javascript'> alert('Error al agregar usuario en la base de datos')</script>";
                                            
                                        }
                                    }

                            $msg="Tu código es correcto
";
                            }
                            }
                            ?>
                        </form>
                            
                    </div>
                </div>
            </div>
         <!-- /. PAGE WRAPPER  -->
     <!-- /. WRAPPER  -->
    <!-- JS Scripts-->
    <!-- jQuery Js -->
    <script src="assets/js/jquery-1.10.2.js"></script>
      <!-- Bootstrap Js -->
    <script src="assets/js/bootstrap.min.js"></script>
    <!-- Metis Menu Js -->
    <script src="assets/js/jquery.metisMenu.js"></script>
     <!-- DATA TABLE SCRIPTS -->
    <script src="assets/js/dataTables/jquery.dataTables.js"></script>
    <script src="assets/js/dataTables/dataTables.bootstrap.js"></script>
        <script>
            $(document).ready(function () {
                $('#dataTables-example').dataTable();
            });
    </script>
         <!-- Custom Js -->
    <script src="assets/js/custom-scripts.js"></script>
    
   
</body>
</html>
<script>
Morris.Bar({
 element : 'chart',
 data:[<?php echo $chart_data; ?>],
 xkey:'date',
 ykeys:['profit'],
 labels:['Profit'],
 hideHover:'auto',
 stacked:true
});
</script>