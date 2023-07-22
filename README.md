# MSX0（M5stack+評価用ファームウェア版）にてZ80アセンブラでADD命令を実行した時間を計測  
  
[MSX0についてはここを参照](https://ascii.jp/elem/000/004/126/4126402/)  

クラウドファンディングで現在出荷待ちとなっているMSX0についての初心者から見たMSX0のテスト記事です。  
まだ今のところは、Z80アセンブラでADD命令を実行したときの１命令当たりの実行時間を求めているだけです。  
残念ながら、実行時間については正式な開発者からのアナウンスがない状況なので、検証する手立てがありません。  
よって、一初心者が測定してみた生データとなります。ご参考になれば幸いです。  

１）Z80アセンブラ編  

ADD 命令を実行する時間を測定  

測定方法：ADD命令を２回実行したプログラムの実行時間からADD命令を１回実行したプログラムの実行時間を  
差し引いた時間を求める。実行回数は１００万回行う。  
  
測定結果：  
![20230722_ADD_01](https://github.com/MIN0/test_MSX0_ADD/assets/2537346/e0afafa2-2e1c-4157-85ab-1770a7e5c002)
  
[コード内容：Z80アセンブラ　ADD命令を実行したプログラムの実行時間](test14HA.asm)  
