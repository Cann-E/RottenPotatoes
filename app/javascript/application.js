// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails

document.addEventListener("DOMContentLoaded", () =>{

    const posterFile = document.querySelector(".posterFile");
    const posterData = document.querySelector(".posterData");
    const posterLink = document.querySelector(".posterLink");
    const removePoster = document.querySelector(".removePoster");
    const previewImg = document.querySelector(".previewImg");
    const previewEmpty = document.querySelector(".previewEmpty");

    if(!posterFile){
        return;
    }

    posterFile.addEventListener("change", async () =>{

        const file = posterFile.files[0];

        if(!file){
            return;
        }

        if(!file.type.startsWith("image/")){
            showmessage("That file is not an image");
            return;
        }

        try{
            const data = await shrinkimage(file);
            posterData.value = data;
            posterLink.value = "";
            showposter(data);
        }
        catch(error){
            console.error(error);
            showmessage("Can't read that image");
        }

    });

    posterLink.addEventListener("input", () =>{

        const url = posterLink.value.trim();

        posterData.value = url;
        posterFile.value = "";
        showposter(url);

    });

    removePoster.addEventListener("click", () =>{

        posterData.value = "";
        posterLink.value = "";
        posterFile.value = "";
        showposter("");

    });

    previewImg.addEventListener("error", () =>{
        showmessage("Can't load that image");
    });


    function showposter(src){

        if(src){
            previewImg.src = src;
            previewImg.hidden = false;
            previewEmpty.hidden = true;
            removePoster.hidden = false;
        }
        else{
            previewImg.removeAttribute("src");
            previewImg.hidden = true;
            previewEmpty.hidden = false;
            previewEmpty.textContent = "No poster yet";
            removePoster.hidden = true;
        }

    };

    function showmessage(message){

        previewImg.hidden = true;
        previewEmpty.hidden = false;
        previewEmpty.textContent = message;

    };

    // big photos get resized so they fit in the database
    async function shrinkimage(file){

        const maxWidth = 500;

        const img = await createImageBitmap(file);

        let width = img.width;
        let height = img.height;

        if(width > maxWidth){
            height = Math.round(height * maxWidth / width);
            width = maxWidth;
        }

        const canvas = document.createElement("canvas");
        canvas.width = width;
        canvas.height = height;
        canvas.getContext("2d").drawImage(img, 0, 0, width, height);

        return canvas.toDataURL("image/jpeg", 0.85);

    };

});
