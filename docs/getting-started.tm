<TeXmacs|1.0.7.10>

<style|<tuple|article|fangle|tmdoc-keyboard|header-article>>

<\body>
  \ <hide-preamble|<assign|LyX|<macro|L<space|-0.1667em><move|Y|0fn|-0.25em><space|-0.125em>X>><assign|par-first|0fn><assign|par-par-sep|0.5fn>>

  <doc-data|<doc-title|Getting Started with
  Fangle>|<doc-author-data|<author-name|Sam Liddicott>|<\author-address>
    sam@liddicott.com
  </author-address>>>

  <\abstract>
    This document explains how to use fangle and is a companion to
    <strong|Fangle> which explains how fangle works.

    Of course one does not need to know how Fangle works in order to use it,
    and one may find it easier to understand how it works when one knows how
    it is used.

    Because of this it is probably better to read <strong|Getting Started
    with Fangle> before reading <strong|Fangle>.

    This document is not intended to cover what <em|literate programming> is.
    It is assumed that the reader will have some knowledge of this. This
    document covers how to use fangle for literate programming, assuming that
    the user has at least some theoretical knowledge of what this entails.

    This document includes getting and installing fangle, starting a new
    simple fangle project (with <TeXmacs>, <LyX>, <LaTeX>, and plain text)
    and then making use of <strong|Makefile.inc> (from the <strong|Fangle>
    book) for larger projects and for specific sub-modules of existing Make
    based projects.

    This document should have enough detail to help someone who is
    un-familiar with <TeXmacs> or <LyX> to become acquainted with their use
    for literate programming, but is not enough to help the reader make
    effective use of these editors.
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
  <href|ssh://git.sv.gnu.org/srv/git/fangle.git> which will also give commit
  access to project members.

  <section|Installing Fangle>

  There is no <verbatim|make install><\footnote>
    there should be, but I'm writing this document partly to find out what
    the obstacles to adoption are
  </footnote> so you will need to copy files to the correct places.

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

  and if you don't want to login again, set the path for the current session:

  <verbatim|<verbatim|export PATH=$PATH:$HOME/.local/bin>>

  <subsubsection|The <TeXmacs> stylesheet>

  If you are using <TeXmacs>, then <verbatim|fangle.ts> needs copying to your
  private <TeXmacs> packages folder:

  <verbatim|cp fangle.ts $HOME/.TeXmacs/packages/>

  <subsubsection|The <LyX> stylesheet>

  If you are using <LyX>, then <verbatim|fangle.module> needs copying to your
  private <LyX> modules folder:

  <verbatim|cp fangle.module $HOME/.lyx/modules/>

  You will also need to have Norman Ramsey's noweb stylesheet installed.

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
  want to add /opt/fangle to the system-wide path. You could do that like
  this

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

  You will also need to have Norman Ramsey's noweb stylesheet installed.

  <subsubsection|The <TeX> stylesheet>

  <todo|Still needs ripping off out of the .module maybe>

  You will also need to have Norman Ramsey's noweb stylesheet installed.

  <part|Authoring with Fangle>

  Fangle has editor style-sheets for <TeXmacs> and <LyX> to aid document
  editing.

  Fangle and can untangle<\footnote>
    <em|untangling> is the historical term referring to the extraction or
    generation of source code from the documentation
  </footnote> sources from text files produced by <TeXmacs>'s verbatim
  export, from <TeX> files generated by <LyX>, from plain hand-edited <LaTeX>
  or <TeX> files, and from plain text files either hand-written or generated
  from other document editors.

  This section will show how to start a simple project for <TeXmacs>, <LyX>,
  <LaTeX>/<TeX> and plain text.

  The instructions cover more than mere use of the fangle style-sheet.
  Literate programming is more than just pretty-looks or a bound booklet, it
  is a mind-set. Good titles, author information, abstracts, structure and
  narrative are essential to stop the whole thing being a good-looking waste
  of time.

  <section|<TeXmacs>>

  This section does not assume familiarity with <TeXmacs>

  <subsection|Load fangle style-sheet>

  <\enumerate>
    <item>Start <TeXmacs> with a new document:

    <verbatim|texmacs test-literate.tm>

    Work around a dumb bug in Fangle<\footnote>
      And if you can work out what the fix is to get fangle.ts to execute
      this command, please let me know!
    </footnote>, from the menu: <menu|Tools|Execute|Evaluate scheme
    expression...> and type: <verbatim|(define-group enumerate-tag nf-chunk)>

    Sadly you will need to do this each time you start <TeXmacs> but lucky
    for you it will remember the last command to ran.

    <item>Choose an appropriate document style:

    From the menu: <menu|Document|Style|article>

    For small informal projects I usually choose article, and for longer more
    formal projects I usually choose a book.

    <item>Add the fangle package:

    From the menu: <menu|Document|Add package|fangle>

    If the <em|fangle> package isn't listed, then update your styles
    selection with:

    <menu|Tools|Update|Styles> and then try again

    <item>Optionally, (if you prefer this style):

    <menu|Document|View|Create preamble> (or <menu|Document|View|Show
    preamble>) and insert this:

    <verbatim|\<less\>assign\|par-first\|0fn\<gtr\>\<less\>assign\|par-par-sep\|0.5fn\<gtr\>>
  </enumerate>

  <subsection|Save the document>

  Save the document, and call it <verbatim|example.tm>

  <subsection|Boiler-plate>

  <paragraph|Insert your title>

  <menu|Insert|Title|Insert title>

  <\enumerate>
    <item>Type the name of your document: <strong|Literate Example>

    <item>Press <key|enter> and then type your name.

    <item>Press <key|enter> and then type your email address.

    <item>Press <key|right> to leave the title block
  </enumerate>

  <paragraph|Insert your abstract>

  <menu|Insert|Title|Abstract>

  The abstract should explain what the document is about and help the reader
  discover if the document is relevant to them. It should not contain
  explanations that the document contains but it should explain what it is
  that the document contains.

  See the abstract to this document for a fair example.

  After you have entered the abstract, press <key|right> to leave the
  abstract block

  <paragraph|Insert a table of contents>

  <menu|Insert|Automatic|Table of contents>

  <paragraph|Start a new section (or chapter)>

  <menu|Insert|Section|Section> (or <menu|Insert|Section|Chapter>) and type
  the name of the chapter. The first chapter will generally illustrate the
  problem to be solved and explain how the book is to be used to understand
  the solution.

  <subsection|Insert your first code chunk>

  Fangle currently has no menus; all commands are entered with a back-slash.
  This may annoy you, but it is much faster to keep your hands off the mouse.

  Fangle chunks are (currently) called: <verbatim|nf-chunk> and are entered
  like this:

  \;

  <\enumerate>
    <item>type: <key|\\><key|n><key|f><key|-><key|c><key|h><key|u><key|n><key|n><key|k>
    <emdash> it will appear like this: <inactive|<hybrid|nf-chunk>>

    <item>press <key|enter>

    Depending on your <TeXmacs> environment, you may get either this
    <inactive|<nf-chunk|!|||>> which is the inactive view, or the active view
    shown below:

    <nf-chunk|!|||>

    The text insertion point is represented by an exclamation mark !

    <item>Type the name of your chunk (in this example, it is
    <with|color|blue|example-chunk>).

    This will give you either <inactive|<nf-chunk|example-chunk|||>> for the
    inactive view, or the active view shown as below:

    <nf-chunk|example-chunka|||<tuple|>>
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
  want chunk parameters then you must type
  <key|\\><key|t><key|u><key|p><key|l><key|e><key|enter>, otherwise skip to
  the next step.

  Type the first chunk argument, and then for additional arguments,
  <key|M-right> (windows key and right arrow).

  You can type multiple parameters: <inactive|<nf-chunk|example-chunk|<tuple|hey|nonny|no>|!|>>
  or

  <nf-chunk|example-chunk|!||<tuple|hey|nonny|no>>

  <subsection|Typing code>

  Press <key|right> to move the text insertion point to the main code area.

  If your chunk shows as inactive then this will be visible as the third
  argument, but you may prefer to activate your chunk at this point. You
  should be able to do this by pressing <key|enter> or clicking the
  <image|<tuple|<#89504E470D0A1A0A0000000D49484452000000110000001108060000003B6D47FA000000017352474200AECE1CE900000006624B474400FF00FF00FFA0BDA793000000097048597300000B1300000B1301009A9C180000000774494D4507DB06120F0303780569BC0000001974455874436F6D6D656E74004372656174656420776974682047494D5057810E17000000924944415438CBBD94D10D80200C440FE3127E38846C0303EA3665083F1CA37E95102D52A2B17F90DCCB91BBE22811E3E50CF860C6F2E0176F1652221D020031C42660DDD6BA935EB119721532339C733688888FFDC877D33CD99C68620130731D52A67215B700B927129706E82A1B2552DFDC72A136B60459002A2486584DA16B77046471F11831805BA94C9072A97EFF0A4E5C193CCC5933FA210000000049454E44AE426082>|png>||||>
  icon on the toolbar.

  <nf-chunk|example-chunk-c|!||>

  At this point, start typing code.

  When you press <key|enter>, a new line number will be inserted at the left
  of the listing. If you press <key|S-enter> then you can break the line for
  typesetting purposes, but it will not be considered a new-line when the
  code is extracted, and leading white-space will be stripped.

  <\nf-chunk|example-chunk>
    <item>#include stdio.c

    <item>

    <item>main() {

    <item> \ printf("
  </nf-chunk||>

  The listing above is in-complete. Instead of typing the the traditional
  <verbatim|hello world!>, we can make use of our chunk arguments. Let's
  place the value of the argument <with|color|blue|hey> at this point.

  The command for a chunk argument is <key|\\><key|n><key|f><key|-><key|a><key|r><key|g>,
  but when you press the <key|\\> it will enter a literal <verbatim|\\>
  because you are in code mode. To enter a command backslash you must use the
  windows button (called the meta key): <key|M-\\><key|n><key|f><key|-><key|a><key|r><key|g>
  and this will produce: <inactive*|<nf-arg|>>

  To enter the name of the argument <with|color|blue|hey>, type
  <key|h><key|e><key|y><key|enter> which will produce <nf-arg|hey>

  Finish typing the code as shown below.

  <\nf-chunk|hello-world>
    <item>#include stdio.c

    <item>

    <item>main() {

    <item> \ printf("<nf-arg|hey>\\n");

    <item>}
  </nf-chunk|cpp|>

  We've now defined a chunk of code which can produce the famous
  <verbatim|hello world!> in any language.

  Let's define some file-chunks that use this chunk.

  <subsection|File chunks>

  A file chunk is just a regular chunk whose name begins with <verbatim|./>
  which can signify to build-tools that it should be extracted into a file.

  Create a chunk called hello-world.en.c, by typing:
  <key|\\><key|n><key|f><key|-><key|c><key|h><key|u><key|n><key|k>
  <key|enter> and then the chunk name <key|.><key|/><key|h><key|e><key|l><key|l><key|o><key|-><key|w><key|o><key|r><key|l><key|d><key|.><key|f><key|r><key|.><key|c>
  <key|right><key|right>

  To include our previous chunk with the <verbatim|nf-ref> command, type
  <key|M-\\><key|n><key|f><key|-><key|r><key|e><key|f> <key|enter> and then
  type the name of our previous chunk, <key|h><key|e><key|l><key|l><key|o><key|-><key|w><key|o><key|r><key|l><key|d>
  <key|right>

  Then type the argument <em|Bonjour tout le monde> in a tuple:

  <key|M-\\><key|t><key|u><key|p><key|l><key|e> <key|enter>
  <key|B><key|o><key|n><key|j><key|o><key|u><key|r> <key|space>
  <key|t><key|o><key|u><key|t> <key|space> <key|l><key|e> <key|space>
  <key|m><key|o><key|n><key|d><key|e> <key|enter>

  <\nf-chunk|./hello-world.fr.c>
    <item><nf-ref|hello-world|<tuple|Bonjour tout le monde>>
  </nf-chunk||>

  And let's create a similar chunk for german

  <\nf-chunk|./hello-world.de.c>
    <item><nf-ref|hello-world|<tuple|Hallo welt>>
  </nf-chunk|cpp|>

  <subsection|Extracting files>

  Later on, automatic extraction using <verbatim|Makefile.inc> is shown, but
  this is how to extract chunks individually from a <TeXmacs> document.

  <\enumerate>
    <item>Save the <verbatim|example.tm> document\ 

    <item>Generate a text file example.txt, either with
    <menu|File|Export\|Verbatim> or with this command line:

    <verbatim|texmacs -s -c example.tm example.txt -q>

    <item>Extract the french and german files:

    <\verbatim>
      fangle -R./hello-world.fr.c example.txt \<gtr\> hello-world.fr.c

      fangle -R./hello-world.de.c example.txt \<gtr\> hello-world.de.c
    </verbatim>
  </enumerate>

  The resultant french file should look like this:

  <\small>
    <\cpp>
      #include stdio.c

      main() {

      \ \ printf("Bonjour tout le monde\\n");

      }
    </cpp>
  </small>

  <section|<LyX>>
</body>

<\initial>
  <\collection>
    <associate|preamble|false>
  </collection>
</initial>

<\references>
</references>

<\auxiliary>
</auxiliary>