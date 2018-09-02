.. default-domain:: http
.. highlight:: http

Account
=======

アカウントはログインせずに作成できるため認証は不要である。

.. post:: /account

   アカウントを新規作成する。

   **Example Request**::

     POST /account HTTP/1.1
     Host: example.com
     Content-Type: application/json

     {
         "loginID": "nickName",
         "password": "Pa$$w00rd"
     }

   **Example Response**::

     HTTP/1.1 201 Created
     Location: /account/573eaed36b936971e9da555f

   :<json loginID: ログインID（必須）
   :<json password: パスワード（必須）
   :>header Location: 認証チケットの URI (ステータスコードが :statuscode:`201` の時)。

   .. csv-table::
         :header: "Status Code", "Reason", "Description"
         :widths: 20, 30, 50

         :http:statuscode:`201`, "\-",                                "成功"
         :http:statuscode:`400`, "POC_MALFORMED_JSON",                "入力された JSON の形式に誤りがあります."
         :http:statuscode:`400`, "POC_INVALID_JSON",                  "入力された JSON の内容に誤りがあります."
         :http:statuscode:`400`, "POC_ACCOUNT_LOGIN_ID_ALREADY_USE",  "指定されたログインIDは既に使われています."


.. get:: /account/(accountID)

   アカウントを取得する。

   **Example Request**::

     GET /account/573eaed36b936971e9da555f HTTP/1.1
     Host: example.com
     Accept: application/json

   **Example Response**::

     HTTP/1.1 200 OK
     Content-Type: application/json

     {
         "id": "573eaed36b936971e9da555f",
         "loginID": "nickName",
         "createdAt": "2016-05-20T14:59:39.019+09:00",
         "updatedAt": "2016-05-20T14:59:39.019+09:00"
     }

   :param string accountID: 取得するアカウントの ID.
   :>json string id: アカウントID.
   :>json string loginID: ログインID.
   :>json string createdAt: アカウントが作成された時間.
   :>json string updatedAt: アカウントの最終更新日時.

   .. csv-table::
         :header: "Status Code", "Reason", "Description"
         :widths: 20, 30, 50

         :http:statuscode:`200`, "\-",            "成功"
         :http:statuscode:`404`, "PCT_NOT_FOUND", "指定されたアカウントが存在しない."

