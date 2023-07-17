// let base_url = $("#domain_url").val();

var dataTable;

function loadDatatable() {
    dataTable = $("#userTbl").DataTable({
        lengthMenu: [
            [5, 10, 25, -1],
            [5, 10, 25, 'All'],
        ],
        processing: true,
        serverSide: true,
        ordering: true,
        initComplete: function () {
            $('.dataTables_filter input').unbind();
            $('.dataTables_filter input').bind('keyup', function (e) {
                var code = e.keyCode || e.which;
                if (code == 13) {
                    dataTable.search(this.value).draw();
                }
            });
        },

        ajax: {
            url: base_url + "/user/DtData"
        },
        columns: [
            {data: "name"},
            {data: "loginName"},
            {data: "email"},
            {data: "phone"},
            {
                data: "active",
                render: function (data) {
                    if (data === true) {
                        return `<span class="badge badge-success badge-pill mt-15 mr-10">Active</span>`;
                    } else {
                        return `<span class="badge badge-danger badge-pill mt-15 mr-10">InActive</span>`;
                    }
                }
            },
            {
                data: "id",
                render: function (data) {
                    //return '<span data-toggle="modal" data-target="#updateUser" class="btn badge badge-dark badge-pill cursor-pointer" onclick="viewEditModal(' + data + ')" ><span class="glyphicon glyphicon-pencil"></span> Edit</span>'
                    return '<button data-toggle="modal" data-target="#updateUser" class="btn btn-icon btn-icon-only btn-secondary btn-icon-style-4" onclick="viewEditModal(' + data + ')"><span class="btn-icon-wrap"><i class="fa fa-pencil"></i></span></button>'
                },
                className: ""
            },
        ]
    });
}

$(document).ready(function () {
    loadDatatable();
    addModalScript();
});

function addModalScript() {
    let DTable = $("#responsibilityTbl").DataTable({
        lengthMenu: [
            [5, 10, 25, -1],
            [5, 10, 25, 'All'],
        ],
        searching: true,
        order: false,
        columns: [
            {
                visible: false,
                searching: false
            },
            null,
            null,
            null
        ]
    });

    // add items to table and remove from select box
    $("#addRes").on("click", function (e) {
        console.log("Inside addRes")
        if ($("#responsibility").val() == "") {
            alert("Please select a menu!!");
        } else {
            // add rows
            DTable.row.add([
                $("#responsibility").val(),
                $("#responsibility option:selected").text(),
                $("#primary").prop("checked") ? true : false,
                `<button type='button' class='btn btn-icon btn-icon-only btn-secondary btn-icon-style-4 removeBtn'> <span class='btn-icon-wrap'><i class='fa fa-trash'></i></span> </button>`
            ]).draw(false);
            //delete item from dropdown
            $("#responsibility option:selected").remove();
        }
        clearMapBlock();
    })

    // remove items from table and add to select box
    DTable.on("click", ".removeBtn", function () {
        // add to select box
        $("#responsibility").append(`<option value="` + DTable.row($(this).parents("tr")).data()[0] + `"> ` + DTable.row($(this).parents("tr")).data()[1] + ` </option>`)

        // remove row from table
        DTable.row($(this).parents("tr")).remove().draw();
        clearMapBlock();

    });

    function clearMapBlock() {
        $("#primary").prop('checked', false);
        $("#responsibility").val("").change();
    }
}

function getUserData() {
    let userData = {
        name: $("#name").val(),
        active: $("#active").prop("checked") ? true : false,
        loginName: $("#loginName").val(),
        email: $("#email").val(),
        phone: $("#phone").val(),

        mapList: getMapTableData()
    };
    console.log(userData)
    return userData;
}

function getMapTableData() {
    let data = [];
    $("#responsibilityTbl").DataTable().rows().data().toArray().forEach(item => {
        console.log(item)
        data.push({
            responsibilityId: item[0],
            responsibilityName: item[1],
            primary: item[2],
        });
    })

    return data;
}

function addUser() {
    let userData = getUserData();
    if (!checkEmpty(userData)) {
        return false;
    }
    $.ajax({
        type: 'POST',
        url: base_url + "/user/save",
        data: {
            dtoUser: JSON.stringify(userData)
        },
        success: function (res) {

            if (res.ResponseHeader.ResultCode == 0) {
                $('#addUser').modal('hide');
                showAlertMessage('success', res.ResponseHeader.ResultDesc);
                $('#userTbl').DataTable().ajax.reload();
            } else {
                $('#addUser').modal('hide');
                showAlertMessage('failed', res.ResponseHeader.ResultDesc);
            }

        },
        error: function (resultData) {
            $('#addUser').modal('hide');
            showAlertMessage('warning', "Something Went wrong!");
        }
    });
}

function checkEmpty(userData) {
    if (userData.name == "") {
        showMsg("Name can't be empty!")
        return false;
    }

    return true;
}

function showMsg(data) {
    var msg = `<div class="alert alert-warning alert-wth-icon alert-dismissible fade show" role="alert">
                            <span class="alert-icon-wrap"><i class="zmdi zmdi-close-circle"></i></span> ` + data + `
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                <span aria-hidden="true">x</span>
                            </button>
                        </div>`;
    $("#modalMsg").html(msg);

}

function viewEditModal(id) {
    console.log(id);

    $.ajax({
        type: 'GET',
        url: base_url + "/user/update/" + id,
        success: function (data) {
            //console.log(data)
            $("#userUpdateMdl").html(data);
            //updateModalScript.init();
        },
        error: function (data) {
            console.log(data)
        }
    });

}

var updateModalScript = {
    init: function () {
        enableSelect2();
        addModalScript();
    }
}



