.. default-domain:: http
.. highlight:: http

Reset Password
==============

admin アカウントのパスワードを更新する。
この API はログインしていない状態で使用するため認証を行わない。

.. put:: /reset-password/(adminID)

   admin アカウントのパスワードを変更する認証は不要。

   **Example Request**::

     PUT /reset-password/573eaed36b936971e9da555f HTTP/1.1
     Host: example.com
     Content-Type: text/plain

     P@$$w0rd

   **Example Response**::

     HTTP/1.1 204 No Content

   .. csv-table::
         :header: "Status Code", "Reason", "Description"
         :widths: 20, 30, 50

         :http:statuscode:`201`, "\-",                                          "成功"
         :http:statuscode:`400`, "POC_ADMIN_PASSWORD_STRENGTH_IS_INSUFFICIENT", "パスワード強度が不足しています."
         :http:statuscode:`404`, "POC_NOT_FOUND",                               "指定された admin アカウントが見つかりません."

