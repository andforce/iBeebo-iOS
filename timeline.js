function removeBanner() {

    var nav_item = document.getElementsByClassName("nav_item");
    var childs = nav_item[0].childNodes;

    for (var i = childs.length - 1; i >= 0; i--) {
        var c = nav_item[0].children[i];

        console.log("---------->>>>>>>>>> c:[" + c.innerText.trim() + "]" + c.className.trim());

        if (c.innerText.trim() === "关注" && c.className.trim() !== "item_li cur"){
            c.click();
            console.log("---------->>>>>>>>>> Click");
        }
    }

    //document.getElementsByClassName("main-wrap")[0].style.marginTop = "0px";
    var wbInfos = document.getElementsByClassName("lite-topbar main-top");
    //wbInfos[0].style.display = "none";

}

(function () {
    'use strict';

    window.onload = removeBanner;

    window.addEventListener('DOMNodeInserted', function (e) {
        var node = e.target;

        removeBanner();

    });
})();