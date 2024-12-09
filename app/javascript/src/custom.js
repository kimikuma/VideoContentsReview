
// $(document).ready(function() {
//   // 編集ボタンがクリックされたとき
//   $('#genre_edit_form').on('click', function() {
//     // ボタンのdata-id属性からアイテムのIDを取得
//     var targetUrl = $(this).attr('href');

// import { post } from "jquery";

    
//     // AJAXでeditアクションを呼び出し、フォームを取得
//     $.ajax({
//       url: 'targetUrl'  // editアクションを呼び出す
//       method: 'GET',
//       success: function(response) {
//         // フォームの内容を#edit-form-containerに挿入し、表示
//         $('#edit-form-container').html(response).show();
//       },
//       error: function() {
//         alert('編集フォームの読み込みに失敗しました');
//       }
//     });
//   });
// });

// $(document).on("turbolinks: load", function(){
//   let elem=document.querySelector("#post-raty");
//   if (elem==null)return;
 
//   elem.innerHTML="";
//   let opt={
//     starOn: <%=asset_path("star-on.png")%>,
//     starOff: <%=asset_path("star-off.png")%>,
//     starHalf: <%=asset_path("star-half.png")%>,
//     scoreName: post[star],
//   };
//   raty(elem,opt);
// });

// $(document).on("turbolinks: load", function(){
//   let elem=document.querySelector("#star_<%=@post.id %>");
//   if (elem==null)return;

//   elem.innerHTML="";
//   let opt={
//     starOn: <%=asset_path("star-on.png")%>,
//     starOff: <%=asset_path("star-off.png")%>,
//     starHalf: <%=asset_path("star-half.png")%>,
//     score: <%=@post.star %>,
//     readOnly: true,
//   };
//   raty(elem,opt);
// });