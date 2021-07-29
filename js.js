 document.getElementById('btn-register').addEventListener('click', function (event) {
                event.stopPropagation();
                const form = document.getElementById('form-register');
                if (!form.checkValidity())
                    return;

                event.preventDefault();

                const registerGuid = $('#form-register input[name="RegisterGuid"]').val();

                if (registerGuid) {
                    registerMember();
                } else {
                    registerSmsCode();
                }

            });


  fetch('/Home/Deneme', {
                method: 'post',
                body: 'ad=deneme&soyad=falan', // veya new FormData(document.getElementById('form')),
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded',
                },
            }).then(response => response.json())
              .then(data => console.log(data));


  fetch('/Home/Deneme', {
                method: 'post',
                body: new FormData(document.getElementById('form')),
              }).then(response => response.json())
              .then(data => console.log(data));
