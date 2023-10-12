# ToDo
googlemapAPIをRailsで実装してみる<br>
https://qiita.com/nagase_toya/items/e49977efb686ed05eadb


# APIについてまとめる
## APIとは？API連携って？https://www.sbbit.jp/article/cont1/62752
APIとは「アプリケーション・プログラミング・インターフェース（Application Programming Interface）」の略称<br>
ソフトウェアやプログラム、Webサービスの間をつなぐインターフェースのこと

API連携は「リクエスト（要求）」と「レスポンス（応答）」で構成されている。<br>
リクエストをするのがAPI利用者で、レスポンスをするのがAPIの提供者である。<br>
リクエストとレスポンスに関するルールはAPIの提供者が定める<br>


- メリット<br>
本来は扱うことのできなかったデータ交換や処理ができるようになる
- デメリット<br>
突然仕様が変わって使えなくなったり、提供が止まる可能性があり

### APIの種類
|名称 | 提供者 | 具体例 |
| --- | --- | --- |
| Web API | WEBサービスベンダー | Google API,Twitter API
| ネイティブAPI | オペレーティングシステム | Windows API, Android API
| ライブラリAPI | フレームワーク | Java Spring Framework, C++ STL
| ランタイムAPI | ランタイム環境 | DOM API(JavaScript), Ruby on Rails API
| データベースAPI | データベースベンダー | OCL API（Oracle）, ODBC API(Microsoft)

### APIの提供方式
| 名称 | 利用者 
| --- | ---
|パブリックAPI|登録すれば誰でも利用できる
|ビジネスAPI|課金契約などを通じて利用できる
|メンバーAPI|開かれたコミュニティメンバーが利用する
|パートナーAPI|パートナー企業や協力企業が利用する
|クローズドAPI|社内・組織の内部で利用できる
|プライベートAPI|特定の開発者やユーザーのみで利用する