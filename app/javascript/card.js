const pay = () => {
    Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);// PAY.JPテスト公開鍵
    const form = document.getElementById("order-form")//購入フォーム全体を呼び出し
  form.addEventListener("submit", (e) => {//購入ボタンをクリックしたらイベント発火
    e.preventDefault();//フォーム送信処理を一旦キャンセル（テーブルに保存させないため）
    
    const formResult = document.getElementById("order-form");//フォームの情報を取得
    const formData = new FormData(formResult);//上記フォームの情報データを作成

    const card = { //カード記入情報を変数cardにハッシュの形で代入
      number: formData.get("order_adress[number]"),
      cvc: formData.get("order_adress[cvc]"),
      exp_month: formData.get("order_adress[exp_month]"),
      exp_year: `20${formData.get("order_adress[exp_year]")}`,
    };


    //Payjpが用意しているToken作成オブジェクト（Payjp.createToken）
    Payjp.createToken(card, (status, response) => {
      if (status == 200) { //ステータスが200だったら（成功したら）
        const token = response.id;
        const renderDom = document.getElementById("order-form");
        const tokenObj = `<input value=${token} name='token' type="hidden"> `;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }

      //クレジットカード情報を削除
      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");

      //送信
      document.getElementById("order-form").submit();
    });


  });
};

//画面が読み込まれたらpayを起動
window.addEventListener("load", pay);