<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <title>风叶 - 用户管理</title>
    <jsp:include page="../includes/header.jsp"/>

</head>

<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">

    <!-- Sidebar -->
    <jsp:include page="../includes/menu.jsp"/>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

        <!-- Main Content -->
        <div id="content">

            <!-- Topbar -->
            <jsp:include page="../includes/nav.jsp"/>
            <!-- End of Topbar -->
            <div class="container">
                <div class="row justify-content-center align-self-center" >
                    <div class="align-self-center col-lg-8" >
<%--                        <form class="shadow mb-4 align-items-center" action="/admin/save" method="post" >--%>
                        <form:form cssClass="shadow mb-4 align-items-center" action="/admin/save" method="post" modelAttribute="admin">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">${admin.id == null ? "新增" : "编辑"}管理员</h6>
                            </div>
                            <div class="card-body">
                                <form:hidden path="id"/>
                                <div class="form-group row">
                                    <label for="email" class="col-sm-2 col-form-label">Email</label>
                                    <div class="col-sm-10">
<%--                                        <input type="email" class="form-control" id="email" name="email">--%>
                                        <form:input path="email" cssClass="form-control required" placeholder="Email"/>
                                    </div>
                                </div>
                            </div>

                            <div class="card-footer">
                                <button type="button" class="btn btn-default" onclick="history.go(-1)">返回</button>
                                <button type="submit" class="btn btn-primary float-right">保存</button>
                            </div>
                        </form:form>
<%--                        </form>--%>
                        <div class="alert alert-${baseResult.status == 200 ? "success":"danger"} alert-dismissible" ${baseResult == null ? "style='display:none'" : ""}>
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                            ${baseResult.message}
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <!-- End of Main Content -->
        <!-- Footer -->
        <jsp:include page="../includes/copyright.jsp"/>
        <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

</div>
<!-- End of Page Wrapper -->

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>

<jsp:include page="../includes/footer.jsp"/>

<tags:modal message='Select "Logout" below if you are ready to end your current session.' title="Ready to Leave?" ok="Logout"/>

</body>

</html>
