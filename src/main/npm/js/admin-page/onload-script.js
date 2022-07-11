
if(document.querySelector('.admin-page #btn-open-side-bar')) {
    document.querySelector('.admin-page #btn-open-side-bar').addEventListener('click', function(event){
        if(document.querySelector('.admin-page #side-bar-warper').className == 'side-bar-warper active'){
            document.querySelector('.admin-page #side-bar-warper').className = 'side-bar-warper disable';
        }else{
            document.querySelector('.admin-page #side-bar-warper').className = 'side-bar-warper active';
        }
    });
}
if(document.querySelector('.admin-page #side-bar-warper')) {
    document.querySelector('.admin-page #side-bar-warper').addEventListener('click', function(event){
        document.querySelector('.admin-page #side-bar-warper').className = 'side-bar-warper disable';
    });
}
if(document.querySelector('.admin-page #side-bar-warper .side-bar')) {
    document.querySelector('.admin-page #side-bar-warper .side-bar').addEventListener('click', function(event){
        event.stopPropagation();
    });

    if(document.querySelector('.admin-page #side-bar-warper .side-bar .nav-item.has-child')) {
        var hasChildItems = document.querySelectorAll('.admin-page #side-bar-warper .side-bar .nav-item.has-child');
        for(var i = 0; i < hasChildItems.length; ++i) {	/* has-child가 여러개 일 가능성도 있어서 */
            hasChildItems[i].addEventListener('click', function(event){
                var myNavItem = event.target;
				
				/* click시 has-child가 아닌 다른 자식이 클릭 될 경우가 있어서 처리함*/
                if(myNavItem.getAttribute('class') == null || myNavItem.getAttribute('class').includes('has-child') == false) {
                    myNavItem = myNavItem.closest('.has-child');
                }
                
                myNavItem.setAttribute('is-open', (myNavItem.getAttribute('is-open') == null || myNavItem.getAttribute('is-open')=="false")?"true":"false");
                event.stopPropagation(); /* 부모에게 이벤트 전파 막기 */
            });
        }
    }
}
if(document.querySelector('.admin-page #side-bar-warper .side-bar-footer')) {
    document.querySelector('.admin-page #side-bar-warper .side-bar-footer').addEventListener('click', function(event){
        event.stopPropagation();
    });
}