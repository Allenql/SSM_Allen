<%--
  Created by IntelliJ IDEA.
  User: ZQL
  Date: 2018/5/30
  Time: 23:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script>
        var totalFileLength, totalUploaded, fileCount, filesUploaded;

        function debug(s) {
            var debug = document.getElementById('debug');
            if (debug) {
                debug.innerHTML = debug.innerHTML + '<br/>' + s;
            }
        }

        function onUploadComplete(e) {
            totalUploaded += document.getElementById('files').
                files[filesUploaded].size;
            filesUploaded++;
            debug('完成 ' + filesUploaded + " / " + fileCount);
            debug('共上传: ' + totalUploaded);
            if (filesUploaded < fileCount) {
                uploadNext();
            } else {
                var bar = document.getElementById('bar');
                bar.style.width = '100%';
                bar.innerHTML = '100% 完成';
                alert('文件上传完成！');
            }
        }

        function onFileSelect(e) {
            var files = e.target.files; // FileList object
            var output = [];
            fileCount = files.length;
            totalFileLength = 0;
            for (var i=0; i<fileCount; i++) {
                var file = files[i];
                output.push(file.name, ' (',
                    file.size, ' bytes, ',
                    file.lastModifiedDate.toLocaleDateString(), ')'
                );
                output.push('<br/>');
                debug('添加 ' + file.size);
                totalFileLength += file.size;
            }
            document.getElementById('selectedFiles').innerHTML =
                output.join('');
            debug('文件总长度:' + totalFileLength);
        }

        function onUploadProgress(e) {
            if (e.lengthComputable) {
                var percentComplete = parseInt(
                    (e.loaded + totalUploaded) * 100
                    / totalFileLength);
                var bar = document.getElementById('bar');
                bar.style.width = percentComplete + '%';
                bar.innerHTML = percentComplete + ' % complete';
            } else {
                debug('unable to compute');
            }
        }

        function onUploadFailed(e) {
            alert("文件上传错误！");
        }

        function uploadNext() {
            var xhr = new XMLHttpRequest();
            var fd = new FormData();
            var file = document.getElementById('files').
                files[filesUploaded];
            fd.append("multipartFile", file);
            xhr.upload.addEventListener(
                "progress", onUploadProgress, false);
            xhr.addEventListener("load", onUploadComplete, false);
            xhr.addEventListener("error", onUploadFailed, false);
            xhr.open("POST", "upload-file");
            debug('上传中 ' + file.name);
            xhr.send(fd);
        }

        function startUpload() {
            totalUploaded = filesUploaded = 0;
            uploadNext();
        }
        window.onload = function() {
            document.getElementById('files').addEventListener(
                'change', onFileSelect, false);
            document.getElementById('uploadButton').
            addEventListener('click', startUpload, false);
        }
    </script>
</head>
<body>
<h1>带有进度条的多个文件上传</h1>
<div id='progressBar' style='height:20px;border:2px solid green'>
    <div id='bar'
         style='height:100%;background:#33dd33;width:0%'>
    </div>
</div>
<form>
    <input type="file" id="files" multiple/>
    <br/>
    <output id="selectedFiles"></output>
    <br/><br/>
    <input id="uploadButton" type="button" value="上传"/>
</form>
<div id='debug'
     style='height:100px;border:2px solid green;overflow:auto'>
</div>
</body>
</html>
