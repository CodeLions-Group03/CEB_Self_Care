(function (e) {
    jQuery.fn.extend({
        slimScroll: function (h) {
            var a = e.extend({ width: "auto", height: "250px", size: "7px", color: "#000", position: "right", distance: "1px", start: "top", opacity: 0.4, alwaysVisible: !1, disableFadeOut: !1, railVisible: !1, railColor: "#333", railOpacity: 0.2, railDraggable: !0, railClass: "slimScrollRail", barClass: "slimScrollBar", wrapperClass: "slimScrollDiv", allowPageScroll: !1, wheelStep: 20, touchScrollStep: 200 }, h); this.each(function () {
                function s(d) {
                    if (q) {
                        d = d || window.event; var c = 0; d.wheelDelta && (c = -d.wheelDelta /
                            120); d.detail && (c = d.detail / 3); e(d.target || d.srcTarget || d.srcElement).closest("." + a.wrapperClass).is(b.parent()) && k(c, !0); d.preventDefault && !m && d.preventDefault(); m || (d.returnValue = !1)
                    }
                } function k(d, e, h) {
                    var f = d, g = b.outerHeight() - c.outerHeight(); e && (f = parseInt(c.css("top")) + d * parseInt(a.wheelStep) / 100 * c.outerHeight(), f = Math.min(Math.max(f, 0), g), f = 0 < d ? Math.ceil(f) : Math.floor(f), c.css({ top: f + "px" })); j = parseInt(c.css("top")) / (b.outerHeight() - c.outerHeight()); f = j * (b[0].scrollHeight - b.outerHeight()); h &&
                        (f = d, d = f / b[0].scrollHeight * b.outerHeight(), d = Math.min(Math.max(d, 0), g), c.css({ top: d + "px" })); b.scrollTop(f); b.trigger("slimscrolling", ~~f); t(); n()
                } function A() { window.addEventListener ? (this.addEventListener("DOMMouseScroll", s, !1), this.addEventListener("mousewheel", s, !1)) : document.attachEvent("onmousewheel", s) } function u() { r = Math.max(b.outerHeight() / b[0].scrollHeight * b.outerHeight(), B); c.css({ height: r + "px" }); var a = r == b.outerHeight() ? "none" : "block"; c.css({ display: a }) } function t() {
                    u(); clearTimeout(x);
                    j == ~~j ? (m = a.allowPageScroll, y != j && b.trigger("slimscroll", 0 == ~~j ? "top" : "bottom")) : m = !1; y = j; r >= b.outerHeight() ? m = !0 : (c.stop(!0, !0).fadeIn("fast"), a.railVisible && g.stop(!0, !0).fadeIn("fast"))
                } function n() { a.alwaysVisible || (x = setTimeout(function () { if ((!a.disableFadeOut || !q) && !v && !w) c.fadeOut("slow"), g.fadeOut("slow") }, 1E3)) } var q, v, w, x, z, r, j, y, B = 30, m = !1, b = e(this); if (b.parent().hasClass(a.wrapperClass)) {
                    var l = b.scrollTop(), c = b.parent().find("." + a.barClass), g = b.parent().find("." + a.railClass); u(); if (e.isPlainObject(h)) {
                        if ("height" in
                            h && "auto" == h.height) { b.parent().css("height", "auto"); b.css("height", "auto"); var p = b.parent().parent().height(); b.parent().css("height", p); b.css("height", p) } if ("scrollTo" in h) l = parseInt(a.scrollTo); else if ("scrollBy" in h) l += parseInt(a.scrollBy); else if ("destroy" in h) { c.remove(); g.remove(); b.unwrap(); return } k(l, !1, !0)
                    }
                } else {
                a.height = "auto" == a.height ? b.parent().height() : a.height; l = e("<div></div>").addClass(a.wrapperClass).css({ position: "relative", overflow: "hidden", width: a.width, height: a.height }); b.css({
                    overflow: "hidden",
                    width: a.width, height: a.height
                }); var g = e("<div></div>").addClass(a.railClass).css({ width: a.size, height: "100%", position: "absolute", top: 0, display: a.alwaysVisible && a.railVisible ? "block" : "none", "border-radius": a.size, background: a.railColor, opacity: a.railOpacity, zIndex: 90 }), c = e("<div></div>").addClass(a.barClass).css({
                    background: a.color, width: a.size, position: "absolute", top: 0, opacity: a.opacity, display: a.alwaysVisible ? "block" : "none", "border-radius": a.size, BorderRadius: a.size, MozBorderRadius: a.size, WebkitBorderRadius: a.size,
                    zIndex: 99
                }), p = "right" == a.position ? { right: a.distance } : { left: a.distance }; g.css(p); c.css(p); b.wrap(l); b.parent().append(c); b.parent().append(g); a.railDraggable && (e.ui && "function" == typeof e.ui.draggable) && c.draggable({ axis: "y", containment: "parent", start: function () { w = !0 }, stop: function () { w = !1; n() }, drag: function () { k(0, e(this).position().top, !1) } }); g.hover(function () { t() }, function () { n() }); c.hover(function () { v = !0 }, function () { v = !1 }); b.hover(function () { q = !0; t(); n() }, function () { q = !1; n() }); b.bind("touchstart",
                    function (a) { a.originalEvent.touches.length && (z = a.originalEvent.touches[0].pageY) }); b.bind("touchmove", function (b) { b.originalEvent.preventDefault(); b.originalEvent.touches.length && k((z - b.originalEvent.touches[0].pageY) / a.touchScrollStep, !0) }); "bottom" === a.start ? (c.css({ top: b.outerHeight() - c.outerHeight() }), k(0, !0)) : "top" !== a.start && (k(e(a.start).position().top, null, !0), a.alwaysVisible || c.hide()); A(); u()
                }
            }); return this
        }
    }); jQuery.fn.extend({ slimscroll: jQuery.fn.slimScroll })
})(jQuery);