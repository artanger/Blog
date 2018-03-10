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
    });
}