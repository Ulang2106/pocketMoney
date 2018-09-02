.. default-domain:: http
.. highlight:: http

Ticket Authentication
=====================

API にアクセスする時に、ログイン時に生成した認証キーを用いて認証を行う。

.. todo:: 認証キーの桁数を決める必要あり。
.. todo:: パスワード強度を設定する必要あり。

.. get:: /ticket/authentication/(ticketID)

   認証チケットを取得する。

   **Example Request**::

     GET /ticket/authentication/5N310DTDSNpKcJjGkm4N4BbXBCf4983o HTTP/1.1
     Host: example.com
     Accept: application/json

   **Example Response**::

     HTTP/1.1 200 OK
     Content-Type: application/json

     {
         "ticketID": "5N310DTDSNpKcJjGkm4N4BbXBCf4983o",
         "accountID": "573eaed36b936971e9da555f",
         "createdAt": "2016-05-20T14:59:39.019+09:00",
         "expiresAt": "2016-05-20T15:29:39.019+09:00"
     }

   :param string ticketID: 取得する認証チケットの ID.
   :>json string ticketID: 認証チケットID.
   :>json string accountID: アカウント識別するための ID.
   :>json string createdAt: 認証チケットが作成された時間.
   :>json string expiresAt: 認証チケットの有効期限.

   .. csv-table::
         :header: "Status Code", "Reason", "Description"
         :widths: 20, 30, 50

         :http:statuscode:`200`, "\-",                                    "成功"
         :http:statuscode:`400`, "PCT_TICKET_AUTHENTICATION_HAS_EXPRIED", "有効期限が過ぎています."
         :http:statuscode:`404`, "PCT_NOT_FOUND",                         "指定された認証チケットが存在しない."


.. post:: /ticket/authentication

   ログイン時に認証チケットを発行する。

   **Example Request**::

     POST /ticket/authentication HTTP/1.1
     Host: example.com
     Content-Type: application/json

     {
         "accountLoginID": "nickName",
         "password": "Pa$$w00rd"
     }

   **Example Response**::

     HTTP/1.1 201 Created
     Location: /ticket/authentication/5N310DTDSNpKcJjGkm4N4BbXBCf4983o

   :<json accountLoginID: ログインID（必須）
   :<json password: アカウントのパスワード（必須）
   :>header Location: 認証チケットの URI (ステータスコードが :statuscode:`201` の時)。

   .. csv-table::
         :header: "Status Code", "Reason", "Description"
         :widths: 20, 30, 50

         :http:statuscode:`201`, "\-",                                     "成功"
         :http:statuscode:`400`, "POC_MALFORMED_JSON",                     "入力された JSON の形式に誤りがあります."
         :http:statuscode:`400`, "POC_INVALID_JSON",                       "入力された JSON の内容に誤りがあります."
         :http:statuscode:`400`, "POC_TICKET_AUTHENTICATION_LOGIN_FAILED", "ログインに失敗しました."


.. delete:: /ticket/authentication/(ticketID)

   認証チケットを削除する。

   **Example Request**::

     DELETE /ticket/authentication/5N310DTDSNpKcJjGkm4N4BbXBCf4983o HTTP/1.1
     Host: example.com

   **Example Response**::

     HTTP/1.1 204 No Content

   :param string ticketID: 削除する認証チケットの ID.

   .. csv-table::
         :header: "Status Code", "Reason", "Description"
         :widths: 20, 30, 50

         :http:statuscode:`204`, "\-",                      "成功"
         :http:statuscode:`404`, "POC_NOT_FOUND",           "指定された認証チケットが存在しません."

