<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <LINK rel="Bookmark" href="/favicon.ico" >
    <LINK rel="Shortcut Icon" href="/favicon.ico" />
    <!--[if lt IE 9]>
    <script type="text/javascript" src="lib/html5.js"></script>
    <script type="text/javascript" src="lib/respond.min.js"></script>
    <script type="text/javascript" src="lib/PIE_IE678.js"></script>
    <![endif]-->
    <link rel="stylesheet" type="text/css" href="${basePath}static/h-ui/css/H-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="${basePath}static/h-ui.admin/css/H-ui.admin.css" />
    <link rel="stylesheet" type="text/css" href="${basePath}lib/Hui-iconfont/1.0.7/iconfont.css" />
    <link rel="stylesheet" type="text/css" href="${basePath}lib/icheck/icheck.css" />
    <link rel="stylesheet" type="text/css" href="${basePath}static/h-ui.admin/skin/default/skin.css" id="skin" />
    <link rel="stylesheet" type="text/css" href="${basePath}static/h-ui.admin/css/style.css" />
    <!--[if IE 6]>
    <script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
    <script>DD_belatedPNG.fix('*');</script>
    <![endif]-->
    <link href="${basePath}lib/webuploader/0.1.5/webuploader.css" rel="stylesheet" type="text/css" />

    <link href="${basePath}lib/webuploader/0.1.5/webuploader.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="http://cache.amap.com/lbs/static/main1119.css"/>
    <script src="http://cache.amap.com/lbs/static/es5.min.js"></script>
    <script src="http://webapi.amap.com/maps?v=1.3&key=0005688d9e56e95e380a2803cf3f04d8"></script>
    <script type="text/javascript" src="http://cache.amap.com/lbs/static/addToolbar.js"></script>

</head>
<body>
<div class="page-container">
    <form action="" method="post" class="form form-horizontal" id="form-article-add">
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>房源名称：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="" placeholder="输入楼盘名称" id="house_name" name="house_name">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>所在城市：</label>
            <div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
				<select class="select" name="city" id="city" onchange="cityChange(this)">
                    <option value="">选择城市</option>
                <#list cityList as cp>
                    <option value="${cp.city_id}">${cp.city_name}</option>
                </#list>
                </select>
				</span> </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>所在区县：</label>
            <div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
				<select class="select" name="district" id="district"  onchange="districtChange(this)">
                    <option value="">选择区县</option>
                </select>
				</span> </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>所在商圈：</label>
            <div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
				<select class="select" name="trade_Area" id="trade_Area" onchange="trade_AreaChange(this)">
                    <option value="">选择商圈</option>
                </select>
				</span> </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>所在楼盘：</label>
            <div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
				<select class="select" size="1" name="building" id="building" onchange="buildingOnchange(this)">
                    <option value="" selected>请选楼盘</option>
                </select>
				</span> </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>地址：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="" placeholder="输入地址" id="house_address" name="house_address">
                <div class="formControls col-xs-8 col-sm-10" style= height:500px;">
                    <div id="container"></div>
                </div>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>房源类型：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <div class="skin-minimal">
                    <div class="radio-box">
                        <input type="radio" id="house_style_radio_1" value="出租" name="house_style" checked>
                        <label for="house_style_radio_1">出租</label>
                    </div>
                    <div class="radio-box">
                        <input type="radio" id="house_style_radio_2" value="出售" name="house_style">
                        <label for="house_style_radio_2">出售</label>
                    </div>
                </div>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">房源配套设施：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <div class="skin-minimal">
                <#list listsf as sf>
                    <div class="check-box">
                        <input type="checkbox" name="sf_name" value="${sf.id}">
                        <label for="checkbox-1">${sf.name}</label>
                    </div>
                </#list>
                </div>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>价格：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="" placeholder="输入价格" id="house_money" name="house_money" style=" width:230px">
				<span class="select-box" style="width: 120px">
				<select class="select" name="house_unit" id="house_unit">
                    <option value="" selected>请选择单位</option>
                    <option value="元/m²">元/m²</option>
                    <option value="元/m²/天">元/m²/天</option>
                    <option value="元/月">元/月</option>
                    <option value=" 元/㎡.月"> 元/㎡.月</option>
                    <option value="万元">万元</option>
                </select>
				</span>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">详细信息：</label>
            <div class="formControls col-xs-8 col-sm-9">
                户型：<input type="text" name="house_type" id="house_type" placeholder="输入户型" value="" class="input-text" style=" width:25%">室
                面积：<input type="text" name="house_mi" id="house_mi" placeholder="输入面积" value="" class="input-text" style=" width:25%">㎡
                楼层+房号：<input type="text" name="house_num" id="house_num" placeholder="输入楼层+房号，例如：12层-12~14号" value="" class="input-text" style=" width:25%">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"></label>
            <div class="formControls col-xs-8 col-sm-9">
                朝向：<input type="text" name="house_orientation" id="house_orientation" placeholder="输入朝向" value="" class="input-text" style=" width:25%">
                装修类型：<input type="text" name="house_decoration_type" id="house_decoration_type" placeholder="输入装修类型" value="" class="input-text" style=" width:25%">
                入住时间：<input type="text" name="house_intime" id="house_intime" placeholder="输入入住时间" value="" class="input-text" style=" width:25%">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>联系人：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="" placeholder="输入联系人" id="house_linkman" name="house_linkman">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>联系电话：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="" placeholder="输入联系电话" id="house_phone" name="house_phone">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">图片上传(建议尺寸： 宽x高：750*565)：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <div class="uploader-list-container">
                    <div class="queueList">
                        <div id="dndArea" class="placeholder">
                            <div id="filePicker-2"></div>
                            <p>或将照片拖到这里，单次最多可选300张</p>
                        </div>
                    </div>
                    <div class="statusBar" style="display:none;">
                        <div class="progress"> <span class="text">0%</span> <span class="percentage"></span> </div>
                        <div class="info"></div>
                        <div class="btns">
                            <div id="filePicker2"></div>
                            <div class="uploadBtn">开始上传</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <input type="hidden" name="himgae" id="himgae" value="" />
        <div class="row cl">
            <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
                <button onClick="" class="btn btn-primary radius" type="submit"><i class="Hui-iconfont">&#xe632;</i> 添加</button>
            </div>
        </div>
    </form>
