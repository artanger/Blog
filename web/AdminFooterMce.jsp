<script src="//code.jquery.com/jquery-3.1.1.min.js" crossorigin="anonymous"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" crossorigin="anonymous"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/fileinput.js"></script>
<script src="js/themes/fa/theme.js"></script>
<script src="js/themes/gly/theme.js"></script>
<script src="js/adminIndex.js"></script>
<script src="tinymce_4.7.4/tinymce/js/tinymce/tinymce.min.js"></script>
<script>
    tinymce.init({
        selector: 'textarea.mce',
        height: 500,
        plugins: [
            "advlist autolink lists link image charmap print preview anchor",
            "searchreplace visualblocks code fullscreen",
            "insertdatetime media table contextmenu paste imagetools wordcount"
        ],
        toolbar: "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image",
        // imagetools_cors_hosts: ['www.tinymce.com', 'codepen.io'],
        content_css: [
            '//fonts.googleapis.com/css?family=Lato:300,300i,400,400i',
            '//www.tinymce.com/css/codepen.min.css'
        ]
    });
</script>

<script>(function () { new AdminIndex();})();</script>
