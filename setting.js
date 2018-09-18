function removeBanner() {

    document.getElementsByClassName("main-wrap")[0].style.marginTop = "0px";
    var wbInfos = document.getElementsByClassName("lite-topbar main-top");
    wbInfos[0].style.display = "none";
    console.log("---------->>>>>>>>>>[" + wbInfos.length + "]");

    var nav_item = document.getElementsByClassName("nav_item");

    console.log("---------->>>>>>>>>> nav_item:[" + nav_item.length + "]");

    var childs = nav_item[0].childNodes;

    for (var i = childs.length - 1; i >= 0; i--) {
        var c = nav_item[0].children[i];
        if (c.innerText.trim() === "搞笑"){
            c.click();
        }
        console.log("---------->>>>>>>>>> c:[" + c.innerText.trim() + "]");
    }

}

(function () {
    'use strict';

    window.onload = removeBanner;

    window.addEventListener('DOMNodeInserted', function (e) {
        var node = e.target;

        removeBanner();

    });
})();