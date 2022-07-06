set-face global QhlHighlight white,rgb:550055
declare-option -hidden str qhl_word

define-command qhl-str -params 1 -docstring "Highlights the string passed as argument. Respects word boundaries." %{
    rmhl buffer/qhl
    addhl buffer/qhl regex "\b\Q%arg{1}\E\b" 0:QhlHighlight
    set-option buffer qhl_word %arg{1}
}

define-command qhl-str-nob -params 1 -docstring "Highlights the string passed as argument. Does not respect word boundaries." %{
    rmhl buffer/qhl
    addhl buffer/qhl regex "\Q%arg{1}\E" 0:QhlHighlight
    set-option buffer qhl_word %arg{1}
}

define-command unqhl %{
    rmhl buffer/qhl
}

define-command qhl-sel %{
    qhl-str %val{selection}
}

define-command qhl-sel-nob %{
    qhl-str-nob %val{selection}
}

define-command qhl-word %{
    exec -save-regs ^ 'Z<a-i>w:qhl-sel<ret>z'
    echo -markup "Highlighting {Information}{\}%opt{qhl_word}"
}

