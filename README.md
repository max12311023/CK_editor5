# CK_editor5
需要安裝node.js(包含npm )、yarn(npm install yarn --g)

1. 需去官網依照需求下載 [Demo](https://ckeditor.com/ckeditor-5/download/)  這邊使用Classic版本 ，有些需要收費 ex: CKBox 等等
2. 下載好後目錄結構  如下
- Build  負責放打包好的JS ，前端引用
- Src 的JS負責放要使用那些plugin，使用webpack 打包覆蓋 build裡面的JS
- package.json npm 去管理這些套件
- yarn 則是與npm 一樣，沒有那太差異只是有時候npm 則會有問題
  

![ckeditor](https://github.com/max12311023/CK_editor5/assets/24786119/8ae1a96b-a361-43f4-8a5c-415fa548fa89)

3. 前端使用 textarea or div 可以用CSS調整長度
   
```html
<script src="../build/ckeditor.js"></script>
<textarea id="editor"></textarea>
```

```javascript
<script>
          ClassicEditor.create( document.querySelector( '#editor' ) )
          .then( editor => {
          window.editor = editor;
          } )
          .catch( error => {
          console.error( 'There was a problem initializing the editor.', error );
    } );
</script>
  ```
4. 圖片上傳必須自己寫AdapterPlugin來使用，官方定義好的幾乎都要收費，需要自己後端上傳程式透過AJAX 回傳JSON URL格式，可以[參考官方](https://ckeditor.com/docs/ckeditor5/latest/framework/deep-dive/upload-adapter.html)

```html
<script src="ckeditor5/src/MyUploadAdapter.js"></script>
extraPlugins: [MyCustomUploadAdapterPlugin]
```
MyUploadAdapter.js
```javascript
const xhr = (this.xhr = new XMLHttpRequest());
// Note that your request may look different. It is up to you and your editor
// integration to choose the right communication channel. This example uses
// a POST request with JSON as a data structure but your configuration
// could be different.
xhr.open("POST", "http://localhost:8080/testWeb/image", true);
xhr.responseType = "json";
```

5. 新增套件 &重新匯入打包<br>
  開啟 src/ckeditor.js，套件的設定檔，照官網的說明將設定加入 builtinPlugins、Import
   ![image](https://github.com/max12311023/CK_editor5/assets/24786119/dbbc66c5-3ce7-407f-b3b3-fdfed6e2e72f)
   <br>
  先切換至專案位置 eclipse 下命令可以透過右鍵  Show in > Terminal
  ![image](https://github.com/max12311023/CK_editor5/assets/24786119/88acec3f-b756-4fda-bd3d-3783b298818e)
  <br>

安裝 套件
```
npm install --save @ckeditor/ckeditor5-highlight
```

若跳出 npm ERR! ERESOLVE unable to resolve dependency tree  使用

```
npm install --save --legacy-peer-deps
```
完成設定後打包
```
npm run build
```

若是跳出Error: error:0308010C:digital envelope routines::unsupported 因node.js 版本太高不是要降版本or參考如下指令
```
linux & mac:
NODE_OPTIONS=--openssl-legacy-provider && npm run start
windows:
set NODE_OPTIONS=--openssl-legacy-provider && npm run start
```







