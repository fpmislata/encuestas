$(function() {

    jQuery(":checkbox").change(function(){
        changeCheck(this);
    });
    jQuery(":radio").change(function(){
        changeCheck(this);
    });

    jQuery("label").click(function(){
        var inputCheck=$(this).prev();
        if ($(inputCheck).is(":checkbox")) {

            if ($(inputCheck).prop("checked")) {
                $(inputCheck).removeAttr('checked');
            } else {
                $(inputCheck).prop("checked","checked")
            }
            changeCheck(inputCheck);
        } else if ($(inputCheck).is(":radio")) {
            if (!$(inputCheck).prop("checked")) {
                $(inputCheck).prop("checked","checked")
                changeCheck(inputCheck);
            }

        }

    });

})

function changeCheck(inputCheck) {
    var visibility;
    if ($(inputCheck).is(":checkbox")) {
        if($(inputCheck).prop("checked")){
            $(inputCheck).next("label").removeClass('uncheckedd').addClass('checkedd');
            visibility="visible";

        } else {
            $(inputCheck).next("label").removeClass('checkedd').addClass('uncheckedd');
           visibility="hidden";
        }
        if ($(inputCheck).nextAll("input[type=text]").length == 1) {
            $(inputCheck).nextAll("input[type=text]").css({
                visibility:visibility
            })
        }

    } else if ($(inputCheck).is(":radio")) {

        $(":radio").each(function() {
            if($(this).prop("checked")){
                $(this).next("label").removeClass('uncheckedd').addClass('checkedd');
                visibility="visible";
            } else {
                $(this).next("label").removeClass('checkedd').addClass('uncheckedd');
                visibility="hidden";
            }
            if ($(this).nextAll("input[type=text]").length == 1) {
                $(this).nextAll("input[type=text]").css({
                    visibility:visibility
                })
            }
        })


    } else {
        alert("tipo desconocido");
    }

}


function select_click(element) {
    $(element).parent().parent().prev("button").html($(element).text()+"&nbsp;&nbsp;<span class=\"caret\"></span>");
    $(element).parent().parent().next("div").children("input").val($(element).text());
}