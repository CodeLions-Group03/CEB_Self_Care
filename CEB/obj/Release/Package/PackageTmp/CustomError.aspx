<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomError.aspx.cs" Inherits="CEB.CustomError" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=whatever" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="author" content="CodeLions @ UOR" />
    <meta name="description" content="Final year group project by (sc/2015/9523, sc/2015/9536, sc/2015/9537, sc/2015/9538, sc/2015/9541)" />
    <meta name="keywords" content="ceb, ceylon, electricity, board, dashboard, live, bill, usage" />

    <title>Error !</title>

    <%-- CSS --%>
    <link href="../res/plugins/bootstrap/css/bootstrap.css" rel="stylesheet" />
    <link href="../res/plugins/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link href="../res/css/animate.css" rel="stylesheet" />
    <link href="../res/css/style.css" rel="stylesheet" />
    <link href="../res/css/style-responsive.css" rel="stylesheet" />
    <link href="../res/css/theme.css" rel="stylesheet" id="theme" />

    <%-- JS --%>
    <script src="../res/plugins/jquery/jquery-1.9.1.js"></script>
    <script src="../res/plugins/pace/pace.js"></script>
</head>

<body class="pace-top">
    <%-- begin #page-loader --%>
    <div id="page-loader" class="fade in"><span class="spinner"></span></div>
    <%-- end #page-loader --%>

    <%-- begin #page-container --%>
    <div id="page-container" class="fade">
        <%-- begin error --%>
        <div class="error">
            <div class="error-code m-b-10">Sorry <i class="fa fa-warning"></i></div>
            <div class="error-content">
                <div class="error-message">Some error has occured...</div>
                <div class="error-desc m-b-20">
                    We can't find the page that you're looking for...
                    <br />
                </div>
                <div>
                    <a href="../Dashboard.aspx" class="btn btn-success">Go Back to Dashboard</a>
                </div>
            </div>
        </div>
        <%-- end error --%>

        <%-- begin scroll to top btn --%>
        <a href="javascript:;" class="btn btn-icon btn-circle btn-success btn-scroll-to-top fade" data-click="scroll-top"><i class="fa fa-angle-up"></i></a>
        <%-- end scroll to top btn --%>
    </div>
    <%-- end page container --%>

    <%--page level JS --%>
    <script src="../res/plugins/jquery/jquery-migrate-1.1.0.js"></script>
    <script src="../res/plugins/bootstrap/js/bootstrap.js"></script>
    <script src="../res/plugins/slimscroll/jquery.slimscroll.js"></script>

    <%-- page level JS --%>
    <script src="../res/js/apps.js"></script>

    <script>
        $(document).ready(function () {
            App.init();
        });
	</script>
</body>

</html>