</div>

<script type="text/javascript" src="${basePath}lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="${basePath}lib/layer/2.1/layer.js"></script>
<script type="text/javascript" src="${basePath}lib/icheck/jquery.icheck.min.js"></script>
<script type="text/javascript" src="${basePath}lib/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="${basePath}lib/jquery.validation/1.14.0/jquery.validate.min.js"></script>
<script type="text/javascript" src="${basePath}lib/jquery.validation/1.14.0/validate-methods.js"></script>
<script type="text/javascript" src="${basePath}lib/jquery.validation/1.14.0/messages_zh.min.js"></script>
<script type="text/javascript" src="${basePath}static/h-ui/js/H-ui.js"></script>
<script type="text/javascript" src="${basePath}static/h-ui.admin/js/H-ui.admin.js"></script>
<script type="text/javascript" src="${basePath}static/h-ui.admin/js/comment.js"></script>
<script type="text/javascript" src="${basePath}lib/webuploader/0.1.5/webuploader.min.js"></script>
<script type="text/javascript">
    var map = new AMap.Map('container', {
        resizeEnable: true,
        zoom:11,
        center: [106.477428, 29.51923]
    });
    var cityName = "";
    var districtName = "";
    var position = "";
    AMap.plugin('AMap.Geocoder', function() {
        var geocoder = new AMap.Geocoder({
            city : "010"//城市，默认：“全国”
        });
        marker = new AMap.Marker({
            map : map,
            bubble : true
        });
        map.on('click', function(e) {
            marker.setPosition(e.lnglat);
            $.get('${basePath}area/positiondetail', {
                longitude : e.lnglat.getLng(),
                latitude : e.lnglat.getLat()
            }, function(result) {
                if(result.success != "true"){
                    layer.msg("定位失败");
                    return;
                }
                position[0] = e.lnglat.getLng();
                position[1] = e.lnglat.getLat();
                $('#house_address').val(result.address);
            });
        });
    });
    function buildingOnchange(data){
        $.ajax({
            type: "post",
            url: "${basePath}" + "house/getLocation",
            data: {
                id : $(data).val()
            },
            dataType: "json",
            success: function(result) {
                position = result.location.split(',');
                marker.setPosition(new AMap.LngLat(position[0],position[1]));
                map.setCenter(marker.getPosition());
            }
        });
    }
    jQuery.validator.addMethod("isMobile", function(value, element) {
        var length = value.length;
        var mobile = /^(13[0-9]{9})|(18[0-9]{9})|(14[0-9]{9})|(17[0-9]{9})|(15[0-9]{9})$/;
        return this.optional(element) || (length == 11 && mobile.test(value));
    }, "请正确填写您的手机号码！");
    $('.skin-minimal input').iCheck({
        checkboxClass: 'icheckbox-blue',
        radioClass: 'iradio-blue',
        increaseArea: '20%'
    });
    var isState = false;
    $("#form-article-add").validate({
        rules:{
            house_name:{
                required:true
            },
            building:{
                required:true
            },
            city:{
                required:true
            },
            district:{
                required:true
            },
            trade_Area:{
                required:true
            },
            house_style:{
                required:true
            },
            house_money:{
                required:true
            },
            house_address:{
                required:true
            },
            house_linkman:{
                required:true
            },
            house_phone:{
                required:true,
              
                isPhone:{
                }
            },
            house_type:{
                required:true
            },
            house_mi:{
             required:true,
              decimal: {  
		         integer: 10, //整数最大位数  
		         fraction:2  //小数点后最多位数  
              }
            }
        },
        messages:{
            house_name:{
                required:'请输入房源名称!'
            },
            building:{
                required:'请选择所属楼盘！'
            },
            city:{
                required:'请选所在城市！'
            },
            district:{
                required:'请选所在区县！'
            },
            trade_Area:{
                required:'请选所在商圈！'
            },
            house_style:{
                required:'请选择房源类型！'
            },
            house_money:{
                required:'请输入价格！'
            },
            house_address:{
                required:'请输入地址！'
            },
            house_linkman:{
                required:'请输入联系人！'
            },
            house_phone:{
                required:'请输入联系电话！',
                isPhone:'请输入座机或者11位手机'
            },
            house_mi:{
              required:'请输入面积',
              decimal:'请输入数字且最多只能支持两位小数'
            }
        },
        onkeyup:false,
        focusCleanup:true,
        success:"valid",
        submitHandler:function(form){
            var city = $("#city").find("option:selected").text().trim();
            var district = $("#district").find("option:selected").text().trim();
            var trade_Area = $("#trade_Area").find("option:selected").text().trim();
            var building = $("#building").find("option:selected").text().trim();
            if(isState){
                $.ajax({
                    type: "post",
                    url: "${basePath}" + "house/inesrt",
                    data:$(form).serialize()+"&cityName="+city +"&districtName=" + district +"&trade_AreaName=" + trade_Area+"&building_name="+building + "&position="+ position,
                    dataType: "json",
                    success: function(result) {
                        if(result.data != true){
                            layer.msg('添加失败!',{icon: 5,time:2000});
                        } else {
                            layer.msg('添加成功!',{icon: 1,time:2000});
                            //parent.location.replace(parent.location.href);
                            setTimeout("parent.layer.close(parent.layer.getFrameIndex(window.name))",2000);
                        }
                    }
                });
            } else {
                layer.msg('请先上传图片!',{icon: 5,time:2000});
            }
        }
    });
    function cityChange(data,list){
        var cityText = $(data).children('option:selected').val();
        cityName = $(data).children('option:selected').text();
        if(cityText.trim() == ""){
            $("#district").children().remove();
            $("#district").append("<option value=''>选择区县</option>");
            return;
        }
        $.ajax({
            type: "post",
            url: "${basePath}" + "house/getCityList",
            data: {
                id : cityText
            },
            dataType: "json",
            success: function(result) {
                $("#district").children().remove();
                var text = "<option value=''>选择区县</option>";
                for(var i = 0 ; i<result.data.length ; i++){
                    text = text + "<option value='"+ result.data[i].district_id +"'>"+ result.data[i].district_name +"</option>";
                }
                $("#district").append(text);
            }
        });
    }
    function districtChange(data,list){
        var districtText = $(data).children('option:selected').val();
        districtName = $(data).children('option:selected').text();
        if(districtText.trim() == ""){
            $("#trade_Area").children().remove();
            $("#trade_Area").append("<option value=''>请选择商圈</option>");
            return;
        }
        $.ajax({
            type: "post",
            url: "${basePath}" + "house/getTrade_AreaList",
            data: {
                id : districtText
            },
            dataType: "json",
            success: function(result) {
                $("[name=trade_Area]").children().remove();
                var text = "<option value=''>请选择商圈</option>";
                for(var i = 0 ; i<result.data.length ; i++){
                    text = text + "<option value='"+ result.data[i].trade_area_id +"'>"+ result.data[i].trade_area_name +"</option>";
                }
                $("[name=trade_Area]").append(text);
            }
        });
        $.ajax({
            type: "post",
            url: "${basePath}" + "area/reposition",
            data: {
                city : cityName,
                address : districtName
            },
            dataType: "json",
            success: function(result) {
                position = result.location.split(',');
                marker.setPosition(new AMap.LngLat(position[0],position[1]));
                map.setCenter(marker.getPosition());
            }
        });
    }
    function trade_AreaChange(data,list){
        var districtText = $(data).children('option:selected').val();
        if(districtText.trim() == ""){
            $("#building").children().remove();
            $("#building").append("<option value=''>请选择楼盘</option>");
            return;
        }
        $.ajax({
            type: "post",
            url: "${basePath}" + "house/getBuildingList",
            data: {
                id : districtText
            },
            dataType: "json",
            success: function(result) {
                $("[name=building]").children().remove();
                var text = "<option value=''>请选择楼盘</option>";
                for(var i = 0 ; i<result.data.length ; i++){
                    text = text + "<option value='"+ result.data[i].building_id +"'>"+ result.data[i].building_name +"</option>";
                }
                $("[name=building]").append(text);
            }
        });
    }
    
    
     jQuery.validator.addMethod("decimal", function(value, element, param) {return this.optional(element) || new RegExp("^-?\\d{1," + (param.integer != null ? param.integer : "") + "}" + (param.fraction != null ? (param.fraction > 0 ? "(\\.\\d{1," + param.fraction + "})?$" : "$") : "(\\.\\d+)?$")).test(value);}, "numeric value out of bounds"); 
     //自定义函数验证手机号同时支持座机号验证
     jQuery.validator.addMethod("isPhone", function(value,element) {
		    var length = value.length;
		    var mobile =  /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1})|(14[0-9]{1})|(17[0-9]{1}))+\d{8})$/;
		    var tel = /^\d{3,4}-?\d{7,9}$/;
		
		    if(/-/.test(value)){
		        return this.optional(element) || tel.test(value);
		    }else{
		        return this.optional(element) || (length == 11 && mobile.test(value));
		    }
		
		}, "请正确填写您的联系电话");
     
    /*图片上传*/
   $(function(){
        $('.skin-minimal input').iCheck({
            checkboxClass: 'icheckbox-blue',
            radioClass: 'iradio-blue',
            increaseArea: '20%'
        });

        $list = $("#fileList"),
                $btn = $("#btn-star"),
                state = "pending",
                uploader;

        var uploader = WebUploader.create({
            auto: true,
            swf: '${basePath}lib/webuploader/0.1.5/Uploader.swf',

            // 文件接收服务端。
            server: '${basePath}house/up_Files',

            // 选择文件的按钮。可选。
            // 内部根据当前运行是创建，可能是input元素，也可能是flash.
            pick: '#filePicker',

            // 不压缩image, 默认如果是jpeg，文件上传前会压缩一把再上传！
            resize: false,
            // 只允许选择图片文件。
            accept: {
                title: 'Images',
                extensions: 'gif,jpg,jpeg,bmp,png',
                mimeTypes: 'image/*'
            }
        });
        uploader.on( 'fileQueued', function( file ) {
            var $li = $(
                            '<div id="' + file.id + '" class="item">' +
                            '<div class="pic-box"><img></div>'+
                            '<div class="info">' + file.name + '</div>' +
                            '<p class="state">等待上传...</p>'+
                            '</div>'
                    ),
                    $img = $li.find('img');
            $list.append( $li );

            // 创建缩略图
            // 如果为非图片文件，可以不用调用此方法。
            // thumbnailWidth x thumbnailHeight 为 100 x 100
            uploader.makeThumb( file, function( error, src ) {
                if ( error ) {
                    $img.replaceWith('<span>不能预览</span>');
                    return;
                }

                $img.attr( 'src', src );
            }, thumbnailWidth, thumbnailHeight );
        });
        // 文件上传过程中创建进度条实时显示。
        uploader.on( 'uploadProgress', function( file, percentage ) {
            var $li = $( '#'+file.id ),
                    $percent = $li.find('.progress-box .sr-only');

            // 避免重复创建
            if ( !$percent.length ) {
                $percent = $('<div class="progress-box"><span class="progress-bar radius"><span class="sr-only" style="width:0%"></span></span></div>').appendTo( $li ).find('.sr-only');
            }
            $li.find(".state").text("上传中");
            $percent.css( 'width', percentage * 100 + '%' );
        });

        
      

        $btn.on('click', function () {
        
            if (state === 'uploading') {
                uploader.stop();
            } else {
                uploader.upload();
            }
        });

    });

    (function( $ ){
        // 当domReady的时候开始初始化
        $(function() {
            var $wrap = $('.uploader-list-container'),

            // 图片容器
                    $queue = $( '<ul class="filelist"></ul>' )
                            .appendTo( $wrap.find( '.queueList' ) ),

            // 状态栏，包括进度和控制按钮
                    $statusBar = $wrap.find( '.statusBar' ),

            // 文件总体选择信息。
                    $info = $statusBar.find( '.info' ),

            // 上传按钮
                    $upload = $wrap.find( '.uploadBtn' ),

            // 没选择文件之前的内容。
                    $placeHolder = $wrap.find( '.placeholder' ),

                    $progress = $statusBar.find( '.progress' ).hide(),

            // 添加的文件数量
                    fileCount = 0,

            // 添加的文件总大小
                    fileSize = 0,

            // 优化retina, 在retina下这个值是2
                    ratio = window.devicePixelRatio || 1,

            // 缩略图大小
                    thumbnailWidth = 110 * ratio,
                    thumbnailHeight = 110 * ratio,

            // 可能有pedding, ready, uploading, confirm, done.
                    state = 'pedding',

            // 所有文件的进度信息，key为file id
                    percentages = {},
            // 判断浏览器是否支持图片的base64
                    isSupportBase64 = ( function() {
                        var data = new Image();
                        var support = true;
                        data.onload = data.onerror = function() {
                            if( this.width != 1 || this.height != 1 ) {
                                support = false;
                            }
                        }
                        data.src = "data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///ywAAAAAAQABAAACAUwAOw==";
                        return support;
                    } )(),

            // 检测是否已经安装flash，检测flash的版本
                    flashVersion = ( function() {
                        var version;

                        try {
                            version = navigator.plugins[ 'Shockwave Flash' ];
                            version = version.description;
                        } catch ( ex ) {
                            try {
                                version = new ActiveXObject('ShockwaveFlash.ShockwaveFlash')
                                        .GetVariable('$version');
                            } catch ( ex2 ) {
                                version = '0.0';
                            }
                        }
                        version = version.match( /\d+/g );
                        return parseFloat( version[ 0 ] + '.' + version[ 1 ], 10 );
                    } )(),

                    supportTransition = (function(){
                        var s = document.createElement('p').style,
                                r = 'transition' in s ||
                                        'WebkitTransition' in s ||
                                        'MozTransition' in s ||
                                        'msTransition' in s ||
                                        'OTransition' in s;
                        s = null;
                        return r;
                    })(),

            // WebUploader实例
                    uploader;

            if ( !WebUploader.Uploader.support('flash') && WebUploader.browser.ie ) {

                // flash 安装了但是版本过低。
                if (flashVersion) {
                    (function(container) {
                        window['expressinstallcallback'] = function( state ) {
                            switch(state) {
                                case 'Download.Cancelled':
                                    alert('您取消了更新！')
                                    break;

                                case 'Download.Failed':
                                    alert('安装失败')
                                    break;

                                default:
                                    alert('安装已成功，请刷新！');
                                    break;
                            }
                            delete window['expressinstallcallback'];
                        };

                        var swf = 'expressInstall.swf';
                        // insert flash object
                        var html = '<object type="application/' +
                                'x-shockwave-flash" data="' +  swf + '" ';

                        if (WebUploader.browser.ie) {
                            html += 'classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" ';
                        }

                        html += 'width="100%" height="100%" style="outline:0">'  +
                        '<param name="movie" value="' + swf + '" />' +
                        '<param name="wmode" value="transparent" />' +
                        '<param name="allowscriptaccess" value="always" />' +
                        '</object>';

                        container.html(html);

                    })($wrap);

                    // 压根就没有安转。
                } else {
                    $wrap.html('<a href="http://www.adobe.com/go/getflashplayer"  border="0"><img alt="get flash player" src="http://www.adobe.com/macromedia/style_guide/images/160x41_Get_Flash_Player.jpg" /></a>');
                }

                return;
            } else if (!WebUploader.Uploader.support()) {
                alert( 'Web Uploader 不支持您的浏览器！');
                return;
            }

            // 实例化
            uploader = WebUploader.create({
                pick: {
                    id: '#filePicker-2',
                    label: '点击选择图片'
                },
                dnd: '#dndArea',
                swf: '${basePath}lib/webuploader/0.1.5/Uploader.swf',
                chunked: true,
                server: '${basePath}house/up_Files',
                // 禁掉全局的拖拽功能。这样不会出现图片拖进页面的时候，把图片打开。
                disableGlobalDnd: true
            });

            // 拖拽时不接受 js, txt 文件。
            uploader.on( 'dndAccept', function( items ) {
                var denied = false,
                        len = items.length,
                        i = 0,
                // 修改js类型
                        unAllowed = 'text/plain;application/javascript ';

                for ( ; i < len; i++ ) {
                    // 如果在列表里面
                    if ( ~unAllowed.indexOf( items[ i ].type ) ) {
                        denied = true;
                        break;
                    }
                }

                return !denied;
            });

            uploader.on('dialogOpen', function() {
               
            });
            // 添加“添加文件”的按钮，
            uploader.addButton({
                id: '#filePicker2',
                label: '继续添加'
            });

            uploader.on('ready', function() {
                window.uploader = uploader;
            });

            // 当有文件添加进来时执行，负责view的创建
            function addFile( file ) {
                var $li = $( '<li id="' + file.id + '">' +
                        '<p class="title">' + file.name + '</p>' +
                        '<p class="imgWrap"></p>'+
                        '<p class="progress"><span></span></p>' +
                        '</li>' ),

                        $btns = $('<div class="file-panel">' +
                        '<span class="cancel">删除</span>' +
                        '<span class="rotateRight">向右旋转</span>' +
                        '<span class="rotateLeft">向左旋转</span></div>').appendTo( $li ),
                        $prgress = $li.find('p.progress span'),
                        $wrap = $li.find( 'p.imgWrap' ),
                        $info = $('<p class="error"></p>'),

                        showError = function( code ) {
                            switch( code ) {
                                case 'exceed_size':
                                    text = '文件大小超出';
                                    break;

                                case 'interrupt':
                                    text = '上传暂停';
                                    break;

                                default:
                                    text = '上传失败，请重试';
                                    break;
                            }

                            $info.text( text ).appendTo( $li );
                        };

                if ( file.getStatus() === 'invalid' ) {
                    showError( file.statusText );
                } else {
                    // @todo lazyload
                    $wrap.text( '预览中' );
                    uploader.makeThumb( file, function( error, src ) {
                        var img;

                        if ( error ) {
                            $wrap.text( '不能预览' );
                            return;
                        }

                        if( isSupportBase64 ) {
                            img = $('<img src="'+src+'">');
                            $wrap.empty().append( img );
                        } else {
                            $.ajax('lib/webuploader/0.1.5/server/preview.php', {
                                method: 'POST',
                                data: src,
                                dataType:'json'
                            }).done(function( response ) {
                                if (response.result) {
                                    img = $('<img src="'+response.result+'">');
                                    $wrap.empty().append( img );
                                } else {
                                    $wrap.text("预览出错");
                                }
                            });
                        }
                    }, thumbnailWidth, thumbnailHeight );

                    percentages[ file.id ] = [ file.size, 0 ];
                    file.rotation = 0;
                }

                file.on('statuschange', function( cur, prev ) {
                    if ( prev === 'progress' ) {
                        $prgress.hide().width(0);
                    } else if ( prev === 'queued' ) {
                        $li.off( 'mouseenter mouseleave' );
                        $btns.remove();
                    }

                    // 成功
                    if ( cur === 'error' || cur === 'invalid' ) {
                        console.log( file.statusText );
                        showError( file.statusText );
                        percentages[ file.id ][ 1 ] = 1;
                    } else if ( cur === 'interrupt' ) {
                        showError( 'interrupt' );
                    } else if ( cur === 'queued' ) {
                        percentages[ file.id ][ 1 ] = 0;
                    } else if ( cur === 'progress' ) {
                        $info.remove();
                        $prgress.css('display', 'block');
                    } else if ( cur === 'complete' ) {
                        $li.append( '<span class="success"></span>' );
                    }

                    $li.removeClass( 'state-' + prev ).addClass( 'state-' + cur );
                });

                $li.on( 'mouseenter', function() {
                    $btns.stop().animate({height: 30});
                });

                $li.on( 'mouseleave', function() {
                    $btns.stop().animate({height: 0});
                });

                $btns.on( 'click', 'span', function() {
                    var index = $(this).index(),
                            deg;

                    switch ( index ) {
                        case 0:
                            uploader.removeFile( file );
                            return;

                        case 1:
                            file.rotation += 90;
                            break;

                        case 2:
                            file.rotation -= 90;
                            break;
                    }

                    if ( supportTransition ) {
                        deg = 'rotate(' + file.rotation + 'deg)';
                        $wrap.css({
                            '-webkit-transform': deg,
                            '-mos-transform': deg,
                            '-o-transform': deg,
                            'transform': deg
                        });
                    } else {
                        $wrap.css( 'filter', 'progid:DXImageTransform.Microsoft.BasicImage(rotation='+ (~~((file.rotation/90)%4 + 4)%4) +')');
                    }


                });

                $li.appendTo( $queue );
            }

            // 负责view的销毁
            function removeFile( file ) {
                var $li = $('#'+file.id);

                delete percentages[ file.id ];
                updateTotalProgress();
                $li.off().find('.file-panel').off().end().remove();
            }

            function updateTotalProgress() {
                var loaded = 0,
                        total = 0,
                        spans = $progress.children(),
                        percent;

                $.each( percentages, function( k, v ) {
                    total += v[ 0 ];
                    loaded += v[ 0 ] * v[ 1 ];
                } );

                percent = total ? loaded / total : 0;


                spans.eq( 0 ).text( Math.round( percent * 100 ) + '%' );
                spans.eq( 1 ).css( 'width', Math.round( percent * 100 ) + '%' );
                updateStatus();
            }

            function updateStatus() {
                var text = '', stats;

                if ( state === 'ready' ) {
                    text = '选中' + fileCount + '张图片，共' +
                    WebUploader.formatSize( fileSize ) + '。';
                } else if ( state === 'confirm' ) {
                    stats = uploader.getStats();
                    if ( stats.uploadFailNum ) {
                        text = '已成功上传' + stats.successNum+ '张照片，'+
                        stats.uploadFailNum + '张照片上传失败，<a class="retry" href="#">重新上传</a>失败图片或<a class="ignore" href="#">忽略</a>'
                    }

                } else {
                    stats = uploader.getStats();
                    
                    text = '共' + fileCount + '张（' +
                    WebUploader.formatSize( fileSize )  +
                    '），已上传' + stats.successNum + '张';

                    if ( stats.uploadFailNum ) {
                        text += '，失败' + stats.uploadFailNum + '张';
                    }
                }

                $info.html( text );
            }

            function setState( val ) {
           
                var file, stats;

                if ( val === state ) {
                    return;
                }

                $upload.removeClass( 'state-' + state );
                $upload.addClass( 'state-' + val );
                state = val;

                switch ( state ) {
                    case 'pedding':
                        $placeHolder.removeClass( 'element-invisible' );
                        $queue.hide();
                        $statusBar.addClass( 'element-invisible' );
                        uploader.refresh();
                        break;

                    case 'ready':
                        $placeHolder.addClass( 'element-invisible' );
                        $( '#filePicker2' ).removeClass( 'element-invisible');
                        $queue.show();
                        $statusBar.removeClass('element-invisible');
                        uploader.refresh();
                        break;

                    case 'uploading':
                        $( '#filePicker2' ).addClass( 'element-invisible' );
                        $progress.show();
                        $upload.text( '暂停上传' );
                        break;

                    case 'paused':
                        $progress.show();
                        $upload.text( '继续上传' );
                        break;

                    case 'confirm':
                        $progress.hide();
                        $( '#filePicker2' ).removeClass( 'element-invisible' );
                        $ .text( '开始上传' );

                        stats = uploader.getStats();
                        if ( stats.successNum && !stats.uploadFailNum ) {
                            setState( 'finish' );
                            return;
                        }
                        break;
                    case 'finish':
                        stats = uploader.getStats();
                        if ( stats.successNum ) {
                            isState = true;
                            layer.msg('上传成功!',{icon: 1,time:2000});
                        } else {
                            // 没有成功的图片，重设
                            state = 'done';
                            location.reload();
                        }
                        break;
                }

                updateStatus();
            }

            uploader.onUploadProgress = function( file, percentage ) {
                var $li = $('#'+file.id),
                        $percent = $li.find('.progress span');

                $percent.css( 'width', percentage * 100 + '%' );
                percentages[ file.id ][ 1 ] = percentage;
                updateTotalProgress();
            };

            uploader.onFileQueued = function( file ) {
                fileCount++;
                fileSize += file.size;

                if ( fileCount === 1 ) {
                    $placeHolder.addClass( 'element-invisible' );
                    $statusBar.show();
                }

                addFile( file );
                setState( 'ready' );
                updateTotalProgress();
            };

            uploader.onFileDequeued = function( file ) {
                fileCount--;
                fileSize -= file.size;

                if ( !fileCount ) {
                    setState( 'pedding' );
                }
                removeFile( file );
                updateTotalProgress();
            };
// 文件上传成功，给item添加成功class, 用样式标记上传成功。
        uploader.on('uploadSuccess', function(file,data) {
        var imgUrl=$('#himgae').val();
           if(imgUrl==""){
               imgUrl=data._raw;
           }else{
               imgUrl=imgUrl+","+data._raw;
           }
           $('#himgae').val(imgUrl);
           setState("finish");
            $( '#'+file.id ).addClass('upload-state-success').find(".state").text("已上传");
        });

        // 文件上传失败，显示上传出错。
        uploader.on( 'uploadError', function( file ) {
            $( '#'+file.id ).addClass('upload-state-error').find(".state").text("上传出错");
        });

        // 完成上传完了，成功或者失败，先删除进度条。
        uploader.on( 'uploadComplete', function( file ) {
            $( '#'+file.id ).find('.progress-box').fadeOut();
        });
            

            uploader.onError = function( code ) {
                alert( 'Eroor: ' + code );
            };

            $upload.on('click', function() {
                if ( $(this).hasClass( 'disabled' ) ) {
                    return false;
                }

                if ( state === 'ready' ) {
                    uploader.upload();
                } else if ( state === 'paused' ) {
                    uploader.upload();
                } else if ( state === 'uploading' ) {
                    uploader.stop();
                }
            });

            $info.on( 'click', '.retry', function() {
                uploader.retry();
            } );

            $info.on( 'click', '.ignore', function() {
                alert( 'todo' );
            } );

            $upload.addClass( 'state-' + state );
            updateTotalProgress();
        });

    })( jQuery );

</script>
</body>
</html>