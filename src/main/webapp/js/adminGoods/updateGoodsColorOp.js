//点击增加图片
function addColor() {
    $("#color-div").append(
        "<div class=row>" +
        "<select class=\"form-control col-sm-8 goods-color\" name=colors>" +
        "<option>白色</option>" +
        "<option>黑色</option>" +
        "<option>金色</option>" +
        "<option>银色</option>" +
        "<option>玫瑰金</option>" +
        "</select>" +
        "<button type=button class=\"btn btn-link delete-color\" onclick=deleteColor(this)>删除颜色</button>" +
        "</div>");
};

function deleteColor(currentNode){
    $(currentNode).parent().remove();
};

function deleteFormerColor(currentNode){
    $.ajax({
        url: "/adminColor/color/"+$(currentNode).attr("colorId") ,
        type: 'delete',
        dataType: 'json',
        contentType: 'application/json;charset=UTF-8',
        success: function (data) {
            if(data == '1'){
                $(currentNode).parent().remove();
            }
        }
    });

};



