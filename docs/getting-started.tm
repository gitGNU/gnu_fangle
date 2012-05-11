<TeXmacs|1.0.7.10>

<style|<tuple|article|tmdoc-keyboard|header-article|fangle>>

<\body>
  <\hide-preamble>
    <assign|LyX|<macro|L<space|-0.1667em><move|Y|0fn|-0.25em><space|-0.125em>X>>

    <assign|par-first|0fn><assign|par-par-sep|0.5fn>

    <assign|tick|<macro|<with|font|modern|font-family|ss|\<checkmark\>>>>

    <assign|sub-page|<\macro|x>
      <\wide-std-framed>
        \;

        <\padded-centered|0cm|2cm>
          <indent-both|1cm|1cm|<arg|x>>
        </padded-centered>
      </wide-std-framed>
    </macro>>

    \;
  </hide-preamble>

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
    <vspace*|2fn><with|font-series|bold|math-font-series|bold|font-size|1.19|I<space|2spc>Getting
    and Installing Fangle> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|1fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Getting
    Fangle> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Installing
    Fangle> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3><vspace|0.5fn>

    <with|par-left|1.5fn|2.1<space|2spc>Choosing the editing environment
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4>>

    <with|par-left|1.5fn|2.2<space|2spc>For personal use
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6>>

    <with|par-left|3fn|2.2.1<space|2spc>Executables
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7>>

    <with|par-left|3fn|2.2.2<space|2spc>T<rsub|<space|-0.4spc><move|<resize|<with|math-level|0|E>||||0.5fn>|0fn|-0.1fn>><space|-0.4spc>X<rsub|<space|-0.4spc><move|<resize|M<space|-0.2spc>A<space|-0.4spc>CS||||0.5fn>|0fn|-0.1fn>>
    plugins <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-8>>

    <with|par-left|3fn|2.2.3<space|2spc>The
    L<space|-0.1667em><move|Y|0fn|-0.25em><space|-0.125em>X stylesheet
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-9>>

    <with|par-left|3fn|2.2.4<space|2spc>The
    T<rsub|<space|-0.4spc><move|<resize|<with|math-level|0|E>||||0.5fn>|0fn|-0.1fn>><space|-0.4spc>X
    stylesheet <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-10>>

    <with|par-left|1.5fn|2.3<space|2spc>For system-wide use
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-11>>

    <with|par-left|3fn|2.3.1<space|2spc>Executables
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-12>>

    <with|par-left|3fn|2.3.2<space|2spc>The
    T<rsub|<space|-0.4spc><move|<resize|<with|math-level|0|E>||||0.5fn>|0fn|-0.1fn>><space|-0.4spc>X<rsub|<space|-0.4spc><move|<resize|M<space|-0.2spc>A<space|-0.4spc>CS||||0.5fn>|0fn|-0.1fn>>
    stylesheet <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-13>>

    <with|par-left|3fn|2.3.3<space|2spc>The
    L<space|-0.1667em><move|Y|0fn|-0.25em><space|-0.125em>X stylesheet
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-14>>

    <with|par-left|3fn|2.3.4<space|2spc>The
    T<rsub|<space|-0.4spc><move|<resize|<with|math-level|0|E>||||0.5fn>|0fn|-0.1fn>><space|-0.4spc>X
    stylesheet <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-15>>

    <vspace*|2fn><with|font-series|bold|math-font-series|bold|font-size|1.19|II<space|2spc>Authoring
    with Fangle> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-16><vspace|1fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>T<rsub|<space|-0.4spc><move|<resize|<with|math-level|0|E>||||0.5fn>|0fn|-0.1fn>><space|-0.4spc>X<rsub|<space|-0.4spc><move|<resize|M<space|-0.2spc>A<space|-0.4spc>CS||||0.5fn>|0fn|-0.1fn>>>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-17><vspace|0.5fn>

    <with|par-left|1.5fn|3.1<space|2spc>Load fangle style-sheet
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-18>>

    <with|par-left|1.5fn|3.2<space|2spc>Save the document
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-25>>

    <with|par-left|1.5fn|3.3<space|2spc>Sandard document parts
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-27>>

    <with|par-left|3fn|3.3.1<space|2spc>Insert your title
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-28>>

    <with|par-left|3fn|3.3.2<space|2spc>Insert your abstract
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-30>>

    <with|par-left|3fn|3.3.3<space|2spc>Insert a table of contents
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-32>>

    <with|par-left|3fn|3.3.4<space|2spc>Start a new section (or chapter)
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-34>>

    <with|par-left|1.5fn|3.4<space|2spc>Talk about your code
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-37>>

    <with|par-left|1.5fn|3.5<space|2spc>Insert your first code chunk
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-38>>

    <with|par-left|1.5fn|3.6<space|2spc>Optional chunk parameters
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-39>>

    <with|par-left|3fn|3.6.1<space|2spc>Create a tuple
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-40>>

    <with|par-left|1.5fn|3.7<space|2spc>Optional language
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-41>>

    <with|par-left|3fn|3.7.1<space|2spc>Type the language
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-42>>

    <with|par-left|1.5fn|3.8<space|2spc>Typing code
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-43>>

    <with|par-left|3fn|3.8.1<space|2spc>Referencing arguments
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-45>>

    <with|par-left|1.5fn|3.9<space|2spc>File chunks
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-46>>

    <with|par-left|3fn|3.9.1<space|2spc>French hello-world
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-47>>

    <with|par-left|3fn|3.9.2<space|2spc>German hello-world
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-50>>

    <with|par-left|1.5fn|3.10<space|2spc>The document so far
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-53>>

    <with|par-left|1.5fn|3.11<space|2spc>Additional parameters
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-54>>

    <with|par-left|3fn|3.11.1<space|2spc>Passing parameters
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-55>>

    <with|par-left|3fn|3.11.2<space|2spc>Extra chunklets
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-56>>

    <with|par-left|1.5fn|3.12<space|2spc>The completed document
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-57>>

    <vspace*|2fn><with|font-series|bold|math-font-series|bold|font-size|1.19|III<space|2spc>Generating
    the files> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-58><vspace|1fn>

    <with|par-left|1.5fn|3.13<space|2spc>Extracting individual files
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-59>>

    <with|par-left|1.5fn|3.14<space|2spc>Extracting all files
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-61>>
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

  There is a <verbatim|make install>, but you will first need to decide if
  you want a system wide installation for all users, or a private
  installation for the current user only.

  A system installation is managed with <verbatim|sudo make install> and a
  private installation is managed with <verbatim|make install-local>

  The only difference between these make targets is the default installation
  target paths.

  <subsection|Choosing the editing environment>

  If you don't already have a preferred editor, <TeXmacs> is recommended, but
  a full list of supported features is shown in table
  <reference|feature-table>.

  <big-table|<tabular|<tformat|<cwith|2|9|2|6|cell-halign|c>|<cwith|2|9|1|6|cell-tborder|1ln>|<cwith|1|9|1|1|cell-rborder|1ln>|<table|<row|<cell|<strong|features>>|<cell|<TeXmacs>>|<cell|<LyX>>|<cell|<TeX>>|<cell|Text>|<cell|Other
  with Text export>>|<row|<cell|final-layout in edit
  mode>|<cell|<tick>>|<cell|>|<cell|>|<cell|>|<cell|>>|<row|<cell|syntax
  highlighting in edit mode>|<cell|few>|<cell|>|<cell|>|<cell|>|<cell|>>|<row|<cell|syntax
  highlighting in PDF export>|<cell|few>|<cell|many>|<cell|many>|<cell|>|<cell|>>|<row|<cell|syntax
  highlighting in HTML export>|<cell|few>|<cell|>|<cell|>|<cell|>|<cell|>>|<row|<cell|line-numbers
  in edit mode>|<cell|<tick>>|<cell|>|<cell|>|<cell|>|<cell|>>|<row|<cell|hyperlinks
  in edit mode>|<cell|<tick>>|<cell|>|<cell|>|<cell|>|<cell|>>|<row|<cell|hyperlinks
  in PDF export>|<cell|<tick>>|<cell|<tick>>|<cell|<tick>>|<cell|>|<cell|>>|<row|<cell|hyperlinks
  in HTML export>|<cell|<tick>>|<cell|<tick>>|<cell|<tick>>|<cell|>|<cell|>>>>>|Feature
  comparison table<label|feature-table>>

  <subsection|For personal use>

  If the default private installation directories are acceptable, then type:

  <verbatim|make install-local>

  which will install in the following locations

  <block|<tformat|<table|<row|<cell|>|<cell|files>|<cell|locations>|<cell|override>>|<row|<cell|executables>|<cell|<verbatim|fangle>>|<cell|<verbatim|$HOME/.local/bin>>|<cell|<verbatim|BINDIR>>>|<row|<cell|<TeXmacs>
  plugins>|<cell|<verbatim|fangle.ts>>|<cell|<verbatim|$HOME/.TeXmacs><em|/plugins>>|<cell|<verbatim|TEXMACS_DIR>>>|<row|<cell|<LyX>
  modules>|<cell|<verbatim|fangle.module>>|<cell|<verbatim|$HOME/.lyx><em|/modules>>|<cell|<verbatim|LYX_DIR>>>>>>

  \;

  <subsubsection|Executables>

  Executables need installing to where personal programs are kept. This could
  just be the git checkout directory or the place where you un-tar'd
  latest.tar.gz

  I keep my personal programs in a private <verbatim|.local/bin> directory
  which I keep in my path.

  You could overide this to <verbatim|$HOME/bin> like this:

  <verbatim|make local-install BINDIR=$HOME/bin>

  If you don't have the target folder in your path (and you use bash) you
  could add it like this:

  <verbatim|echo 'export PATH=$PATH:$HOME/.local/bin' \<gtr\>\<gtr\>
  $HOME/.bashrc>

  and if you don't want to have to login again, also set the path for the
  current session:

  <verbatim|<verbatim|export PATH=$PATH:$HOME/.local/bin>>

  <subsubsection|<TeXmacs> plugins>

  The private <TeXmacs> folder is normally <verbatim|$HOME/.TeXmacs/>, in
  which the sub-folder <verbatim|plugins> exists into which the fangle plugin
  is copied.

  You could override the <TeXmacs> folder to
  <verbatim|$HOME/usr/local/texmacs/TeXmacs> like this:

  <verbatim|make local-install TEXMACS_DIR=$HOME/usr/local/texmacs/TeXmacs>

  Note that you do not have to specify the sub-folder <verbatim|plugins>
  <emdash> this is automatically added onto the provided
  <verbatim|TEXMACS_DIR>

  <subsubsection|The <LyX> stylesheet>

  If you are using <LyX>, then <verbatim|fangle.module> needs copying to your
  private\ 

  The private <LyX> folder is normally <verbatim|$HOME/.lyx/>, in which the
  sub-folder <verbatim|modules> exists into which the fangle module is
  copied.

  You could override this to <verbatim|$HOME/usr/local/lyx> like this:

  <verbatim|make local-install LYX_DIR=$HOME/usr/local/lyx>

  Note that you do not have to specify the sub-folder <verbatim|modules>
  <emdash> this is automatically added onto the provided <verbatim|LYX_DIR>

  You will also need to have Norman Ramsey's <name|noweb> stylesheet
  installed as part of your <TeX> installation.

  <subsubsection|The <TeX> stylesheet>

  <todo|Still needs ripping off out of the .module maybe>

  You will also need to have Norman Ramsey's noweb stylesheet installed.

  <subsection|For system-wide use>

  If the default system installation directories are acceptable, then type:

  <verbatim|sudo make install>

  which will install in the following locations

  <block|<tformat|<table|<row|<cell|>|<cell|files>|<cell|locations>|<cell|override>>|<row|<cell|executables>|<cell|<verbatim|fangle>>|<cell|<verbatim|/usr/local/bin>>|<cell|<verbatim|BINDIR>>>|<row|<cell|<TeXmacs>
  plugins>|<cell|<verbatim|fangle.ts>>|<cell|<verbatim|/usr/share/texmacs/TeXmacs><em|/plugins>>|<cell|<verbatim|TEXMACS_DIR>>>|<row|<cell|<LyX>
  modules>|<cell|<verbatim|fangle.module>>|<cell|<verbatim|/usr/share/lyx><em|/modules>>|<cell|<verbatim|LYX_DIR>>>>>>

  <subsubsection|Executables>

  Executables need installing where all users will find them, usually
  somewhere in the system <verbatim|PATH>. This defaults to
  <verbatim|/usr/local/bin> but you could overide to <verbatim|/usr/bin> like
  this:

  <verbatim|sudo make install BINDIR=/usr/bin>

  You could extract the entire package to <verbatim|/opt/fangle> but might
  want to add <verbatim|/opt/fangle> to the system-wide path. You could do
  that like this

  <\verbatim>
    sudo make install BINDIR=/opt/fangle/bin

    echo 'PATH=$PATH:/opt/fangle' \<gtr\>\<gtr\> /etc/profile.d/fangle.sh

    echo export PATH \<gtr\>\<gtr\> /etc/profile.d/fangle.sh
  </verbatim>

  <subsubsection|The <TeXmacs> stylesheet>

  The <TeXmacs> system-wide folder defaults to
  <verbatim|/usr/share/texmacs/TeXmacs>, but this may vary across
  installations. Within that is a sub-folder called <verbatim|plugins> into
  which the fangle plugin is copied.

  You could override like this:

  <verbatim|sudo make install TEXMACS_DIR=/usr/local/share/texmacs/TeXmacs>

  Note that you do not have to specify the sub-folder <verbatim|plugins>
  <emdash> this is automatically added onto the provided
  <verbatim|TEXMACS_DIR>

  <subsubsection|The <LyX> stylesheet>

  The <LyX> system-wide folder defaults to <verbatim|/usr/share/lyx>, but may
  vary across installations. Within that is a sub-folder called
  <samp|<verbatim|>><verbatim|modules> into which the fangle module is
  copued.

  You could override like this:

  <verbatim|sudo make install LYX_DIR=/usr/share/lyx>

  Note that you do not have to specify the sub-folder <verbatim|modules>
  <emdash> this is automatically added onto the provided <verbatim|LYX_DIR>

  You will also need to have Norman Ramsey's <name|noweb> stylesheet
  installed as part of your <TeX> installation.

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

  <menu|Insert|Section|Section> (or if you are writing a book
  <menu|Insert|Section|Chapter>), and then type the name of the section (or
  chapter):

  <keys|H|e|l|l|o|space|W|o|r|l|d|enter>

  The first chapter will generally illustrate the problem to be solved and
  explain how the book is to be used to understand and provide the solution.

  <subsection|Talk about your code>

  Before you insert a chunk of code, you introduce it.

  Usually you will have introduced some aspect of the main problem that the
  program as a whole will solve, and will then outline the aspect of the
  solution that this chunk will provide.

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

    If the text insertion point (represented by the red verticle line
    <fake-caret>) does not appear in the position shown above, then press
    <key|left> so that it does.

    <item>Type the name of your chunk: <keys|h|e|l|l|o|-|w|o|r|l|d>

    This will give you either <inactive|<nf-chunk|hello-world<fake-caret>|||>>
    for the inactive view, or the active view shown as below:

    <\sub-page>
      <\nf-fake-chunk|hello-world<fake-caret>>
        \;
      </nf-fake-chunk|||1|1a|||||>
    </sub-page>
  </enumerate>

  <subsection|Optional chunk parameters><label|insert-chunk-params>

  Internally, the chunk parameters are the fourth argument of the chunk, but
  visually are presented on the top line as the second argument of the chunk.

  For the inactive view, press <key|right><key|right><key|right> which will
  give you <inactive|<nf-chunk|hello-world|||<fake-caret>>>, but for the
  active view shown below you will just need to press <key|right> once:

  <\sub-page>
    <\nf-fake-chunk|hello-world<fake-caret>>
      \;
    </nf-fake-chunk|||1|1a|||||>
  </sub-page>

  You may now specify parameters to the code that will be contained in the
  chunk. Chunks can take optional parameters, and behave somewhat like C
  macros.

  Usually chunks will not have parameters, although parameters can be useful
  when a chunk is used to express an algorithm (like a sort) or a class of
  behaviours (like binary tree management). In such cases, a set of
  parameterized chunks can work a bit like generics or C++ templates.

  If chunk has parameters, they must be enclosed in a tuple. When I
  understand DRD's a bit better this will be done for you, but for now if you
  want chunk parameters then you should create a tuple<\footnote>
    although if you have only one parameter you don't need to use a tuple
  </footnote>, otherwise skip to the next step.

  <subsubsection|Create a tuple>

  Press <key|\\>. If this comes out as a backslash <with|color|red|\\>
  (perhaps red) instead of in angle brackets like this
  <with|color|blue|<math|\<langle\>\\\<rangle\>>> then press <key|backspace>
  and enter a command-backslash using the meta key (probably the windows
  button) by pressing <key|M-\\>.\ 

  Once you have the <with|color|blue|<math|\<langle\>\\\<rangle\>>>, type
  <keys|t|u|p|l|e|enter>.

  Type the first chunk argument, and then for additional arguments,
  <key|M-right> (windows key and right arrow).

  You can type multiple parameters: <inactive|<nf-chunk|hello-world|||<tuple|message|language<fake-caret>>>>
  or

  <\sub-page>
    <\nf-fake-chunk|hello-world>
      \;
    </nf-fake-chunk||<tuple|message|language<fake-caret>>|1|1a|||||>
  </sub-page>

  <subsection|Optional language>

  The language is the third argument of the chunk, and is to specify the
  computer language of the code that will be contained in the chunk. This is
  to aid syntax highlighting (for supported languages) as well as automatic
  quoting when code for one language is inserted into another. For instance
  if a shell chunk: <verbatim|echo $PWD> is included in a makefile it will
  automatically be quoted or escaped as <verbatim|echo $$PWD>. This makes
  simplifies composing programs from chunks in different code libraries.

  <subsubsection|Type the language>

  For the inactive view, press <key|left>...<key|left> until the text
  insertion mark <fake-caret> is placed in the third argument of the chunk:
  <inactive|<nf-chunk|hello-world||<fake-caret>|<tuple|message|language>>> or

  For the active view, press <key|right> to select the third argument

  <\sub-page>
    <\nf-fake-chunk|hello-world>
      \;
    </nf-fake-chunk|<fake-caret>|<tuple|message|language>|1|1a|||||>
  </sub-page>

  For syntax markup, <TeXmacs> supports C++ (called <verbatim|cpp>) and
  bourne shell (called <verbatim|sh>), but for automatic quoting fangle
  supports many more languages.

  In our example we are using C which we will have to specify as
  <verbatim|cpp>.

  Enter the language <verbatim|cpp>: <inactive|<nf-chunk|hello-world||cpp<fake-caret>|<tuple|message|language>>>
  or

  <\sub-page>
    <\nf-fake-chunk|hello-world>
      \;
    </nf-fake-chunk|cpp<fake-caret>|<tuple|message|language>|1|1a|||||>
  </sub-page>

  <subsection|Typing code>

  If your chunk shows as inactive then the main code area will be visible as
  the third argument and you should press <key|left>, but you may prefer to
  activate your chunk at this point. You should be able to do this by
  pressing <key|enter> or clicking the <image|<tuple|<#89504E470D0A1A0A0000000D49484452000000110000001108060000003B6D47FA000000017352474200AECE1CE900000006624B474400FF00FF00FFA0BDA793000000097048597300000B1300000B1301009A9C180000000774494D4507DB06120F0303780569BC0000001974455874436F6D6D656E74004372656174656420776974682047494D5057810E17000000924944415438CBBD94D10D80200C440FE3127E38846C0303EA3665083F1CA37E95102D52A2B17F90DCCB91BBE22811E3E50CF860C6F2E0176F1652221D020031C42660DDD6BA935EB119721532339C733688888FFDC877D33CD99C68620130731D52A67215B700B927129706E82A1B2552DFDC72A136B60459002A2486584DA16B77046471F11831805BA94C9072A97EFF0A4E5C193CCC5933FA210000000049454E44AE426082>|png>|2ex|||>
  icon on the toolbar. Sometimes the <image|<tuple|<#89504E470D0A1A0A0000000D49484452000000110000001108060000003B6D47FA000000017352474200AECE1CE900000006624B474400FF00FF00FFA0BDA793000000097048597300000B1300000B1301009A9C180000000774494D4507DB06120F0303780569BC0000001974455874436F6D6D656E74004372656174656420776974682047494D5057810E17000000924944415438CBBD94D10D80200C440FE3127E38846C0303EA3665083F1CA37E95102D52A2B17F90DCCB91BBE22811E3E50CF860C6F2E0176F1652221D020031C42660DDD6BA935EB119721532339C733688888FFDC877D33CD99C68620130731D52A67215B700B927129706E82A1B2552DFDC72A136B60459002A2486584DA16B77046471F11831805BA94C9072A97EFF0A4E5C193CCC5933FA210000000049454E44AE426082>|png>|2ex|||>
  icon is absent and pressing enter does nothing <emdash> in which case try
  the <menu|Tools|Update|Styles> and if that doesn't work then I don't know
  what to do.

  For active chunks the main code area is visible below the header, and you
  would enter this by pressing <key|down>

  The code body is an enumerate style. Press <key|enter> to insert a new
  numbered line. (You'll probably want to press <keys|left|backspace|right>
  to delete the blank line that is somehow there. <todo|stop that from
  happening>

  <\sub-page>
    <\nf-fake-chunk|hello-world>
      <item><fake-caret>
    </nf-fake-chunk|cpp|<tuple|message|language>|1|1a|||||>
  </sub-page>

  At this point, start typing code.

  When you press <key|enter>, a new line number will be inserted at the left
  of the listing. If you press <key|S-enter> then you can break the line for
  layout purposes, but it will not be considered a new-line when the code is
  extracted, and leading white-space will be stripped.

  <\sub-page>
    <\nf-fake-chunk|hello-world>
      <item>#include \<less\>stdio.h\<gtr\>

      <item>

      <item>main() {

      <item> \ printf("<fake-caret>
    </nf-fake-chunk|cpp|<tuple|message|language>|1|1a|||||>
  </sub-page>

  The listing above is incomplete. Instead of typing the the traditional
  <verbatim|hello world!>, we can make use of our chunk arguments. Let's
  place the value of the argument <with|color|blue|message> at this point.

  <subsubsection|Referencing arguments><label|chunk-arguments>

  The command for a chunk argument is <keys|\\|n|f|-|a|r|g>, but when you
  press the <key|\\> it will enter a literal <verbatim|\\> because the cursor
  is in a code block. To enter a command-backslash in code block, use the
  meta key (probably the windows button): <keys|meta-\\|n|f|-|a|r|g> and this
  will produce: <inactive*|<nf-arg|>>

  To enter the name of the argument <with|color|blue|message>, type
  <keys|m|e|s|s|a|g|e|right> which will produce <nf-arg|message>

  Finish typing the code as shown below:

  <\sub-page>
    <\nf-fake-chunk|hello-world>
      <item>#include \<less\>stdio.h\<gtr\>

      <item>

      <item>main() {

      <item> \ printf("<nf-arg|message>\\n");

      <item>}<fake-caret>
    </nf-fake-chunk|cpp|<tuple|message|language>|1|1a|||||>
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

  Then, create a chunk called hello-world.fr.c, by typing:
  <keys|\\|n|f|-|c|h|u|n|k|enter> and then the chunk name
  <keys|.|/|h|e|l|l|o|-|w|o|r|l|d|.|f|r|.|c|right|right>

  <\sub-page>
    <strong|<small|1.1 In French>><htab|0mm>

    We will derive the french hello-world program like this:<htab|0mm>

    <\nf-fake-chunk|./hello-world.fr.c>
      <item><fake-caret>
    </nf-fake-chunk|cpp||1|1b|||||>
  </sub-page>

  To include our previous chunk with the <verbatim|nf-ref> command, type
  <keys|M-\\|n|f|-|r|e|f|enter> and then type the name of our previous chunk,
  <keys|h|e|l|l|o|-|w|o|r|l|d>

  We then move to the arguments part of the <verbatim|nf-ref>, <key|right>,
  and type the argument <em|Bonjour tout le monde> in a tuple:

  <keys|M-\\|t|u|p|l|e|enter|B|o|n|j|o|u|r|space|t|o|u|t|space|l|e|space|m|o|n|d|e|enter>

  <\sub-page>
    <strong|<small|1.1 In French>><htab|0mm>

    We will derive the french hello-world program like this:<htab|0mm>

    <\nf-fake-chunk|./hello-world.fr.c>
      <item><nf-fake-ref|hello-world|<tuple|Bonjour tout le
      monde>|1a><fake-caret>
    </nf-fake-chunk|cpp||1|1b|||||>
  </sub-page>

  Note that when there are no arguments to the reference, the parenthesis do
  not appear, but they appear automatically when there are arguments.

  <subsubsection|German hello-world>

  And let's create a similar chunk for german. Insert a new sub-section:

  <menu|Insert|Section|Subsection> (or <menu|Insert|Section|Section>) and
  type the name of the subsection:

  <key|I n> <key|space> <key|G e r m a n> <key|enter>

  Then introduce the next code chunk, type:
  <keys|W|e|space|w|i|l|l|space|d|e|r|i|v|e|space|t|h|e|space|g|e|r|m|a|n|space|h|e|l|l|o|-|w|o|r|l|d|space|p|r|o|g|r|a|m|space|l|i|k|e|space|t|h|i|s|:|enter>

  Create a chunk called hello-world.de.c, by typing:
  <keys|\\|n|f|-|c|h|u|n|k|enter> and then the chunk name
  <keys|.|/|h|e|l|l|o|-|w|o|r|l|d|.|d|e|.|c|right|right>

  <\sub-page>
    <strong|<small|1.2 In German>><htab|0mm>

    We will derive the german hello-world program like this:<htab|0mm>

    <\nf-fake-chunk|./hello-world.de.c>
      <item><nf-fake-ref|hello-world|<tuple|Hallo welt>|1a><fake-caret>
    </nf-fake-chunk|cpp||1|1c|||||>
  </sub-page>

  <subsection|The document so far>

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

      <with|par-left|1.5fn| \ \ \ 1.1<space|2spc>In French
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break>1><vspace|0.0fn>

      <with|par-left|1.5fn| \ \ \ 1.2<space|2spc>In German
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break>1><vspace|0.5fn>
    </with>

    <with|font-series|bold|math-font-series|bold|1 Hello World>

    The typical hello-world program looks like this:

    <\nf-fake-chunk|hello-world>
      <item>#include \<less\>stdio.h\<gtr\>

      <item>

      <item>main() {

      <item> \ printf("%s\\n", "<nf-arg|message>");

      <item>}
    </nf-fake-chunk|cpp|<tuple|message|language>|1|1c|||||>

    <strong|<small|1.1 In French>>

    We will derive the french hello-world program like this:<htab|0mm>

    <\nf-fake-chunk|./hello-world.fr.c>
      <item><nf-fake-ref|hello-world|<tuple|Bonjour tout le monde|french>|1a>
    </nf-fake-chunk|text|<tuple>|1|1b|||||>

    <small|<strong|1.2 In German>>

    We will derive the german hello-world program like this:<htab|0mm>

    <\nf-fake-chunk|./hello-world.de.c>
      <item><nf-fake-ref|hello-world|<tuple|Hallo welt|german>|1a>
    </nf-fake-chunk|text|<tuple>|1|1c|||||>
  </sub-page>

  <no-page-break*>Which demonstrates nicely how to use fangle in terms of
  function, but less so in terms of style.

  We'll now modify the document to introduce a better narrative.

  <subsection|Additional parameters>

  Astute readers will have noticed that the <verbatim|hello-world> chunk has
  two parameters but that our french and german invocations only have one
  argument. This is not really a problem as the <verbatim|hello-world> chunk
  only uses one; but let's change that.

  <subsubsection|Passing parameters>

  We will modify our french and german .c files by clicking inside
  <with|color|blue|Bonjour tout le monde> and extending the tuple by pressing
  <key|M-right>, and then typing: <key|f r e n c h>

  <\sub-page>
    <\nf-fake-chunk|./hello-world.fr.c>
      <item><nf-fake-ref|hello-world|<tuple|Bonjour tout le
      monde|french>|1a><fake-caret>
    </nf-fake-chunk|cpp||1|1b|||||>
  </sub-page>

  And doing similarly for the german:

  <\sub-page>
    <\nf-fake-chunk|./hello-world.de.c>
      <item><nf-fake-ref|hello-world|<tuple|Hallo
      welt|german>|1a><fake-caret>
    </nf-fake-chunk|cpp||1|1c|||||>
  </sub-page>

  <subsubsection|Extra chunklets>

  We will now modify the main code chunk. Position the text insertion point
  at the end of the paragraph before chunk 1a and using <key|backspace>
  delete up to the word <em|program> and then type
  <keys|space|s|h|o|u|l|d|space|b|e|g|i|n|space|w|i|t|h|space|a|n|space|i|n|t|r|o|d|u|c|t|o|r|y|space|c|o|m|m|e|n|t|:>

  <\sub-page>
    \;

    The typical hello-world program should begin with an introductory
    comment:<fake-caret>

    <\nf-fake-chunk|hello-world>
      <item>#include \<less\>stdio.h\<gtr\>

      <item>

      <item>main() {

      <item> \ printf("<nf-arg|message>\\n");

      <item>}
    </nf-fake-chunk|cpp|<tuple|message|language>|1|1a|||||>
  </sub-page>

  We will now enter another hello-world chunk by typing
  <keys|\\|n|f|-|c|h|u|n|k|enter> and calling it <verbatim|hello-world> as
  before.

  The <em|hello-world> chunk now has two chunklets. The new chunklet is
  labelled 1a because it is first chunklet on page 1, and the original
  chunklet is called 1b because it is the second chunklet on page 1.

  These two chunklets also refer to eachother as the previous and next
  chunklet of the same chunk.

  The second chunklet also has <small|[2]> after the chunk name because it is
  part 2 of the <em|hello-world> chunk. It also has a link
  <math|\<Uparrow\>>1a pointing to the first chunklet.

  Note that the second chunklet no longer has any parameters showing <emdash>
  this is because it must use the same parameters as the first chunklet.

  <\sub-page>
    \;

    The typical hello-world program should begin with an introductory
    comment:<fake-caret>

    <\nf-fake-chunk|hello-world>
      \;
    </nf-fake-chunk|cpp||1|1a|||||>

    <\nf-fake-chunk|hello-world>
      <item>#include \<less\>stdio.h\<gtr\>

      <item>

      <item>main() {

      <item> \ printf("<nf-arg|message>\\n");

      <item>}
    </nf-fake-chunk|cpp|<tuple|>|2|1b|||||>
  </sub-page>

  Create parameters for the first chunklet, as explained in
  <reference|insert-chunk-params>, and these are then replicated in the other
  chunklet.

  In the first chunklet we type a C comment so that the generated program
  will properly identify itself and it's purpose. When you come to insert
  <nf-arg|language> you may wish to refer to <reference|chunk-arguments>

  When the final program is generated, the language will be inserted into the
  comment.

  <\sub-page>
    \;

    The typical hello-world program should begin with an introductory
    comment:<fake-caret>

    <\nf-fake-chunk|hello-world>
      <item>/* The traditional hello-world program in <nf-arg|language>\ 

      <item> * generated using fangle literate programming macros

      <item> */

      <item>
    </nf-fake-chunk|cpp|<tuple|message|language>|1|1a||||<math|\<triangledown\>>|1b>

    <\nf-fake-chunk|hello-world>
      <assign|item-nr|4><item>#include \<less\>stdio.h\<gtr\>

      <item>

      <item>main() {

      <item> \ printf("<nf-arg|message>\\n");

      <item>}<fake-caret>
    </nf-fake-chunk|cpp|<tuple|message|language>|2|1b|1a|<math|\<vartriangle\>>|1a||>
  </sub-page>

  We see that chunk 1b is not very well explained, <math|>and is only obvious
  to someone who has already graduated beyond <em|hello-world>. We need to
  add more narrative <emdash> we need to explain the meaning of the
  <verbatim|include> statement.

  <keys|W|e|space|m|u|s|t|space|i|n|c|l|u|d|e|space|shift-F7|s|t|d|i|o|.|h|right|space|w|h|i|c|h|space|d|e|f|i|n|e|s|space|shift-F7|p|r|i|n|t|f|right|.|enter>

  <\sub-page>
    \;

    The typical hello-world program should begin with an introductory
    comment:<fake-caret>

    <\nf-fake-chunk|hello-world>
      <item>/* The traditional hello-world program in <nf-arg|language>

      <item> * generated using fangle literate programming macros

      <item> */

      <item>
    </nf-fake-chunk|cpp|<tuple|message|language>|1|1a|||||<with|mode|math|><with|mode|math|\<triangledown\>>1b>

    We must include <verbatim|stdio.h> which defines <verbatim|printf>.

    <\nf-fake-chunk|hello-world>
      <assign|item-nr|4><item>#include \<less\>stdio.h\<gtr\>

      <item>

      <item>main() {

      <item> \ printf("<nf-arg|message>\\n");

      <item>}<fake-caret>
    </nf-fake-chunk|cpp|<tuple|message|language>|2|1b|1a||||<with|mode|math|\<vartriangle\>>1a>
  </sub-page>

  But we also wish to explain the <verbatim|main> function, so we need to
  split the block.

  <todo|Clearly I need to write a split-block macro, but in the meantime...>

  Insert <em|yet another> chunklet called hello-world and cut-n-paste the
  lines from the second chunklet into the third chunklet.

  <\sub-page>
    \;

    The typical hello-world program should begin with an introductory
    comment:<fake-caret>

    <\nf-fake-chunk|hello-world>
      <item>/* The traditional hello-world program in <nf-arg|language>

      <item> * generated using fangle literate programming macros

      <item> */

      <item>
    </nf-fake-chunk|cpp|<tuple|message|language>|1|1a|||||<with|mode|math|><with|mode|math|\<triangledown\>>1b>

    We must include <verbatim|stdio.h> which defines <verbatim|printf>.

    <\nf-fake-chunk|hello-world>
      <assign|item-nr|4><item>#include \<less\>stdio.h\<gtr\>

      <item>
    </nf-fake-chunk|cpp|<tuple|message|language>|2|1b|||||>

    Our <verbatim|main()> function does not use arguments, so we do not
    declare them. We then print the message using <verbatim|printf>. We avoid
    the beginner mistake of passing the message as the first argument which
    might cause a crash if it contained formatting characters of it's own -
    like <verbatim|%s>.

    <\nf-fake-chunk|hello-world>
      <assign|item-nr|6><item>main() {

      <item> \ printf("<nf-arg|message>\\n");

      <item>}<fake-caret>
    </nf-fake-chunk|cpp|<tuple|message|language>|3|1c|||||>
  </sub-page>

  \;

  That's a pretty rotten explanation of the main function <emdash> see if you
  can do any better.

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

      <with|par-left|1.5fn| \ \ \ 1.1<space|2spc>In French
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break>1><vspace|0.0fn>

      <with|par-left|1.5fn| \ \ \ 1.2<space|2spc>In German
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break>1><vspace|0.5fn>
    </with>

    <with|font-series|bold|math-font-series|bold|1 Hello World>

    The typical hello-world program should begin with an introductory
    comment:

    <\nf-fake-chunk|hello-world>
      <item>/* The traditional hello-world program in <nf-arg|language>\ 

      <item> * generated using fangle literate programming macros

      <item> */

      <item>
    </nf-fake-chunk|cpp|<tuple|message|language>|1|1a|||||>

    We must include <verbatim|stdio.h> which defines <verbatim|printf>.

    <\nf-fake-chunk|hello-world>
      <assign|item-nr|4><item>#include \<less\>stdio.h\<gtr\>
    </nf-fake-chunk|cpp|<tuple|message|language>|1|1b|||||>

    Our <verbatim|main()> function does not use arguments, so we do not
    declare them. We then print the message using <verbatim|printf>. We avoid
    the beginner mistake of passing the message as the first argument which
    might cause a crash if it contained formatting characters of it's own -
    like <verbatim|%s>.

    <\nf-fake-chunk|hello-world>
      <assign|item-nr|5><item>

      <item>main() {

      <item> \ printf("%s\\n", "<nf-arg|message>");

      <item>}
    </nf-fake-chunk|cpp|<tuple|message|language>|1|1c|||||>

    <strong|<small|1.1 In French>>

    We will derive the french hello-world program like this:<htab|0mm>

    <\nf-fake-chunk|./hello-world.fr.c>
      <item><nf-fake-ref|hello-world|<tuple|Bonjour tout le monde|french>|1a>
    </nf-fake-chunk|text|<tuple>|1|1b|||||>

    <small|<strong|1.2 In German>>

    We will derive the german hello-world program like this:<htab|0mm>

    <\nf-fake-chunk|./hello-world.de.c>
      <item><nf-fake-ref|hello-world|<tuple|Hallo welt|german>|1a>
    </nf-fake-chunk|text|<tuple>|1|1c|||||>
  </sub-page>

  \;

  <part|Generating the files>

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
        /* The traditional hello-world program in french\ 

        \ * generated using fangle literate programming macros

        \ */

        \;

        #include stdio.c

        \;

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

    do fangle -R"$file" hello-world.txt \<gtr\> "$file"

    done
  </verbatim>

  If you have <em|noweb> installed then you can use <verbatim|cpif> to avoid
  updating files that haven't changed:

  <\verbatim>
    texmacs -s -c hello-world.tm hello-world.txt -q &&

    fangle -r hello-world.txt \| while read file

    do fangle -R"$file" hello-world.txt \| cpif "$file"

    done
  </verbatim>
</body>

<\initial>
  <\collection>
    <associate|page-medium|papyrus>
    <associate|page-screen-height|746496tmpt>
    <associate|page-screen-margin|false>
    <associate|page-screen-width|1268736tmpt>
    <associate|preamble|false>
    <associate|sfactor|3>
  </collection>
</initial>

<\references>
  <\collection>
    <associate||<tuple|?a|?>>
    <associate|./hello-world.de.c|<tuple||?>>
    <associate|./hello-world.fr.c|<tuple||?>>
    <associate|a|<tuple|?b|?>>
    <associate|auto-1|<tuple|I|2>>
    <associate|auto-10|<tuple|2.2.4|4>>
    <associate|auto-11|<tuple|2.3|4>>
    <associate|auto-12|<tuple|2.3.1|4>>
    <associate|auto-13|<tuple|2.3.2|4>>
    <associate|auto-14|<tuple|2.3.3|4>>
    <associate|auto-15|<tuple|2.3.4|5>>
    <associate|auto-16|<tuple|II|5>>
    <associate|auto-17|<tuple|3|5>>
    <associate|auto-18|<tuple|3.1|5>>
    <associate|auto-19|<tuple|2|5>>
    <associate|auto-2|<tuple|1|2>>
    <associate|auto-20|<tuple|3|5>>
    <associate|auto-21|<tuple|3|5>>
    <associate|auto-22|<tuple|4|6>>
    <associate|auto-23|<tuple|4|6>>
    <associate|auto-24|<tuple|4|6>>
    <associate|auto-25|<tuple|3.2|6>>
    <associate|auto-26|<tuple|3.2|6>>
    <associate|auto-27|<tuple|3.3|6>>
    <associate|auto-28|<tuple|3.3.1|6>>
    <associate|auto-29|<tuple|3.3.1|6>>
    <associate|auto-3|<tuple|2|2>>
    <associate|auto-30|<tuple|3.3.2|6>>
    <associate|auto-31|<tuple|3.3.2|6>>
    <associate|auto-32|<tuple|3.3.3|6>>
    <associate|auto-33|<tuple|3.3.3|6>>
    <associate|auto-34|<tuple|3.3.4|6>>
    <associate|auto-35|<tuple|3.3.4|6>>
    <associate|auto-36|<tuple|3.3.4|6>>
    <associate|auto-37|<tuple|3.4|6>>
    <associate|auto-38|<tuple|3.5|7>>
    <associate|auto-39|<tuple|3.6|7>>
    <associate|auto-4|<tuple|2.1|2>>
    <associate|auto-40|<tuple|3.6.1|8>>
    <associate|auto-41|<tuple|3.7|8>>
    <associate|auto-42|<tuple|3.7.1|8>>
    <associate|auto-43|<tuple|3.8|9>>
    <associate|auto-44|<tuple|3.8|9>>
    <associate|auto-45|<tuple|3.8.1|9>>
    <associate|auto-46|<tuple|3.9|10>>
    <associate|auto-47|<tuple|3.9.1|10>>
    <associate|auto-48|<tuple|3.9.1|10>>
    <associate|auto-49|<tuple|3.9.1|10>>
    <associate|auto-5|<tuple|1|3>>
    <associate|auto-50|<tuple|3.9.2|10>>
    <associate|auto-51|<tuple|3.9.2|10>>
    <associate|auto-52|<tuple|3.9.2|10>>
    <associate|auto-53|<tuple|3.10|11>>
    <associate|auto-54|<tuple|3.11|12>>
    <associate|auto-55|<tuple|3.11.1|12>>
    <associate|auto-56|<tuple|3.11.2|12>>
    <associate|auto-57|<tuple|3.12|15>>
    <associate|auto-58|<tuple|III|16>>
    <associate|auto-59|<tuple|3.13|16>>
    <associate|auto-6|<tuple|2.2|3>>
    <associate|auto-60|<tuple|2|16>>
    <associate|auto-61|<tuple|3.14|16>>
    <associate|auto-7|<tuple|2.2.1|3>>
    <associate|auto-8|<tuple|2.2.2|3>>
    <associate|auto-9|<tuple|2.2.3|3>>
    <associate|chunk-arguments|<tuple|3.8.1|9>>
    <associate|code-end--1|<tuple|?a|?>>
    <associate|code-end-a-1|<tuple|?a|?>>
    <associate|code-end-a-2|<tuple|?b|?>>
    <associate|code-label--1|<tuple|[ 1]|?>>
    <associate|code-label-a-1|<tuple|[a 1]|?>>
    <associate|code-label-a-2|<tuple|[a 2]|?>>
    <associate|code-ref--1|<tuple|?a|?>>
    <associate|code-ref-a-1|<tuple|?a|?>>
    <associate|code-ref-a-2|<tuple|?b|?>>
    <associate|feature-table|<tuple|1|3>>
    <associate|footnote-1|<tuple|1|5>>
    <associate|footnote-2|<tuple|2|8>>
    <associate|footnr-1|<tuple|1|5>>
    <associate|footnr-2|<tuple|2|8>>
    <associate|hello-world|<tuple||?>>
    <associate|insert-chunk-params|<tuple|3.6|7>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|idx>
      <tuple|<tuple|<with|font-family|<quote|ss>|Document>|<with|font-family|<quote|ss>|Style>|<with|font-family|<quote|ss>|article>>|<pageref|auto-19>>

      <tuple|<tuple|<with|font-family|<quote|ss>|Document>|<with|font-family|<quote|ss>|Add
      package>|<with|font-family|<quote|ss>|fangle>>|<pageref|auto-20>>

      <tuple|<tuple|<with|font-family|<quote|ss>|Tools>|<with|font-family|<quote|ss>|Update>|<with|font-family|<quote|ss>|Styles>>|<pageref|auto-21>>

      <tuple|<tuple|<with|font-family|<quote|ss>|Document>|<with|font-family|<quote|ss>|View>|<with|font-family|<quote|ss>|Create
      preamble>>|<pageref|auto-22>>

      <tuple|<tuple|<with|font-family|<quote|ss>|Document>|<with|font-family|<quote|ss>|View>|<with|font-family|<quote|ss>|Show
      preamble>>|<pageref|auto-23>>

      <tuple|<tuple|<with|font-family|<quote|ss>|Document>|<with|font-family|<quote|ss>|View>|<with|font-family|<quote|ss>|Show
      all parts>>|<pageref|auto-24>>

      <tuple|<tuple|<with|font-family|<quote|ss>|File>|<with|font-family|<quote|ss>|Save>>|<pageref|auto-26>>

      <tuple|<tuple|<with|font-family|<quote|ss>|Insert>|<with|font-family|<quote|ss>|Title>|<with|font-family|<quote|ss>|Insert
      title>>|<pageref|auto-29>>

      <tuple|<tuple|<with|font-family|<quote|ss>|Insert>|<with|font-family|<quote|ss>|Title>|<with|font-family|<quote|ss>|Abstract>>|<pageref|auto-31>>

      <tuple|<tuple|<with|font-family|<quote|ss>|Insert>|<with|font-family|<quote|ss>|Automatic>|<with|font-family|<quote|ss>|Table
      of contents>>|<pageref|auto-33>>

      <tuple|<tuple|<with|font-family|<quote|ss>|Insert>|<with|font-family|<quote|ss>|Section>|<with|font-family|<quote|ss>|Section>>|<pageref|auto-35>>

      <tuple|<tuple|<with|font-family|<quote|ss>|Insert>|<with|font-family|<quote|ss>|Section>|<with|font-family|<quote|ss>|Chapter>>|<pageref|auto-36>>

      <tuple|<tuple|<with|font-family|<quote|ss>|Tools>|<with|font-family|<quote|ss>|Update>|<with|font-family|<quote|ss>|Styles>>|<pageref|auto-44>>

      <tuple|<tuple|<with|font-family|<quote|ss>|Insert>|<with|font-family|<quote|ss>|Section>|<with|font-family|<quote|ss>|Subsection>>|<pageref|auto-48>>

      <tuple|<tuple|<with|font-family|<quote|ss>|Insert>|<with|font-family|<quote|ss>|Section>|<with|font-family|<quote|ss>|Section>>|<pageref|auto-49>>

      <tuple|<tuple|<with|font-family|<quote|ss>|Insert>|<with|font-family|<quote|ss>|Section>|<with|font-family|<quote|ss>|Subsection>>|<pageref|auto-51>>

      <tuple|<tuple|<with|font-family|<quote|ss>|Insert>|<with|font-family|<quote|ss>|Section>|<with|font-family|<quote|ss>|Section>>|<pageref|auto-52>>

      <tuple|<tuple|<with|font-family|<quote|ss>|File>|<with|font-family|<quote|ss>|Export\|Verbatim>>|<pageref|auto-60>>
    </associate>
    <\associate|table>
      <tuple|normal|Feature comparison table<label|feature-table>|<pageref|auto-5>>
    </associate>
    <\associate|toc>
      <vspace*|2fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|font-size|<quote|1.19>|I<space|2spc>Getting
      and Installing Fangle> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|1fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Getting
      Fangle> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Installing
      Fangle> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <with|par-left|<quote|1.5fn>|2.1<space|2spc>Choosing the editing
      environment <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <with|par-left|<quote|1.5fn>|2.2<space|2spc>For personal use
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      <with|par-left|<quote|3fn>|2.2.1<space|2spc>Executables
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>

      <with|par-left|<quote|3fn>|2.2.2<space|2spc>T<rsub|<space|-0.4spc><move|<resize|<with|math-level|<quote|0>|E>||||0.5fn>|0fn|-0.1fn>><space|-0.4spc>X<rsub|<space|-0.4spc><move|<resize|M<space|-0.2spc>A<space|-0.4spc>CS||||0.5fn>|0fn|-0.1fn>>
      plugins <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8>>

      <with|par-left|<quote|3fn>|2.2.3<space|2spc>The
      L<space|-0.1667em><move|Y|0fn|-0.25em><space|-0.125em>X stylesheet
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9>>

      <with|par-left|<quote|3fn>|2.2.4<space|2spc>The
      T<rsub|<space|-0.4spc><move|<resize|<with|math-level|<quote|0>|E>||||0.5fn>|0fn|-0.1fn>><space|-0.4spc>X
      stylesheet <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10>>

      <with|par-left|<quote|1.5fn>|2.3<space|2spc>For system-wide use
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11>>

      <with|par-left|<quote|3fn>|2.3.1<space|2spc>Executables
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-12>>

      <with|par-left|<quote|3fn>|2.3.2<space|2spc>The
      T<rsub|<space|-0.4spc><move|<resize|<with|math-level|<quote|0>|E>||||0.5fn>|0fn|-0.1fn>><space|-0.4spc>X<rsub|<space|-0.4spc><move|<resize|M<space|-0.2spc>A<space|-0.4spc>CS||||0.5fn>|0fn|-0.1fn>>
      stylesheet <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-13>>

      <with|par-left|<quote|3fn>|2.3.3<space|2spc>The
      L<space|-0.1667em><move|Y|0fn|-0.25em><space|-0.125em>X stylesheet
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-14>>

      <with|par-left|<quote|3fn>|2.3.4<space|2spc>The
      T<rsub|<space|-0.4spc><move|<resize|<with|math-level|<quote|0>|E>||||0.5fn>|0fn|-0.1fn>><space|-0.4spc>X
      stylesheet <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-15>>

      <vspace*|2fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|font-size|<quote|1.19>|II<space|2spc>Authoring
      with Fangle> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-16><vspace|1fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>T<rsub|<space|-0.4spc><move|<resize|<with|math-level|<quote|0>|E>||||0.5fn>|0fn|-0.1fn>><space|-0.4spc>X<rsub|<space|-0.4spc><move|<resize|M<space|-0.2spc>A<space|-0.4spc>CS||||0.5fn>|0fn|-0.1fn>>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-17><vspace|0.5fn>

      <with|par-left|<quote|1.5fn>|3.1<space|2spc>Load fangle style-sheet
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-18>>

      <with|par-left|<quote|1.5fn>|3.2<space|2spc>Save the document
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-25>>

      <with|par-left|<quote|1.5fn>|3.3<space|2spc>Sandard document parts
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-27>>

      <with|par-left|<quote|3fn>|3.3.1<space|2spc>Insert your title
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-28>>

      <with|par-left|<quote|3fn>|3.3.2<space|2spc>Insert your abstract
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-30>>

      <with|par-left|<quote|3fn>|3.3.3<space|2spc>Insert a table of contents
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-32>>

      <with|par-left|<quote|3fn>|3.3.4<space|2spc>Start a new section (or
      chapter) <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-34>>

      <with|par-left|<quote|1.5fn>|3.4<space|2spc>Talk about your code
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-37>>

      <with|par-left|<quote|1.5fn>|3.5<space|2spc>Insert your first code
      chunk <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-38>>

      <with|par-left|<quote|1.5fn>|3.6<space|2spc>Optional chunk parameters
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-39>>

      <with|par-left|<quote|3fn>|3.6.1<space|2spc>Create a tuple
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-40>>

      <with|par-left|<quote|1.5fn>|3.7<space|2spc>Optional language
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-41>>

      <with|par-left|<quote|3fn>|3.7.1<space|2spc>Type the language
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-42>>

      <with|par-left|<quote|1.5fn>|3.8<space|2spc>Typing code
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-43>>

      <with|par-left|<quote|3fn>|3.8.1<space|2spc>Referencing arguments
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-45>>

      <with|par-left|<quote|1.5fn>|3.9<space|2spc>File chunks
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-46>>

      <with|par-left|<quote|3fn>|3.9.1<space|2spc>French hello-world
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-47>>

      <with|par-left|<quote|3fn>|3.9.2<space|2spc>German hello-world
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-50>>

      <with|par-left|<quote|1.5fn>|3.10<space|2spc>The document so far
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-53>>

      <with|par-left|<quote|1.5fn>|3.11<space|2spc>Additional parameters
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-54>>

      <with|par-left|<quote|3fn>|3.11.1<space|2spc>Passing parameters
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-55>>

      <with|par-left|<quote|3fn>|3.11.2<space|2spc>Extra chunklets
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-56>>

      <with|par-left|<quote|1.5fn>|3.12<space|2spc>The completed document
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-57>>

      <vspace*|2fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|font-size|<quote|1.19>|III<space|2spc>Generating
      the files> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-58><vspace|1fn>

      <with|par-left|<quote|1.5fn>|3.13<space|2spc>Extracting individual
      files <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-59>>

      <with|par-left|<quote|1.5fn>|3.14<space|2spc>Extracting all files
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-61>>
    </associate>
  </collection>
</auxiliary>