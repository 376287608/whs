//clearText
$.fn.ClsButton = function(cfg){
    
    return this.each(function(){
        
        // 默认点击按钮操作
        var defaultClsFn = function(p){
            $(p).val('');
        }
        
        this.clsCfg = {
            clsFn:cfg && cfg.clsFn ? cfg.clsFn : defaultClsFn,
            showClass: cfg && cfg.showClass ? cfg.showClass : 'show',
            hideClass: cfg && cfg.hideClass ? cfg.hideClass : 'hide',
            focusClass: cfg && cfg.focusClass ? cfg.focusClass : 'focus', /* 按钮获取焦点时配置 */
            _btn_width: 16,
            _btn_height: 16,
            _btn_focus: false, /* 按钮是否获取焦点 */
            _not_empty: false /* 输入框是否为空 */
        }
        
        /* 按钮初始化状态 */
        if(this.value){
            this.clsCfg._not_empty = true;
            $(this).removeClass(this.clsCfg.hideClass).addClass(this.clsCfg.showClass);
        }else{
            $(this).removeClass(this.clsCfg.showClass).addClass(this.clsCfg.hideClass);
        }
        
        $(this)
        .addClass(cfg && cfg.clsClass ? cfg.clsClass : 'cls-button')
        
        .mousemove(function(e){
            
            if(this.clsCfg._not_empty){
                
                var x = e.pageX || e.x;
                var y = e.pageY || e.y;
                var el = e.target || e.srcElement;
                var btn_focus = (x > coord(el,'offsetLeft') + el.offsetWidth - this.clsCfg._btn_width)
                && (y < coord(el,'offsetTop') + this.clsCfg._btn_height);
                
                if(btn_focus){
                    if(!this.clsCfg._btn_focus){                 
                        $(this).addClass(this.clsCfg.focusClass); /* 按钮获取焦点 */
                        this.clsCfg._btn_focus = true;
                    }
                }else{
                    if(this.clsCfg._btn_focus){
                        this.clsCfg._btn_focus = false;
                        $(this).removeClass(this.clsCfg.focusClass); /* 按钮失去焦点 */
                    }
                }
            }
        })
        
        .mouseout(function(){
            if(this.clsCfg._not_empty){
                this.clsCfg._btn_focus = false;
                
                $(this).removeClass(this.clsCfg.focusClass);
            }
        })
        
        .mousedown(function(e){
            if(this.clsCfg._btn_focus){
                this.clsCfg._btn_focus = false;
                
                $(this).removeClass(this.clsCfg.focusClass);
                this.clsCfg.clsFn(this);
                
                if(!navigator.userAgent.toLowerCase()){ /* 此时,非IE浏览器不会触发input事件 */
                    this.clsCfg._not_empty = false;
                    $(this).removeClass(this.clsCfg.showClass).addClass(this.clsCfg.hideClass);
                }
            }
            return true;
        })
        
        function valueCheck(p){
            
            var el = p.value != undefined ? p: (p.target || p.srcElement);
            
            if(!el.clsCfg._not_empty && el.value){ /* 输入框变为非空 */
                el.clsCfg._not_empty = true;
                $(el).removeClass(el.clsCfg.hideClass).addClass(el.clsCfg.showClass);
            }else if(el.clsCfg._not_empty && !el.value){ /* 输入框变为空 */
                el.clsCfg._not_empty = false;
                $(el).removeClass(el.clsCfg.showClass).addClass(el.clsCfg.hideClass);
            }
        }
        
        if(navigator.userAgent.toLowerCase()){
            
            var version = $.support ; // 8.0 9.0 ...
            if(version == undefined){                
                version=navigator.appVersion.split(";")[1].replace(/[ ]/g,""); // MSIE8.0 MSIE9.0 ...
            }
          /*  if(version.indexOf('8.0') != -1 || version.indexOf('9.0') != -1){
                
                var el = this;
                window.setInterval(function() {   用定时器弥补IE8/IE9下onpropertychange的bug  
                    
                    if (!el.clsCfg._not_empty && el.value) {  输入框变为非空 
                        el.clsCfg._not_empty = true;
                        $(el).removeClass(el.clsCfg.hideClass).addClass(el.clsCfg.showClass);
                    } else if (el.clsCfg._not_empty && !el.value) {  输入框变为空 
                        el.clsCfg._not_empty = false;
                        $(el).removeClass(el.clsCfg.showClass).addClass(el.clsCfg.hideClass);
                    }
                },500);
            }else{
                this.attachEvent('onpropertychange', valueCheck);
            }*/
            
        }else{
            
            this.addEventListener('input', valueCheck, false);
        }
        
    });
    
    function coord(el,prop) {
        var c = el[prop], b = document.body;
        
        while ((el = el.offsetParent) && (el != b)) {
            if (!$.browser.msie || (el.currentStyle.position != 'relative'))
                c += el[prop];
        }
        
        return c;
    }
}