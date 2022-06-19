
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
}
if(document.querySelector('.admin-page #side-bar-warper .side-bar-footer')) {
    document.querySelector('.admin-page #side-bar-warper .side-bar-footer').addEventListener('click', function(event){
        event.stopPropagation();
    });
}