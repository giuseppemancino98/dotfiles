" All system-wwwide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Vim will load $VIMRUNTIME/defaults.vim if the user does not have a vimrc.
" This happens after /etc/vim/vimrc(.local) are loaded, so it will override
" any settings in these files.
" If you don't want that to happen, uncomment the below line to prevent
" defaults.vim from being loaded.
" let g:skip_defaults_vim = 1

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
"syntax on

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"filetype plugin indent on

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)


" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif


set encoding=utf8
set guifont=Iosevka\ Term\ 10

" scriviamo le modifiche prima di cambiare buffer
set autowrite

" impostiamo un'unica cartella per i file *~, evitando
" così di lasciarli dispersi per il filesystem
set backupdir=~/.tmp

" il nostro terminale ha una palette di colori scuri, vero?
" bene, diciamo a vim di tenerne conto
set bg=dark

" salviamo le ultime 100 righe di storia dei comandi
set history=100

" evidenziamo i termini trovati dalla ricerca
set hlsearch

" forziamo la ricerca case-insensitive
set ignorecase

" forziamo la ricerca incrementale, cioè salta al primo termine
" trovato anche durante la digitazione
set incsearch

" mostriamo sempre la status bar
set laststatus=2

" disabilitando la modalità retro-compatibilità, si attivano
" tutte le features di Vim (in opposizione a Vi)
set nocompatible

" disabilitiamo il wrap delle linee, le linee troppo lunghe
" non verranno mandate a capo creando confusione.
set nowrap

" mostriamo sempre i numeri di riga
set number

" mostriamo le coordinate, per riga e colonna, della posizione
" corrente del cursore
set ruler

" se è abilitata l’auto-indentazione, questa viene sostituita
" con 4 spazi
set shiftwidth=4

" mostra sempre l’output dei comandi nella barra di stato.
" Ad es. mostra il numero di righe selezionate
set showcmd

" evidenzia le parentesi corrispondenti
set showmatch

" disabilitiamo il wrap delle parole
set textwidth=0

" settiamo un numero di possibili undo abbastanza alto...tutti sbagliano
set undolevels=1000

" carattere da utilizzare per iniziare ad espandere le macro.
" Ad es. io ho impostato che scrivendo "pdb” e premendo TAB
" il testo viene sostituito con "import pdb;pdb.set_trace()”
set wildchar=<Tab>

" questa impostazione è una delle più comode, infatti quando digitiamo un
" comando incompleto e premiamo TAB, mostra un comodo menu al
" posto di ciclare su tutte le opzioni
set wildmenu

" abilitiamo sempre la colorazione del testo in funzione della sintassi riconosciuta
syntax on

" abilitiamo sempre la modalità paste, utile per evitare che
" al copia-incolla vengano inseriti tab non richiesti
set paste

" disabilitiamo l’autoindentazione, fa più danno che altro
set noautoindent

" se il sistema dispone di un mouse, perché non usarlo?
if has('mouse')
 set mouse=a
endif

" perché non cambiare colore in modalità inserimento?
if &term =~ "xterm"
 let &t_SI = "\<Esc>]12;orange\x7"
 let &t_EI = "\<Esc>]12;white\x7"
endif

" questo comando permette di nascondere velocemente la colonna della numerazione
" per facilitare il copia/incolla del testo
nnoremap K :set nonumber!<CR>:set foldcolumn=0<CR>

" mostriamo un po' di utili informazioni nella status bar, es. nome e path del
" file aperto, se ci sono modifiche non salvate, riga e colonna del cursore,
" percentuale di avanzamento nella lettura del testo.
set statusline=%F%m%r%h%w\ %y\ [row=%l/%L]\ [col=%02v]\ [%02p%%]\

" ecco un comando veramente furbo. Capita sempre di aprire un file, cominciare
" a modificarlo, per poi scoprire che il file è aperto in sola lettura per
" questione di permessi di accesso. Bene: con questo comando, si forza vim
" a chiudere e riaprire il file con i permessi di sudo (richiedendo la password)
" e salvando il buffer       .
cmap w!! %!sudo tee > /dev/null %
command! -nargs=0 Sw w !sudo tee % > /dev/null


" shortcut molto comoda per trascinare una riga in alto o in basso,
" eventualmente scambiando di posizione con la riga di destinazione,
"semplicemente tenendo premuto CTRL e spostando la riga con le frecce
" in alto e in basso.
nmap <C-Up> ddkP
nmap <C-Down> ddp

" questo gruppo di shortcut semplifica lo spostamento del focus
" da una finestra all’altra, basta tenere premuto ALT e spostarsi con
" le frecce di direzione.
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

" premendo la combinazione di tasti “\ + l” si visualizzano/nascondono
" i caratteri nascosti, come ad esempio gli spazi a fine riga,
" e i caratteri di tabulazione
nmap <leader>l :set list!<CR>


set nocompatible
filetype off


" Setting up Vundle - the vim plugin bundler
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle.."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    let iCanHazVundle=0
endif




set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" The bundles you install will be listed here

filetype plugin indent on

Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
" Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Bundle 'scrooloose/nerdtree'
Bundle 'klen/python-mode'
Bundle 'airblade/vim-gitgutter'
Bundle 'gmarik/sudo-gui.vim'
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"
Bundle "zedr/zope-snipmate-bundle"
Bundle "dylanaraps/wal.vim"
Bundle "ryanoasis/vim-devicons"
Bundle "Xuyuanp/nerdtree-git-plugin"
Bundle "mhinz/vim-startify"
Bundle "vim-airline/vim-airline"
Bundle 'edkolev/tmuxline.vim'
Plugin 'Valloric/YouCompleteMe'


if iCanHazVundle == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :BundleInstall
endif
" Setting up Vundle - the vim plugin bundler end

filetype plugin indent on





set runtimepath^=~/.vim/bundle/ctrlp.vim

let g:NERDTreeDirArrowExpandable = ' '
let g:NERDTreeDirArrowCollapsible = ' '

" loading the plugin
let g:webdevicons_enable = 1
" adding the flags to NERDTree
let g:webdevicons_enable_nerdtree = 1
" ctrlp glyphs
let g:webdevicons_enable_ctrlp = 1
" adding to vim-startify screen
let g:webdevicons_enable_startify = 1
" turn on/off file node glyph decorations (not particularly useful)
let g:WebDevIconsUnicodeDecorateFileNodes = 1
" use double-width(1) or single-width(0) glyphs
" only manipulates padding, has no effect on terminal or set(guifont) font
let g:WebDevIconsUnicodeGlyphDoubleWidth = 1
" whether or not to show the nerdtree brackets around flags
let g:webdevicons_conceal_nerdtree_brackets = 1
" Force extra padding in NERDTree so that the filetype icons line up vertically
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1
" enable folder/directory glyph flag (disabled by default with 0)
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
" enable open and close folder/directory glyph flags (disabled by default with 0)
let g:DevIconsEnableFoldersOpenClose = 1

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
colorscheme wal


autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
