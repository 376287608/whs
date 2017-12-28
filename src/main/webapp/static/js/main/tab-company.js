/*! -v1.0 项目描述  By Linyer */
layui.use(["element", "layer","jquery"],function() {
	var $ = layui.jquery,
	element = layui.element;
	//监听导航点击
	  element.init();
	  element.on('nav(navLeft)', function(elem){
		  var url=$(this).data('url');
			$("#companyIframe").attr("src",url)
	  });
});