.. default-domain:: http
.. highlight:: http

Administrator Account
=====================

| admin アカウントはサービス単位で存在する。サービスを管理する役割を持つ。
| admin アカウントはサービス利用開始前に作成するため、認証を行わずに作成可能である。

.. post:: /admin

   admin アカウントを新規作成する。認証は不要。

   **Example Request**::

     POST /admin HTTP/1.1
     Host: example.com
     Content-Type: application/json

     {
         "loginID": "loginID",
         "name": "administrator's name",
         "email: "admin@example.com",
         "password": "Pa$$w00rd"
     }

   **Example Response**::

     HTTP/1.1 201 Created
     Location: /admin/573eaed36b936971e9da555f

   :<json loginID: ログインID（必須）
   :<json name: 管理者の名前（必須）
   :<json email: 管理者のメールアドレス（必須）
   :<json password: パスワード（必須）
   :>header Location: admin アカウントの URI (ステータスコードが :statuscode:`201` の時)。

   .. csv-table::
         :header: "Status Code", "Reason", "Description"
         :widths: 20, 30, 50

         :http:statuscode:`201`, "\-",                                          "成功"
         :http:statuscode:`400`, "POC_MALFORMED_JSON",                          "入力された JSON の形式に誤りがあります."
         :http:statuscode:`400`, "POC_INVALID_JSON",                            "入力された JSON の内容に誤りがあります."
         :http:statuscode:`400`, "POC_ADMIN_PASSWORD_STRENGTH_IS_INSUFFICIENT", "パスワード強度が不足しています."
         :http:statuscode:`403`, "POC_ADMIN_LOGIN_ID_ALREADY_USED",             "指定されたログインIDは既に使われています."
         :http:statuscode:`403`, "POC_ADMIN_MAIL_ADDRESS_ALREADY_USED",         "指定されたメールアドレスは既に登録されています."


.. get:: /admin/(adminID)

   admin アカウントの情報を取得する。

   **Example Request**::

     GET /admin/573eaed36b936971e9da555f HTTP/1.1
     Host: example.com
     Accept: application/json
     Authorization: x-poc 5N310DTDSNpKcJjGkm4N4BbXBCf4983o

   **Example Response**::

     HTTP/1.1 200 OK
     Content-Type: application/json

     {
         "id": "573eaed36b936971e9da555f",
         "loginID": "loginID",
         "email": "admin@example.com",
         "createdAt": "2016-05-20T14:59:39.019+09:00",
         "updatedAt": "2016-05-20T14:59:39.019+09:00"
     }

   :param string adminID: 取得する admin アカウントの ID.
   :>json string id: adminID.
   :>json string loginID: ログインID.
   :>json string email: admin アカウントの mail アドレス.
   :>json string createdAt: admin アカウントが作成された時間.
   :>json string updatedAt: admin アカウントの最終更新日時.

   .. csv-table::
         :header: "Status Code", "Reason", "Description"
         :widths: 20, 30, 50

         :http:statuscode:`200`, "\-",               "成功"
         :http:statuscode:`401`, "POC_UNAUTHORIZED", "ログインしていません."
         :http:statuscode:`404`, "POC_NOT_FOUND",    "指定された admin アカウントが存在しません."


.. patch:: /admin/(adminID)

   admin アカウントの情報を更新する。

   **Example Request**::

     PATCH /admin/573eaed36b936971e9da555f HTTP/1.1
     Host: example.com
     Content-Type: application/json
     Authorization: x-poc 5N310DTDSNpKcJjGkm4N4BbXBCf4983o

     {
         "loginID": "loginID",
         "name": "administrator's name",
         "email: "admin@example.com"
     }

   **Example Response**::

     HTTP/1.1 204 No Content

   :<json loginID: ログインID（省略可）
   :<json name: 名前 (省略可)
   :<json email: メールアドレス(省略可)

   .. csv-table::
         :header: "Status Code", "Reason", "Description"
         :widths: 20, 30, 50

         :http:statuscode:`204`, "\-",                 "成功"
         :http:statuscode:`400`, "POC_MALFORMED_JSON", "入力された JSON の形式に誤りがあります."
         :http:statuscode:`400`, "POC_INVALID_JSON",   "入力された JSON の内容に誤りがあります."
         :http:statuscode:`401`, "POC_UNAUTHORIZED",   "ログインしていません."
         :http:statuscode:`404`, "POC_NOT_FOUND",      "指定された admin アカウントが存在しません."

.. patch:: /admin/(adminID)/password

   admin アカウントのパスワードを更新する。

   **Example Request**::

     PATCH /admin/573eaed36b936971e9da555f/password HTTP/1.1
     Host: example.com
     Content-Type: text/plain
     Authorization: x-poc 5N310DTDSNpKcJjGkm4N4BbXBCf4983o

     P@$$w00rd

   **Example Response**::

     HTTP/1.1 204 No Content

   .. csv-table::
         :header: "Status Code", "Reason", "Description"
         :widths: 20, 30, 50

         :http:statuscode:`204`, "\-",                                          "成功"
         :http:statuscode:`400`, "POC_ADMIN_PASSWORD_STRENGTH_IS_INSUFFICIENT", "パスワード強度が不足しています."
         :http:statuscode:`401`, "POC_UNAUTHORIZED",                            "ログインしていません."
         :http:statuscode:`404`, "POC_NOT_FOUND",                               "指定された admin アカウントが存在しません."

