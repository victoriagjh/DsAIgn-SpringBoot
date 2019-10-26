<html>
<head>
    <link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" type="text/css" href="{% static 'css/style.css' %}">
    <script src="https://code.getmdl.io/1.3.0/material.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
</head>
<body>
<div class="mdl-layout mdl-js-layout mdl-layout--fixed-header">
    <header class="mdl-layout__header">
        <div class="mdl-layout__header-row">
            <span class="mdl-layout-title">D.sAIgn</span>
            <div class="mdl-layout-spacer"></div>
        </div>
    </header>
    <div class="mdl-layout__drawer">
        <span class="mdl-layout-title">Hello!</span>
        <nav class="mdl-navigation">
            <a class="mdl-navigation__link" href="">HOME</a>
            <a class="mdl-navigation__link" href="">Analysis</a>
        </nav>
    </div>
    <main class="mdl-layout__content">
            <div style="display: flex; flex-direction: column; align-content: center; justify-content: center; text-align: center; height: 95%; width: 100%;">
                <h1>SELECT FILE TO ANALYZE</h1>
                <form method="post" enctype="multipart/form-data" action="/uploadFile" novalidate>
                    <div class="before" id ="before">
                        <h4>SELECT OR DRAG & DROP FILES TO CONVERT</h4>

                        <label for = file class = "mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--colored submit-btn select">
                            Choose the file
                        </label>
                        <div style="display:none">
                            <input type="file" name ="file" id="file" class = "upload">
                        </div>
                    </div>
                    <script>
                        $(document).ready(function(){
                            $('input[type="file"]').change(function(e){
                                var fileName = e.target.files[0].name;
                                $( "#before" ).hide();
                                $( "h3.file-name").text(fileName);
                                $( "#after" ).show();
                            });
                        });
                    </script>
                    <!--file selection result-->
                    <div class="after" id="after" style="display: none;">
                        <div class="content">
                            <div class="file-content">
                                <h3 class ="file-name"><i class="material-icons">attach_file</i></h3>
                                <h6>7.56MB <button class="mdl-button mdl-js-button" disabled>x</button></h6>
                            </div>
                            <br>
                            <div class="file-buttons">
                                <button class="mdl-button mdl-js-button mdl-button--primary ">
                                    <i class="material-icons add-button">add_box</i>
                                    Choose another file
                                </button>
                                <button type="submit" class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored  file-button" >
                                    Submit
                                </button>
                            </div>
                        </div>
                    </div>
                </form>
                <br>
            </div>
    </main>
    <footer class="mdl-mini-footer">
        <button id="show-dialog" type="button" class="mdl-button">
            More information
        </button>
    </footer>
    <script>
        var dialog = document.querySelector('dialog');
        var showDialogButton = document.querySelector('#show-dialog');
        if (! dialog.showModal) {
            dialogPolyfill.registerDialog(dialog);
        }
        showDialogButton.addEventListener('click', function() {
            dialog.showModal();
        });
        dialog.querySelector('.close').addEventListener('click', function() {
            dialog.close();
        });
    </script>
</div>
</body>
</html>
