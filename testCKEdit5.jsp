<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="ckeditor5/build/ckeditor.js"></script>
<script src="ckeditor5/src/MyUploadAdapter.js"></script>
<link rel="stylesheet" type="text/css" href="ckeditor5/css/styles.css">
<!-- <link href="ckeditor5/css/editor.css" rel="stylesheet"> -->
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
  <textarea id="editor"></textarea>
  <script>
    ClassicEditor
      .create( document.querySelector( '#editor' ),{
    	  extraPlugins: [MyCustomUploadAdapterPlugin]
    	  

      } )
      .then( editor => {
        console.log( 'Editor was initialized', editor );
      } )
      .catch( error => {
        console.error( error );
      } );
  </script>
</body>
<html>