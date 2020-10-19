# README

介護記録電子管理システム

概要

高齢者施設でのご利用者様の健康管理を共有する事を目的としたアプリケーション

コンセプト

CRUD機能を基本としてPCにうといスタッフでもわかりやすいシンプルさ。

バージョン

Ruby 2.6.5

Ruby on Rails 5.2.4

機能一覧

１、ユーザー(スタッフ)ログイン機能

２、ユーザー新規登録機能
        名前、パスワード必須

３、利用者様連絡事項表示
        利用者様に関して共有する情報をログイン後に表示

４、利用者様詳細表示機能
        データ編集は管理者のみ

５、介護記録作成機能

６、介護記録詳細表示
        どのユーザーが記入したかも表示

７、介護記録編集機能

８、介護記録削除機能
        編集、削除は記入したユーザーのみ(あるいは管理者)  

９、介護記録ラベル機能
        実施、未実施で判定する記録はラベル表示とする
        これは施設によって異なるため、今回は入浴、体操参加のチェック

カタログ設計

https://docs.google.com/spreadsheets/d/13allHuVFfwKXJ88F_V8bZ1S8abB0fkjBP0AmMAYhPMA/edit?usp=sharing

テーブル定義

https://docs.google.com/spreadsheets/d/1XxphqQlXyMT1oYOvfl0YuZHsZAMdDfl72m7rFfBwMFI/edit?usp=sharing

ER図

https://drive.google.com/file/d/1bkTFnQR5G1IaM_4PU4dkaAt77fTmRp2_/view?usp=sharing

画面遷移図

https://cacoo.com/diagrams/IEG62r6Xmedv94DR/00F34

ワイヤーフレーム

https://cacoo.com/diagrams/H71RlhIEmIIB2Ndo/C9B6C

使用予定gem

devise

kaminari

carrierwave

mini_magick

letter_opener_web


就職termからの実装

    devise コメント機能

カリキュラム外の実装

    Activerecord import
         記録の一括入力の実装





                              


