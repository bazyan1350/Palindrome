<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="PalindromComplete.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
	<script src='http://ajax.googleapis.com/ajax/libs/angularjs/1.2.26/angular.min.js'></script>
   <link href="css/style.css" rel="stylesheet" />
   <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>

</head>
<body class="page-header-fixed">
    <form id="form1" runat="server">
        <div>
            <div class="clearfix"></div>
            <div class="page-container">
                <div class="page-content">
                    <div class="col-md-11">
                        <div class="row">
                            <div class="portlet purple box">
                                <div class="portlet-title">
                                    <div class="caption"><i class="icon-cogs"></i>Input</div>
                                </div>
                                <div class="portlet-body" style='height: auto; min-height: 300px;'>
                                    <h4 class="block">Input items</h4>
                                    <div ng-app="" ng-controller="createPalindrom">
                                        <div class="col-md-2">Maximun length</div>
                                        <div class="col-md-10">
                                            <input type='returnText' ng-model="Max"></div>
                                        <div class='clear05'>&nbsp;</div>
                                        <div class="col-md-2">Minimun length</div>
                                        <div class="col-md-10">
                                            <input type='returnText' ng-model="Min"></div>
                                        <div class='clear05'>&nbsp;</div>
                                        <div class="col-md-2">Numbers</div>
                                        <div class="col-md-10">
                                            <input type='returnText' ng-model="Aantal"></div>
                                        <div class='clear05'>&nbsp;</div>
                                        <div class="col-md-2">Result</div>
                                        <div class="col-md-10" style='height: auto; min-height: 100px'>
                                            <!--{{fullName() | uppercase}} -->
                                            <hr />
                                            <ul>
                                                <li ng-repeat='x in fullName()'>{{ x + ' -> '+ x.length }}
                                                </li>
                                            </ul>
                                        </div>
                                        <div class='clear05'>&nbsp;</div>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <p id="demo2"></p>

                    </div>
                </div>
            </div>
        </div>
    </form>
    <script src="Scripts/jquery.signalR-2.2.0.js"></script>
    <script src="Scripts/jquery-1.6.4.min.js"></script>

    <script>
        function createPalindrom($scope) {
            $scope.Aantal = [];
            $scope.Max = "";
            $scope.Min = "";
            $scope.fullName = function () {
                var Palindrom = new Array();
                var aantal = $scope.Aantal;
                var min = $scope.Min;
                var max = $scope.Max;
                for (var i = 0; i < aantal; i++) {
                    //Palindrom += createRandomString(min, max) + " <br> " ;  
                    Palindrom[i] = createRandomString(min, max);
                }
                if (Palindrom == '') Palindrom = '';

                return Palindrom;
                //return "bazyan<br/>jjj";							
            }
        }
    </script>


    <script>
        function createRandomString(min, max) {
            var returnText = "";
            var possibleCharchters = "abcdefghijklmnopqrstuvwxyz";
            var randomNumber = Math.floor((Math.random() * (parseInt(max) - parseInt(min))) + parseInt(min));
            //document.getElementById("demo2").innerHTML = 'Min: ' + min + ' <br/>Max:' + max + ' <br/>Random:' + randomNumber;
            randomNumber = parseInt(randomNumber / 2);

            for (var i = 0; i < randomNumber; i++)
                returnText += possibleCharchters.charAt(Math.floor(Math.random() * possibleCharchters.length));

            if (parseInt(randomNumber) % 2 == 0) {
                returnText += returnText.split("").reverse().join("");
            }
            else {
                returnText = returnText +
                       possibleCharchters.charAt(Math.floor((Math.random() * 26) + 97)) +
                       returnText.split("").reverse().join("");
            }

            return returnText;
        }

    </script>
</body>
</html>
