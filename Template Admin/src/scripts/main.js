$('.fileCustom').on('change',function(e){
	
    
    let listFile = Array.from( e.target.files);
    [].forEach.call(listFile,element => {
        let fileReader = new FileReader();
        fileReader.readAsDataURL(element)
        fileReader.onload = function(e){
            let src = e.target.result
            let imagenew = new Image()
            imagenew.src = src
            $(imagenew).addClass('image-thumbnail m-1 shadow border')
            $('.boxImageLoad').append(imagenew)
        }
    });
    
})
$('#centralModal-lg').on('shown.bs.modal', function() {
    $(document).off('focusin.modal');
});
// $('#centralModal-lg').on('hidden.bs.modal', function() {
//     $(document).on('focusin.modal');
// });