#
# もっと怠惰に Git を使うシェルの設定でもっとラクをする、あるいは賢い st の話。
#
# http://qiita.com/uasi/items/6ebcce530d9530293fec
#

# 初期化する
csa_init

# エイリアスを定義する
# csalias <ctx> <alias> <cmd>
#     ctx  : コンテキストを表す任意の文字列
#     alias: エイリアス名
#     cmd  : エイリアスに割り当てるコマンド
csalias ctx_git st 'git status -sb'
csalias ctx_hg  st 'hg  status'
csalias ctx_svn st 'svn status'
csalias ctx_git b 'git branch'
csalias ctx_git c 'git commit'
csalias ctx_git p 'git push'
csalias ctx_git d 'git diff'
csalias ctx_git l 'git log --decorate'
csalias ctx_git m 'git merge --no-ff'

# ディレクトリを移動したときコンテキストが設定されるようにする
# （chpwd という名前の関数は、 cd したとき必ず呼ばれる）
function chpwd() {
    # カレントディレクトリがどの種類のリポジトリか判別し、
    # それに合わせてコンテキストを選ぶ
    local -a ctx
    if [[ -n `git rev-parse --is-inside-work-tree 2> /dev/null` ]]; then
        ctx+=ctx_git
    elif [[ -n `hg root 2> /dev/null` ]]; then
        ctx+=ctx_hg
    elif [[ -d .svn ]]; then
        ctx+=ctx_svn
    fi

    # コンテキストを設定する
    # csa_set_context [<ctx> [<ctx> …]]
    #     ctx: コンテキストを表す任意の文字列
    csa_set_context $ctx
}
