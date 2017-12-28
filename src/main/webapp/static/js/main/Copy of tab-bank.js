/*! -v1.0 项目描述  By Linyer */
layui.use(["element", "layer","jquery"],function() {
	var $ = layui.jquery,
	a = layui.element;
	$(window).on("resize",
	function() {
		var a = $("#tabContainers");
		a.height($(this).height() - 155),
		a.find("iframe").each(function() {
			$(this).height(a.height())
		})
	}).resize();
	
	var t = $("#tabTitle"),
	e = ($("#tabContainer"), $("#sideNav"));
	$(".layui-nav .layui-nav-item .layui-nav-child dd> a").each(function() {
		var l = $(this),
		n = l.data("url");
		void 0 !== n && l.on("click",
		function() {
			var d = l.html(),
			h = 0,
			s = t.find("li:last-child").attr("lay-id");
			if (t.find("li").each(function(a, t) {
				$(this).find("label").text() === l.text() && (h++, s = $(this).attr("lay-id"))
			}), 0 === h) {
				d += '<i class="layui-icon layui-unselect layui-tab-close">&#x1006;</i>',
				a.tabAdd("page-tab", {
					title: d,
					content: '<iframe src="' + n + '" id="bankIframe" frameborder="no" border="0"></iframe>',
					id: s + 1
				}),
				s = t.find("li:last-child").attr("lay-id");
				var c = $(".layui-tab-content");
				c.find("iframe").each(function() {
					$(this).height(c.height())
				});
				var u = t.find("li");
				u.find("label").on("click",
				function() {
					var a = $(this).text(),
					t = e.find("dd.layui-this").find("a").text();
					a != t && (e.find("dd").each(function() {
						$(this).find("label").text() == a && (e.find(".layui-nav-child >dd").removeClass("layui-this"), $(this).addClass("layui-this"))
					}), "首页" == a && e.find(".layui-nav-child >dd").removeClass("layui-this"))
				}),
				u.eq(u.length - 1).children("i.layui-tab-close").on("click",
				function() {
					a.tabDelete("page-tab", s);
					var l = t.find("li.layui-this").find("label").text(),
					n = e.find("dd.layui-this").find("a").text();
					l != n && (e.find("dd").each(function() {
						$(this).find("label").text() == l && (e.find(".layui-nav-child >dd").removeClass("layui-this"), $(this).addClass("layui-this"))
					}), "首页" == l && e.find(".layui-nav-child >dd").removeClass("layui-this"))
				}),
				a.tabChange("page-tab", s)
			} else a.tabChange("page-tab", s)
		})
	})
});