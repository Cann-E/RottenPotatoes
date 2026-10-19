// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails

document.addEventListener("DOMContentLoaded", () =>{

    const posterInput = document.querySelector(".posterInput");
    const previewImg = document.querySelector(".previewImg");
    const previewEmpty = document.querySelector(".previewEmpty");

    if(!posterInput){
        return;
    }

    posterInput.addEventListener("input", () =>{
        showposter(posterInput.value.trim());
    });

    previewImg.addEventListener("error", () =>{
        previewImg.hidden = true;
        previewEmpty.hidden = false;
        previewEmpty.textContent = "Can't load that image";
    });


    function showposter(url){

        if(url){
            previewImg.src = url;
            previewImg.hidden = false;
            previewEmpty.hidden = true;
        }
        else{
            previewImg.removeAttribute("src");
            previewImg.hidden = true;
            previewEmpty.hidden = false;
            previewEmpty.textContent = "Paste a poster link to see it here";
        }

    };

});
