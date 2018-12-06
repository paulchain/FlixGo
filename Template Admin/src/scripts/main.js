$('.fileCustom').on('change',function(e){
	
	var fileReader = new FileReader();
	fileReader.readAsDataURL(e.target.files[0])
	fileReader.onload = function(e){
        var src = event.target.result
        var image = $('.boximg').find('img')
        image.attr('src',src)
        image.show()
    }
    
})
$('#centralModal-lg').on('shown.bs.modal', function() {
    $(document).off('focusin.modal');
});
// $('#centralModal-lg').on('hidden.bs.modal', function() {
//     $(document).on('focusin.modal');
// });