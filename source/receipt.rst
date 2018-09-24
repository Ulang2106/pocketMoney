.. default-domain:: http
.. highlight:: http

Receipt
=======

買い物を記録を月ごとに管理する。

.. get:: /admin/(adminID)/receipt

   買い物記録の一覧を取得する。

   **Example Request**::

     GET /admin/573eaed36b936971e9da555f/receipt HTTP/1.1
     Host: example.com
     Accept: application/json
     Authorization: x-poc 5N310DTDSNpKcJjGkm4N4BbXBCf4983o

   **Example Response**::

     HTTP/1.1 200 OK
     Content-Type: application/json

     [
         {
             "id": "573eaed36b936971e9da555f",
             "date": "2018/04",
             "price": 1000,
             "description" "本を購入"
             "createdAt": "2016-05-20T14:59:39.019+09:00",
             "updatedAt": "2016-05-20T14:59:39.019+09:00"
         }
     ]

   :param string adminID: admin アカウントの ID.
   :>json string id: receiptID.
   :>json string date: 日付("YYYY/MM").
   :>json integer price: 金額.
   :>json string description: 備考.
   :>json string createdAt: レシートが登録された時間.
   :>json string updatedAt: レシートの最終更新日時.

   .. csv-table::
         :header: "Status Code", "Reason", "Description"
         :widths: 20, 30, 50

         :http:statuscode:`200`, "\-",               "成功"
         :http:statuscode:`401`, "POC_UNAUTHORIZED", "ログインしていません."
         :http:statuscode:`404`, "POC_NOT_FOUND",    "指定された admin アカウントが存在しません."


.. post:: /admin/(adminID)/receipt

   買い物の記録を登録する。

   **Example Request**::

     POST /admin/573eaed36b936971e9da555f/receipt HTTP/1.1
     Host: example.com
     Content-Type: application/json

     {
         "date": "2018/04",
         "price": 1000,
         "description": "本を購入"
     }

   **Example Response**::

     HTTP/1.1 201 Created
     Location: /admin/573eaed36b936971e9da555f/receipt/573eaed36b936971e9da555a

   :param string adminID: admin アカウントの ID.
   :>json string date: 日付("YYYY/MM") (必須).
   :>json integer price: 金額 (必須).
   :>json string description: 備考 (必須).
   :>header Location: 登録したレシートの URI (ステータスコードが :statuscode:`201` の時)。

   .. csv-table::
         :header: "Status Code", "Reason", "Description"
         :widths: 20, 30, 50

         :http:statuscode:`201`, "\-",                 "成功"
         :http:statuscode:`400`, "POC_MALFORMED_JSON", "入力された JSON の形式に誤りがあります."
         :http:statuscode:`400`, "POC_INVALID_JSON",   "入力された JSON の内容に誤りがあります."
         :http:statuscode:`401`, "POC_UNAUTHORIZED",   "ログインしていません."
         :http:statuscode:`404`, "POC_NOT_FOUND",      "指定された admin アカウントが存在しません."


.. patch:: /admin/(adminID)/receipt/(receiptID)

   買い物の記録を更新する。

   **Example Request**::

     PATCH /admin/573eaed36b936971e9da555f/receipt/573eaed36b936971e9da555a HTTP/1.1
     Host: example.com
     Content-Type: application/json
     Authorization: x-poc 5N310DTDSNpKcJjGkm4N4BbXBCf4983o

     {
         "date": "2018/04",
         "price": 1000,
         "description": "本を購入"
     }

   **Example Response**::

     HTTP/1.1 204 No Content

   :<json date: 日付（省略可）
   :<json price: 金額 (省略可)
   :<json description: 備考 (省略可)

   .. csv-table::
         :header: "Status Code", "Reason", "Description"
         :widths: 20, 30, 50

         :http:statuscode:`204`, "\-",                 "成功"
         :http:statuscode:`400`, "POC_MALFORMED_JSON", "入力された JSON の形式に誤りがあります."
         :http:statuscode:`400`, "POC_INVALID_JSON",   "入力された JSON の内容に誤りがあります."
         :http:statuscode:`401`, "POC_UNAUTHORIZED",   "ログインしていません."
         :http:statuscode:`404`, "POC_NOT_FOUND",      "指定された レシートが存在しません."

.. delete:: /admin/(adminID)/receipt/(receiptID)

   買い物の記録を削除する。

   **Example Request**::

     DELETE /admin/573eaed36b936971e9da555f/receipt/573eaed36b936971e9da555a HTTP/1.1
     Host: example.com
     Authorization: x-poc 5N310DTDSNpKcJjGkm4N4BbXBCf4983o

   **Example Response**::

     HTTP/1.1 204 No Content

   .. csv-table::
         :header: "Status Code", "Reason", "Description"
         :widths: 20, 30, 50

         :http:statuscode:`204`, "\-",               "成功"
         :http:statuscode:`401`, "POC_UNAUTHORIZED", "ログインしていません."
         :http:statuscode:`404`, "POC_NOT_FOUND",    "指定された レシートが存在しません."

