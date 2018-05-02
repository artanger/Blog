function AdminIndex() {
    "use strict";
    $(function() {
        function stripTrailingSlash(str) {
            if(str.substr(-1) == '/') {
                return str.substr(0, str.length - 1);
            }
            return str;
        }

        var url = window.location.pathname + location.search;
        var activePage = stripTrailingSlash(url);

        $('nav.posts-header li.nav-item a').each(function(){
            var currentPage = stripTrailingSlash($(this).attr('href'));

            if (activePage == currentPage) {
                $(this).parent().addClass('active');
            }
        });

        var $fileinput = $(".file-input");
        if ($fileinput.length > 0){
            $fileinput.fileinput({
                theme: 'fa',
                uploadUrl: 'uploadimage', // you must set a valid URL here else you will get an error
                allowedFileExtensions: ['jpg', 'png', 'gif'],
                // overwriteInitial: false,
                maxFileSize: 10000,
                maxFilesNum: 1,
                required: true,
                allowedFileTypes: ['image'],
                //initialPreview: [
                   // "http://localhost:8080/img/image%20_18_.jpg"
                   // '<img src="img/image%20_18_.jpg" class="file-preview-image" alt="Desert" title="Desert">'
                //]
            });

            $fileinput.on('fileuploaded', function(event, data, previewId, index) {
                var $fieldElem = $('#' + $(event.currentTarget).data('id'));
                if($fieldElem.length > 0){
                    $fieldElem.val(data.filenames[0]);
                }
            });
        }

        var $login = $("#login");
        if ($login.length > 0){
            $login.focus();
        }

    });
}