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
    if ($(inputCheck).is(":checkbox")) {
        if($(inputCheck).prop("checked")){
            $(inputCheck).next("label").removeClass('uncheckedd').addClass('checkedd');
        } else {
            $(inputCheck).next("label").removeClass('checkedd').addClass('uncheckedd');
        }
    } else if ($(inputCheck).is(":radio")) {
        
        $(":radio").each(function() {
            if($(this).prop("checked")){
                $(this).next("label").removeClass('uncheckedd').addClass('checkedd');
            } else {
                $(this).next("label").removeClass('checkedd').addClass('uncheckedd');
            }
        })
        

    } else {
        alert("tipo desconocido");
    }

}
