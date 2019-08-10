var imgSrc = []; //图片路径
var imgFile = []; //文件流
var imgName = []; //图片名字
//选择图片
function imgUpload(obj) {
    var oInput = '#' + obj.inputId;
    var imgBox = '#' + obj.imgBox;
    var btn = '#' + obj.buttonId;
    $(oInput).on("change", function() {
        var fileImg = $(oInput)[0];
        var fileList = fileImg.files;
        for(var i = 0; i < fileList.length; i++) {
            var imgSrcI = getObjectURL(fileList[i]);
            imgName.push(fileList[i].name);
            imgSrc.push(imgSrcI);
            imgFile.push(fileList[i]);
        }
        addNewContent(imgBox);
    })

    //提交触发的函数
    $(btn).on('click', function() {
        if(!limitNum(obj.num)){
            alert("超过限制");
            return false;
        }
        //用formDate对象上传
        var fd = new FormData($('#uploadForm')[0]);

        //获取商品图片
        for(var i=0;i<imgFile.length;i++){
            if(imgFile[i] != null){
                fd.append("files",imgFile[i]);
            }

        }

        //获取商品的颜色
        var colorArr = $(".goods-color");
        for(var i = 0 ; i < colorArr.length ; i++){
            fd.append("colors" , $(colorArr[i]).val());
        }
        //获取商品的描述
        fd.append("content", editor.txt.html());
        //获取商品的名称
        fd.append($("#goods-name").attr("name"),$("#goods-name").val());
        //获取商品的价格
        fd.append($("#goods-price").attr("name"),$("#goods-price").val());
        //获取商品的库存
        fd.append($("#goods-stock").attr("name"),$("#goods-stock").val());

        submit(obj.upUrl, fd);
    })
}
//图片展示
function addNewContent(obj) {
    $(imgBox).html("");
    for(var a = 0; a < imgSrc.length; a++) {
        var oldBox = $(obj).html();
        $(obj).html(oldBox + '<div class="imgContainer"><img title=' + imgName[a] + ' alt=' + imgName[a] + ' src=' + imgSrc[a] + ' onclick="imgDisplay(this)"><p onclick="removeImg(this,' + a + ' , -1)" class="imgDelete">删除</p></div>');
    }
}
//删除
//flag用来标记是否是上传的图片
//true 为上传图片
//false  为原有的图片
function removeImg(obj, index , imgId) {
    //当有id等于-1的时候说明是刚上传的图片，不需要连接后台删除图片
    if(imgId != -1){
        imgSrc.splice(index, 1);
        imgFile.splice(index, 1);
        imgName.splice(index, 1);
        var boxId = "#" + $(obj).parent('.imgContainer').parent().attr("id");
        addNewContent(boxId);
    }else{ //当有id不等于-1的时候说明是商品原有的图片，需要连接后台删除图片
        $.ajax({
            url: "/adminPicture/picture/"+imgId ,
            type: 'delete',
            dataType: 'json',
            contentType: 'application/json;charset=UTF-8',
            success: function (data) {
                if(data == '1'){
                    //后台删除成功之后，删除前端图片
                    imgSrc.splice(index, 1);
                    imgFile.splice(index, 1);
                    imgName.splice(index, 1);
                    var boxId = "#" + $(obj).parent('.imgContainer').parent().attr("id");
                    addNewContent(boxId);
                }
            }
        });
    }

}

//限制图片个数
function limitNum(num){
    if(!num){
        return true;
    }else if(imgFile.length>num){
        return false;
    }else{
        return true;
    }
}

//负责提交数据
function submit(url,data) {
    if(url&&data){
        $.ajax({
            type: "post",
            url: url,
            async: true,
            data: data,
            processData: false,
            contentType: false,
            success: function(dat) {
                console.log("chenggong!");
                alert("增加商品成功！3秒后跳转");
                setTimeout(window.location.href='/adminGood/findByPage',3);
            },
            error: function(e) {
                console.log("增加商品失败！");
            }
        });
    }else{
        alert('请打开控制台查看传递参数！');
    }
}

//图片灯箱
function imgDisplay(obj) {
    var src = $(obj).attr("src");
    var imgHtml = '<div style="width: 100%;height: 100vh;overflow: auto;background: rgba(0,0,0,0.5);text-align: center;position: fixed;top: 0;left: 0;z-index: 1000;"><img src=' + src + ' style="margin-top: 100px;width: 70%;margin-bottom: 100px;"/><p style="font-size: 50px;position: fixed;top: 30px;right: 30px;color: white;cursor: pointer;" onclick="closePicture(this)">×</p></div>'
    $('body').append(imgHtml);
}
//关闭
function closePicture(obj) {
    $(obj).parent("div").remove();
}

//图片预览路径
function getObjectURL(file) {
    var url = null;
    if(window.createObjectURL != undefined) { // basic
        url = window.createObjectURL(file);
    } else if(window.URL != undefined) { // mozilla(firefox)
        url = window.URL.createObjectURL(file);
    } else if(window.webkitURL != undefined) { // webkit or chrome
        url = window.webkitURL.createObjectURL(file);
    }
    return url;
}


//从后台数据读取商品原有的图片
function insertImg(imgList){
    $("#imgBox").html("");
    for(var i = 0 ; i < imgList.length ; i++){
        imgName.push(imgList[i].name);
        imgSrc.push("/file/goodsImg"+imgList[i].name);
        imgFile.push(null);

        var oldBox = $("#imgBox").html();
        $("#imgBox").html(oldBox + '<div class="imgContainer"><img title=' + imgList[i].name + ' alt=' + imgList[i].name + ' src=' + "/file/goodsImg"+imgList[i].name + ' onclick="imgDisplay(this)"><p onclick="removeImg(this,' + a + ' , imgList[i].id)" class="imgDelete">删除</p></div>');
    }

}

