
// $(document).ready(function() {
//   // 編集ボタンがクリックされたとき
//   $('#genre_edit_form').on('click', function() {
//     // ボタンのdata-id属性からアイテムのIDを取得
//     var targetUrl = $(this).attr('href');
    
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