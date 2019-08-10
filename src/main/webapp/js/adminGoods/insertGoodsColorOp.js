function addColor() {
    $("#color-div").append(
        "<div class=row>" +
        "<select class=\"form-control col-sm-8 goods-color\" name=colors>" +
        "<option value='白色'>白色</option>" +
        "<option value='黑色'>黑色</option>" +
        "<option value='金色'>金色</option>" +
        "<option value='银色'>银色</option>" +
        "<option value='玫瑰金'>玫瑰金</option>" +
        "</select>" +
        "<button type=button class=\"btn btn-link delete-color\" onclick=deleteColor(this)>删除颜色</button>" +
        "</div>");
};

function deleteColor(currentNode){
    $(currentNode).parent().remove();
};