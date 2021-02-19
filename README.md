# 『計算機プログラムの構造と解釈』学習用リポジトリ

資料: [非公式PDF版SICP・新訳 - アスペ日記](<https://takeda25.hatenablog.jp/entry/20151030/1446174031>)


## schemeインタプリタの導入

```sh
sudo apt install mit-scheme

# REPLの起動
scheme

# (quit)でREPLの終了
1 ]=> (quit)
```


## schemeプログラムの実行

拡張子は`.scm`。`test.scm`を実行するには次のように、REPLを立ち上げて`(load "{file_name}")`する。

```sh
# REPLの起動
scheme

1 ]=> (load "test.scm")
```

もしくはREPL起動時にファイルを読み込ませておくこともできる。そのファイルの中で定義された関数などを呼び出すことができる。

```sh
# REPLの起動時にhogeが定義されたtest.scmを読み込ませる。
scheme --load "test.scm"

1 ]=> (hoge) # hogeを呼び出せる。
```


## Vimから簡単に実行できるようにする

[sillybun/vim-repl](<https://github.com/sillybun/vim-repl>)を導入する。

以下を`.vimrc`などに定義して

```vim
let g:sendtorepl_invoke_key = "!"
let g:repl_program = {
  \ 'scheme': 'scheme',
\}
let g:repl_exit_commands = {
  \ 'scheme': '(quit)',
\}
```

`xxx.scm`ファイルを開いた状態で`:REPLToggle`を実行するとschemeのREPLが開き、ファイル上で`!`キー（`g:sendtorepl_invoke_key`で定義したキー）を押すとその行がREPLに渡されて実行される。
