<TeXmacs|1.0.7.10>

<style|<tuple|article|tmdoc-keyboard|header-article|fangle>>

<\body>
  <hide-preamble|<assign|LyX|<macro|L<space|-0.1667em><move|Y|0fn|-0.25em><space|-0.125em>X>><assign|par-first|0fn><assign|par-par-sep|0.5fn>>

  <doc-data|<doc-title|Getting Started with
  Fangle>|<doc-author-data|<author-name|Sam Liddicott>|<\author-address>
    sam@liddicott.com
  </author-address>>>

  <assign|sub-page|<\macro|x>
    <\wide-std-framed>
      \;

      <\padded-centered|0cm|2cm>
        <indent-both|1cm|1cm|<arg|x>>
      </padded-centered>
    </wide-std-framed>
  </macro>>

  <assign|fake-caret|<macro|<with|color|black|<math|\<vdots\>>>>>

  <\abstract>
    This document explains how to use fangle and is a companion to
    <strong|Fangle> which explains how fangle works.

    Of course one does not need to know how Fangle works in order to use it,
    and one may find it easier to understand how it works when one knows how
    it is used.

    Because of this it is probably better to read <strong|Getting Started
    with Fangle> before reading <strong|Fangle>.

    This document is not intended to cover what <em|literate programming> is,
    or what its advantages are. It is assumed that the reader will have some
    knowledge of this. This document covers how to use fangle for literate
    programming, assuming that the user has at least some theoretical
    knowledge of what this entails.

    This document includes getting and installing fangle, starting a new
    simple fangle project (with <TeXmacs>, <LyX>, <LaTeX>, and plain text)
    and then making use of <strong|Makefile.inc> (from the <strong|Fangle>
    book) for larger projects and for specific sub-modules of existing Make
    based projects.

    This document should have enough detail to help someone who is
    un-familiar with <TeXmacs> or <LyX> to become acquainted with their use
    for literate programming, but is not intended to guide the reader in
    making particularly effective use of these editors.

    It is assumed that the reader will already have a functioning
    installation of <TeXmacs>, <LyX>, <LaTeX> or whatever document
    preparation system they intend to employ.
  </abstract>

  <\table-of-contents|toc>
  </table-of-contents>

  <part|Getting and Installing Fangle>

  <section|Getting Fangle>

  The latest release of Fangle can be downloaded as a gzip'd tar file from
  the git repository at <hlink|http://git.savannah.gnu.org/cgit/fangle.git/snapshot/latest.tar.gz|>

  You can checkout the entire git repository read-only by cloning either
  <hlink|git://git.sv.gnu.org/fangle.git|> or
  <hlink|http://git.savannah.gnu.org/r/fangle.git|>

  Users with a Savannah.gnu.org login can also clone
  <hlink|ssh://git.sv.gnu.org/srv/git/fangle.git|> which will also give
  commit access to project members.

  <section|Installing Fangle>

  There is no <verbatim|make install><\footnote>
    there should be, but I'm writing this document partly to find out what
    the obstacles to adoption are
  </footnote> so you will need to copy files to the correct places, as
  described here.

  <todo|Make install>

  <subsection|For personal use>

  <subsubsection|The fangle untangler>

  <verbatim|fangle> itself needs copying to where personal programs are kept.
  This could just be the git checkout directory or the place where you
  un-tar'd latest.tar.gz

  I keep my personal programs in a private <verbatim|.local/bin> directory
  which I keep in my path.

  <\verbatim>
    mkdir -p $HOME/.local/bin

    cp fangle $HOME/.local/bin
  </verbatim>

  If you don't have this folder in your path (and you use bash) you could add
  it like this:

  <verbatim|echo 'export PATH=$PATH:$HOME/.local/bin' \<gtr\>\<gtr\>
  $HOME/.bashrc>

  and if you don't want to have to login again, also set the path for the
  current session:

  <verbatim|<verbatim|export PATH=$PATH:$HOME/.local/bin>>

  <subsubsection|The <TeXmacs> stylesheet>

  If you are using <TeXmacs>, then <verbatim|fangle.ts> needs copying to your
  private <TeXmacs> packages folder:

  <verbatim|cp fangle.ts $HOME/.TeXmacs/packages/>

  <subsubsection|The <LyX> stylesheet>

  If you are using <LyX>, then <verbatim|fangle.module> needs copying to your
  private <LyX> modules folder:

  <verbatim|cp fangle.module $HOME/.lyx/modules/>

  You will also need to have Norman Ramsey's <name|noweb> stylesheet
  installed.

  <subsubsection|The <TeX> stylesheet>

  <todo|Still needs ripping off out of the .module maybe>

  You will also need to have Norman Ramsey's noweb stylesheet installed.

  <subsection|For system-wide use>

  <subsubsection|The fangle untangler>

  <paragraph|/usr/local/bin>

  <verbatim|fangle> can be copied to <verbatim|/usr/local/bin>

  <verbatim|sudo cp fangle /usr/local/bin>

  <paragraph|/opt>

  you could extract the entire package to <verbatim|/opt/fangle> but might
  want to add <verbatim|/opt/fangle> to the system-wide path. You could do
  that like this

  <\verbatim>
    echo 'PATH=$PATH:/opt/fangle' \<gtr\>\<gtr\> /etc/profile.d/fangle.sh

    echo export PATH \<gtr\>\<gtr\> /etc/profile.d/fangle.sh
  </verbatim>

  <subsubsection|The <TeXmacs> stylesheet>

  If you are using <TeXmacs> then you will need to install
  <verbatim|fangle.ts> into the <TeXmacs> system-wide package folder. This
  might be <verbatim|/usr/share/texmacs/TeXmacs/packages/> but may vary
  across installations.

  <verbatim|cp fangle.ts /usr/share/texmacs/TeXmacs/packages/>

  <subsubsection|The <LyX> stylesheet>

  If you are using <LyX>, then you will need to install
  <verbatim|fangle.module> into the <LyX> system-wide modules folder. This
  might be <verbatim|/usr/share/lyx/> but may vary across installations

  <verbatim|cp fangle.module /usr/share/lyx/modules/>

  You will also need to have Norman Ramsey's <name|noweb> stylesheet
  installed.

  <subsubsection|The <TeX> stylesheet>

  <todo|Still needs ripping off out of the .module maybe>

  You will also need to have Norman Ramsey's noweb stylesheet installed.

  <part|Authoring with Fangle>

  Fangle has editor style-sheets for <TeXmacs> and <LyX> to aid document
  editing.

  Fangle can untangle<\footnote>
    <em|untangling> is the historical term referring to the extraction or
    generation of source code from the documentation
  </footnote> sources from text files produced by <TeXmacs>'s verbatim
  export, from <TeX> files generated by <LyX>, from plain hand-edited <LaTeX>
  or <TeX> files, and from plain text files that adhere to certain
  conventions (either hand-written or generated from other document editors).

  This part will show how to start a simple project for <TeXmacs>, <LyX>,
  <LaTeX>/<TeX> and plain text.

  The instructions cover more than mere use of the fangle style-sheet.
  Literate programming is more than just pretty-looks or a bound booklet
  <emdash> it is a mind-set. Good titles, author information, abstracts, good
  structure and good narrative are essential to stop the whole thing being a
  good-looking waste of time.

  <section|<TeXmacs>>

  This section does not assume a large degree of familiarity with <TeXmacs>,
  but you should have spent at least a few minutes figuring out how to use
  it.

  <subsection|Load fangle style-sheet>

  <\enumerate>
    <item>Start <TeXmacs> with a new document.

    <item>Work around a dumb bug in Fangle<\footnote>
      And if you can work out what the fix is to get fangle.ts to execute
      this command, please let me know!
    </footnote>.

    From the menu: <menu|Tools|Execute|Evaluate scheme expression...> and
    type: <verbatim|(define-group enumerate-tag nf-chunk)>

    Sadly you will need to do this each time you start <TeXmacs> but lucky
    for you it will remember the last command you ran.

    <item>Choose an appropriate document style:

    From the menu: <menu|Document|Style|article>

    For small informal projects I usually choose <em|article>, and for longer
    more formal projects I usually choose a <em|book>.

    <item>Add the fangle package:

    From the menu: <menu|Document|Add package|fangle>

    If the <em|fangle> package isn't listed, then update your styles
    selection with:

    <menu|Tools|Update|Styles> and then try again

    <item>Optionally, (if you prefer this style):

    <menu|Document|View|Create preamble> (or <menu|Document|View|Show
    preamble>) and insert this:

    <verbatim|\<less\>assign\|par-first\|0fn\<gtr\>\<less\>assign\|par-par-sep\|0.5fn\<gtr\>>

    and then: <menu|Document|View|Show all parts>
  </enumerate>

  <subsection|Save the document>

  Save the document, and call it <verbatim|hello-world.tm>

  From the menu: <menu|File|Save>

  <subsection|Sandard document parts>

  <subsubsection|Insert your title>

  <menu|Insert|Title|Insert title>

  <\enumerate>
    <item>Type the name of your document:
    <keys|L|i|t|e|r|a|t|e|space|E|x|a|m|p|l|e>

    <item>Press <key|enter> and then type your name.

    <item>Press <key|enter> and then type your email address.

    <item>Press <key|right> to leave the title block
  </enumerate>

  <subsubsection|Insert your abstract>

  <menu|Insert|Title|Abstract>

  The abstract should explain what the document is about and help the reader
  discover if the document is relevant to them. It should not contain
  explanations that the document contains but it should explain what it is
  that the document contains.

  See the abstract to this document for a fair example.

  After you have entered the abstract, press <key|right> to leave the
  abstract block

  <subsubsection|Insert a table of contents>

  <menu|Insert|Automatic|Table of contents>

  <subsubsection|Start a new section (or chapter)>

  <menu|Insert|Section|Section> (or <menu|Insert|Section|Chapter>) and type
  the name of the chapter:

  <keys|H|e|l|l|o|space|W|o|r|l|d|enter>

  The first chapter will generally illustrate the problem to be solved and
  explain how the book is to be used to understand and provide the solution.

  <subsection|Talk about your code>

  Before you insert a chunk of code, you introduce it.

  Usually you will have introduced some aspect of the main problem that the
  program as a whole will solve, and will then outline the solution that this
  chunk will provide.

  We will introduce our hello-world chunk by typing:

  <key|T h e> <key|space> <key|t y p i c a l> <key|space> <key|h e l l o>
  <key|space> <key|w o r l d> <key|space> <key|p r o g r a m> <key|space>
  <key|l o o k s> <key|space> <key|l i k e> <key|space> <key|t h i s :>
  <key|enter>

  <subsection|Insert your first code chunk>

  Fangle currently has no menus; all commands are entered with a back-slash.
  This may annoy you, but it is much faster to keep your hands off the mouse.

  <todo|Add some menus bindings>

  Fangle chunks are (currently) called: <verbatim|nf-chunk> and are entered
  like this:

  <\enumerate>
    <item>type: <keys|\\|n|f|-|c|h|u|n|k> <emdash> it will appear like this:
    <inactive|<hybrid|nf-chunk>>

    <item>press <key|enter><math|>

    Depending on your <TeXmacs> environment, you may get either this
    <inactive|<nf-chunk|<fake-caret>|||>> which is the inactive view, or the
    active view shown below:

    <\sub-page>
      <\nf-fake-chunk|<fake-caret>>
        \;
      </nf-fake-chunk|||1|1a|||||>
    </sub-page>

    The text insertion point is represented by the three vertical dots
    <fake-caret>

    <item>Type the name of your chunk: <keys|h|e|l|l|o|-|w|o|r|l|d>

    This will give you either <inactive|<nf-chunk|hello-world<fake-caret>|||>>
    for the inactive view, or the active view shown as below:

    <\sub-page>
      <\nf-fake-chunk|hello-world<fake-caret>>
        <item>
      </nf-fake-chunk|||1|1a|||||>
    </sub-page>
  </enumerate>

  <subsection|Optional chunk parameters>

  Press <key|right> to move the text insertion point to the second argument
  of the chunk.

  This is to specify parameters to the code that will be contained in the
  chunk. Chunks can take optional parameters, and behave somewhat like C
  macros.

  Usually chunks will not have parameters, although parameters can be useful
  when a chunk is used to express an algorithm (like a sort) or a class of
  behaviours (like binary tree management). In such cases, a set of
  parameterized chunks can work like generics or C++ templates.

  If chunk has parameters, they must be enclosed in a tuple. When I
  understand DRD's a bit better this will be done for you, but for now if you
  want chunk parameters then you must type <keys|\\|t|u|p|l|e|enter>,
  otherwise skip to the next step.

  Type the first chunk argument, and then for additional arguments,
  <key|M-right> (windows key and right arrow).

  You can type multiple parameters: <inactive|<nf-chunk|hello-world|<tuple|message|language<fake-caret>>||>>
  or

  <\sub-page>
    <\nf-fake-chunk|hello-world>
      <item>
    </nf-fake-chunk||<tuple|message|language<fake-caret>>|1|1a|||||>
  </sub-page>

  <subsection|Typing code>

  Press <key|right> to move the text insertion point to the main code area.

  If your chunk shows as inactive then this will be visible as the third
  argument, but you may prefer to activate your chunk at this point. You
  should be able to do this by pressing <key|enter> or clicking the
  <image|<tuple|<#89504E470D0A1A0A0000000D49484452000000110000001108060000003B6D47FA000000017352474200AECE1CE900000006624B474400FF00FF00FFA0BDA793000000097048597300000B1300000B1301009A9C180000000774494D4507DB06120F0303780569BC0000001974455874436F6D6D656E74004372656174656420776974682047494D5057810E17000000924944415438CBBD94D10D80200C440FE3127E38846C0303EA3665083F1CA37E95102D52A2B17F90DCCB91BBE22811E3E50CF860C6F2E0176F1652221D020031C42660DDD6BA935EB119721532339C733688888FFDC877D33CD99C68620130731D52A67215B700B927129706E82A1B2552DFDC72A136B60459002A2486584DA16B77046471F11831805BA94C9072A97EFF0A4E5C193CCC5933FA210000000049454E44AE426082>|png>||||>
  icon on the toolbar. Sometimes the <image|<tuple|<#89504E470D0A1A0A0000000D49484452000000110000001108060000003B6D47FA000000017352474200AECE1CE900000006624B474400FF00FF00FFA0BDA793000000097048597300000B1300000B1301009A9C180000000774494D4507DB06120F0303780569BC0000001974455874436F6D6D656E74004372656174656420776974682047494D5057810E17000000924944415438CBBD94D10D80200C440FE3127E38846C0303EA3665083F1CA37E95102D52A2B17F90DCCB91BBE22811E3E50CF860C6F2E0176F1652221D020031C42660DDD6BA935EB119721532339C733688888FFDC877D33CD99C68620130731D52A67215B700B927129706E82A1B2552DFDC72A136B60459002A2486584DA16B77046471F11831805BA94C9072A97EFF0A4E5C193CCC5933FA210000000049454E44AE426082>|png>||||>
  icon is absent and pressent enter does nothing <emdash> in which case I
  don't know what you must do.

  <\sub-page>
    <\nf-fake-chunk|hello-world>
      <item><fake-caret>
    </nf-fake-chunk||<tuple|message|language>|1|1a|||||>
  </sub-page>

  \;

  At this point, start typing code.

  When you press <key|enter>, a new line number will be inserted at the left
  of the listing. If you press <key|S-enter> then you can break the line for
  layout purposes, but it will not be considered a new-line when the code is
  extracted and leading white-space will be stripped.

  <\sub-page>
    <\nf-fake-chunk|hello-world>
      <item>#include stdio.c

      <item>

      <item>main() {

      <item> \ printf("<fake-caret>
    </nf-fake-chunk||<tuple|message|language>|1|1a|||||>
  </sub-page>

  The listing above is incomplete. Instead of typing the the traditional
  <verbatim|hello world!>, we can make use of our chunk arguments. Let's
  place the value of the argument <with|color|blue|message> at this point.

  The command for a chunk argument is <keys|\\|n|f|-|a|r|g>, but when you
  press the <key|\\> it will enter a literal <verbatim|\\> because the cursor
  is in a code block. To enter a command-backslash in code block, use the
  meta key (probably the windows button): <keys|M-\\|n|f|-|a|r|g> and this
  will produce: <inactive*|<nf-arg|>>

  To enter the name of the argument <with|color|blue|message>, type
  <keys|m|e|s|s|a|g|e|enter> which will produce <nf-arg|message>

  Finish typing the code as shown below:

  <\sub-page>
    <\nf-fake-chunk|hello-world>
      <item>#include stdio.c

      <item>

      <item>main() {

      <item> \ printf("<nf-arg|hey>\\n");

      <item>}<fake-caret>
    </nf-fake-chunk||<tuple|message|language>|1|1a|||||>
  </sub-page>

  We've now defined a chunk of code which can potentially produce the famous
  <verbatim|hello world!> in any language.

  If the chunk were more complicated, we could break off part-way through and
  provide more explanation, and then insert another chunk <em|with the same
  name> to continue the code. In this way a single chunk can be broken across
  sections and spread across the whole document and still be assembled in
  order.

  Let's define some file-chunks that use this chunk.

  <subsection|File chunks>

  By convention, file chunk is just a regular chunk whose name begins with
  <verbatim|./> which signifies to build-tools that it should be extracted
  into a file.

  <subsubsection|French hello-world>

  Insert a new sub-section for french:

  <menu|Insert|Section|Subsection> (or <menu|Insert|Section|Section>) and
  type the name of the subsection:

  <key|I n> <key|space> <key|F r e n c h> <key|enter>

  Then introduce the next code chunk, type:
  <keys|W|e|space|w|i|l|l|space|d|e|r|i|v|e|space|t|h|e|space|f|r|e|n|c|h|space|h|e|l|l|o|-|w|o|r|l|d|space|p|r|o|g|r|a|m|space|l|i|k|e|space|t|h|i|s|:|enter>

  Then, create a chunk called hello-world.en.c, by typing:
  <keys|\\|n|f|-|c|h|u|n|k|enter> and then the chunk name
  <keys|.|/|h|e|l|l|o|-|w|o|r|l|d|.|f|r|.|c|right|right>

  <\sub-page>
    <strong|<small|1.1 In French>><htab|0mm>

    We will derive the french hello-world program like this:<htab|0mm>

    <\nf-fake-chunk|hello-world.fr.c>
      <item><fake-caret>
    </nf-fake-chunk||<tuple>|1|1b|||||>
  </sub-page>

  To include our previous chunk with the <verbatim|nf-ref> command, type
  <keys|M-\\|n|f|-|r|e|f|enter> and then type the name of our previous chunk,
  <keys|h|e|l|l|o|-|w|o|r|l|d|right>

  Then type the argument <em|Bonjour tout le monde> in a tuple:

  <keys|M-\\|t|u|p|l|e|enter|B|o|n|j|o|u|r|space|t|o|u|t|space|l|e|space|m|o|n|d|e|enter>

  <\sub-page>
    <strong|<small|1.1 In French>><htab|0mm>

    We will derive the french hello-world program like this:<htab|0mm>

    <\nf-fake-chunk|hello-world.fr.c>
      <item><nf-fake-ref|hello-world|<tuple|Bonjour tout le
      monde>|1a><fake-caret>
    </nf-fake-chunk||<tuple>|1|1b|||||>
  </sub-page>

  <subsubsection|German hello-world>

  And let's create a similar chunk for german. Insert a new sub-section:

  <menu|Insert|Section|Subsection> (or <menu|Insert|Section|Section>) and
  type the name of the subsection:

  <key|I n> <key|space> <key|G e r m a n> <key|enter>

  Then introduce the next code chunk, type:
  <keys|W|e|space|w|i|l|l|space|d|e|r|i|v|e|space|t|h|e|space|g|e|r|m|a|n|space|h|e|l|l|o|-|w|o|r|l|d|space|p|r|o|g|r|a|m|space|l|i|k|e|space|t|h|i|s|:|enter>

  <\sub-page>
    <strong|<small|1.1 In German>><htab|0mm>

    We will derive the german hello-world program like this:<htab|0mm>

    <\nf-fake-chunk|hello-world.de.c>
      <item><nf-fake-ref|hello-world|<tuple|Hallo welt>|1a><fake-caret>
    </nf-fake-chunk||<tuple>|1|1c|||||>
  </sub-page>

  <subsection|Additional parameters>

  Astute readers will have noticed that the <verbatim|hello-world> chunk has
  two parameters but that our french and german invocations only have one
  argument. This is not really a problem as the <verbatim|hello-world> chunk
  only uses one; but let's change that:

  <\sub-page>
    <\nf-fake-chunk|hello-world>
      <item>/* The traditional hello-world program in <nf-arg|language>\ 

      <item> * generated using fangle literate programming macros

      <item> */

      <item>#include stdio.c

      <item>

      <item>main() {

      <item> \ printf("<nf-arg|message>\\n");

      <item>}<fake-caret>
    </nf-fake-chunk||<tuple|message|language>|1|1a|||||>
  </sub-page>

  We will now modify our french and german .c files by clicking inside
  <with|color|blue|Bonjour tout le monde> and pressing <key|M-right> and then
  typing: <key|f r e n c h>

  <\sub-page>
    <\nf-fake-chunk|hello-world.fr.c>
      <item><nf-fake-ref|hello-world|<tuple|Bonjour tout le
      monde|french>|1a><fake-caret>
    </nf-fake-chunk||<tuple>|1|1b|||||>
  </sub-page>

  And doing similarly for the german:

  <\sub-page>
    <\nf-fake-chunk|hello-world.de.c>
      <item><nf-fake-ref|hello-world|<tuple|Hallo
      welt|german>|1a><fake-caret>
    </nf-fake-chunk||<tuple>|1|1c|||||>
  </sub-page>

  <subsection|Extracting individual files>

  Later on, automatic extraction using <verbatim|Makefile.inc> is shown, but
  this is how to extract chunks manually from a <TeXmacs> document.

  <\enumerate>
    <item>Save the <verbatim|hello-world.tm> document\ 

    <item>Generate a text file hello-world.txt, either with
    <menu|File|Export\|Verbatim> or with this command line:

    <verbatim|texmacs -s -c hello-world.tm hello-world.txt -q>

    <item>Extract the french and german files:

    <\verbatim>
      fangle -R./hello-world.fr.c hello-world.txt \<gtr\> hello-world.fr.c

      fangle -R./hello-world.de.c hello-world.txt \<gtr\> hello-world.de.c
    </verbatim>
  </enumerate>

  The resultant french file should look like this:

  <\small>
    <\cpp>
      <\with|par-par-sep|0fn>
        #include stdio.c

        /* The traditional hell-world program in french\ 

        \ * generated using literate programming macros

        \ */

        main() {

        \ \ printf("Bonjour tout le monde\\n");

        }
      </with>
    </cpp>
  </small>

  <subsection|Extracting all files>

  A list of all the chunks can be obtained with:

  <verbatim|fangle -r hello-world.txt>

  So we can extract all files like this:

  <\verbatim>
    texmacs -s -c hello-world.tm hello-world.txt -q &&

    fangle -r hello-world.txt \| while read file

    do fangle -R"$file" \<gtr\> "$file"
  </verbatim>

  If you have <em|noweb> installed then you can use <verbatim|cpif> to avoid
  updating files that haven't changed:

  <\verbatim>
    texmacs -s -c hello-world.tm hello-world.txt -q &&

    fangle -r hello-world.txt \| while read file

    do fangle -R"$file" \| cpif "$file"
  </verbatim>

  <subsection|The completed document>

  The document you typed might look something like this:<no-page-break>

  <\sub-page>
    <htab|0mm><strong|Literate Example><htab|0mm>

    <\with|par-par-sep|0fn>
      <\small>
        Joe Soap<htab|0mm>joe@example.com
      </small>
    </with>

    <htab|0mm><small|<strong|Abstract>><htab|0mm>

    <\small>
      This is a simple example of how to use literate programming templates,
      using hello-world.

      Hello-world is a famous <em|first program> with a visible side effect.

      This example produces hello-world in multiple languages.
    </small>

    <strong|Table of Contents>

    <\with|par-par-sep|0fn>
      <with|font-series|bold|math-font-series|bold|1<space|2spc>Hello World>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break>1

      <with|par-left|1.5fn|1.1<space|2spc>In French
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break>1><vspace|0.0fn>

      <with|par-left|1.5fn|1.2<space|2spc>In German
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break>1><vspace|0.5fn>
    </with>

    \;

    <with|font-series|bold|math-font-series|bold|1 Hello World>

    The typical hello-world program looks something like this:

    <\nf-fake-chunk|hello-world>
      <item>/* The traditional hello-world program in <nf-arg|language>\ 

      <item> * generated using literate programming macros

      <item> */

      <item>#include stdio.c

      <item>

      <item>main() {

      <item> \ printf("<nf-arg|message>\\n");

      <item>}
    </nf-fake-chunk||<tuple|message|language>|1|1a|||||>

    <strong|<small|1.1 In French>>

    We will derive the french hello-world program like this:<htab|0mm>

    <\nf-fake-chunk|hello-world.fr.c>
      <item><nf-fake-ref|hello-world|<tuple|Bonjour tout le monde|french>|1a>
    </nf-fake-chunk||<tuple>|1|1b|||||>

    <small|<strong|1.2 In German>>

    We will derive the german hello-world program like this:<htab|0mm>

    <\nf-fake-chunk|hello-world.de.c>
      <item><nf-fake-ref|hello-world|<tuple|Hallo welt|german>|1a>
    </nf-fake-chunk||<tuple>|1|1c|||||>

    \;
  </sub-page>

  <section|<LyX>>
</body>

<\initial>
  <\collection>
    <associate|page-medium|papyrus>
    <associate|page-screen-height|746496tmpt>
    <associate|page-screen-margin|false>
    <associate|page-screen-width|1268736tmpt>
    <associate|preamble|false>
  </collection>
</initial>

<\references>
</references>

<\auxiliary>
</auxiliary>