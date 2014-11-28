# About  
  ドットファイルや、各種設定ファイルを置いています。  

#### ドットファイルではないもの  

* linux_kernel/  
  * linux_kernel/config-\`uname -r`  
    /usr/src/linux/.configをバージョン毎にコピー。  

* mozilla/  
  * mozilla/.mozconfig  
    Seamonkeyをビルドする際に使う設定ファイル。  

  * mozilla/searchplugins/google_en.xml  
    アドレスバーからGoogle検索をする際に使う検索エンジン。  
    英語版Google検索に除外ワードやその他クエリを足したもの。  
    ※ Licence: [Mozilla Public License Version 2.0](https://www.mozilla.org/MPL/2.0/) 

* shell_script/  
  * shell\_script/debian_info.sh  
    Debian GNU/Linux専用のシステム情報表示スクリプト。  
    度々見かけるArch Linuxのスクリーンショットを見て「なにこれカッコイイ！」と思い書いたものの、  
    後に[ScreenFetch](https://github.com/KittyKatt/screenFetch)というソフトウェアで、しかもDebianのロゴも表示できることを知る。  

  * shell_script/download.sh  
    色々な意味で便利な連番画像ダウンローダ。  
  * shell_script/mscrot.sh  
    連続でスクリーンショットを撮るシェルスクリプト。  
  * shell_script/openjtalk.sh  
    OpenJtalkの簡易的なラッパ。  
    meiさんに色々とお喋りしてもらうのが楽しい。 
  * shell_script/shbiff.sh  
    [cdbiff\(Ruby\)](http://0xcc.net/cdbiff/)のシェルスクリプト版。   
    eject以外にも、任意の監視対象とコマンドを指定できます。
