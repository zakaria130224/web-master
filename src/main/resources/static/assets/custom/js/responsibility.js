// let base_url = $("#domain_url").val();
$(document).ready(function () {
    var dataTable;

    function loadDatatable() {
        dataTable = $("#dataTbl").DataTable({
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
                url: base_url + "/responsibility/DtData"
            },
            columns: [
                {data: "name"},
                {data: "description"},
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
                        return '<button data-toggle="modal" data-target="#updateModal" class="btn btn-icon btn-icon-only btn-secondary btn-icon-style-4" onclick="viewEditModal(' + data + ')"><span class="btn-icon-wrap"><i class="fa fa-pencil"></i></span></button>'
                    },
                    className: ""
                },
            ]
        });
    }


    loadDatatable();
});

function viewEditModal(id) {
    console.log(id);

    $.ajax({
        type: 'GET',
        url: base_url + "/responsibility/update/" + id,
        success: function (data) {
            //console.log(data)
            $("#updateModalBody").html(data);
            enableSelect2();
        },
        error: function (data) {
            console.log(data)
        }
    });

}

function enableSelect2() {
    $(".select2").select2({
        placeholder: "--Please Select--",
        allowClear: true
    });
    $("#input_tags").select2({
        tags: true,
        tokenSeparators: [',', ' ']
    });
}

