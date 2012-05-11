<TeXmacs|1.0.7.10>

<style|<tuple|article|fangle>>

<\body>
  <hide-preamble|<assign|LyX|<macro|L<space|-0.1667em><move|Y|0fn|-0.25em><space|-0.125em>X>>>

  <doc-data|<doc-title|Sample Literate Programming>|<doc-author-data|<author-name|Sam
  Liddicott>|<\author-address>
    Using <TeXmacs> and Fangle
  </author-address>>>

  <\abstract>
    Literate Programming will not be explained here but it will be shown as a
    way narrate program development showing the progression of ideas a is
    natural for humans to understand, leaving the generation of programs from
    those ideas to the machine.

    <TeXmacs> is used as the editor and <name|Fangle><\footnote>
      http://new.fangled.org
    </footnote> as the extraction tool.
  </abstract>

  Here we will explain the popular <em|hello world> written in <name|C>.

  <subsubsection|Message>

  Here is the message that we wish to give to world:

  <nf-chunk|message|Hello World!|txt|>

  Because we did not press enter in the literate programming environment,
  this line is not prefixed in the document tree with an
  <verbatim|\<less\>item\<gtr\>> tag and so has no line number displayed and
  is not a line but a line-fragment.

  <\note>
    The header contains the chunk name <em|message> as well as the language
    of the listing which is <em|txt>. The beginning of the header gives the
    id to this <em|chunk> of code <emdash> <chunk-reference|message|1>
    <emdash> which suggests to the reader that it is the first chunk on page
    <chunk-page-reference|message|1>. <\footnote>
      The label and hyperlink <chunk-reference|message|1> were generated with
      the <TeXmacs> document tag <verbatim|\<less\>chunk-reference\|message\|1\<gtr\>>
      to generate a link to the first chunklet of the chunk named
      <em|message>.
    </footnote>
  </note>

  <subsubsection|Displaying the message>

  We have a few choices available. The message can be output with
  <verbatim|printf>, like this:

  <\nf-chunk|message-printf>
    <item>printf("<nf-ref|message>\\n");
  </nf-chunk|cpp|>

  or even with <verbatim|puts>:

  <\nf-chunk|message-puts>
    <item>puts("<nf-ref|message>\\n");
  <|nf-chunk>
    cpp
  </nf-chunk>

  But, we prefer <verbatim|printf> which is more traditional.

  <\note>
    These last two chunks have a different letter for the chunk reference
    even though they may be on the same page.
  </note>

  <\note>
    They also contain a line number, because they are intended to be a full
    line of text.
  </note>

  <subsubsection|The main function>

  <\note>
    If a code chunk is split across two pages, as this next code chunk is,
    the code chunk header is repeated in the page header of the last page.
    The technique used is to put a <TeXmacs> <em|label> at the begining of
    the chunk and also at the end of the chunk. We take the <em|pagerefpage>
    of each label, and if they are not on the same page, then at the end of
    the chunk we set the page header to be the same as the chunk header.\ 
  </note>

  We have to enclose this line in the standard C <em|main> function, like
  this:

  <\nf-chunk|main>
    <item>int main(int argc, char** argv) {

    <item> \ <label|printfs><nf-ref|message-printf>

    <item> \ return 0;

    <item>}
  </nf-chunk|cpp>

  The statement <verbatim|return 0;> lets the operating system know that the
  function completed successfully <emdash> which is a bit of a presumption as
  we don't check if <verbatim|printf> is successful.

  <\note>
    Note the <verbatim|printf> statement defined in
    <chunk-reference|message-printf|1> has been included in
    <reference|printfs>.
  </note>

  <\note>
    The line numbering starts counting again from 1 for each named chunk.
  </note>

  <subsubsection|Composing the file>

  By convention, with <TeXmacs> and <name|Fangle>, a chunk whose name begins
  with a <verbatim|./> is considered to be a file suitable for automatic
  extraction; so we will define out main chunk to be
  <verbatim|./hello-world.c>

  <paragraph|Header files>

  On my system, both <verbatim|printf> and <verbatim|puts> both require the
  header <verbatim|stdio.h>; so this line becomes the first line of our file.\ 

  <\nf-chunk|./hello-world.c>
    <item>#include stdout.h
  </nf-chunk|cpp|<tuple|>>

  <\note>
    The header contains a link to chunk <chunk-reference|hello-world.c|2>
    which is the next chunklet of this named chunk.
  </note>

  <subparagraph|Main Body>

  The include statement is followed by our main function that we defined in
  <chunk-reference|main|1>.

  <\nf-chunk|./hello-world.c>
    <item><nf-ref|main>
  </nf-chunk|cpp>

  <\note>
    This time the header also contains a link to chunk
    <chunk-reference|hello-world.c|1> which is the previous chunklet of this
    named chunk.\ 
  </note>

  <subparagraph|Closing remarks>

  And a final good-bye comment.

  <\nf-chunk|./hello-world.c>
    <item>/* thats the end, folks */
  </nf-chunk|cpp>

  <\note>
    Like the first chunks we looked at, there are no further chunklets with
    the same name and so there is no link to the next chunklet shown,
    although there is a link to the previous chunklet.
  </note>

  <subsubsection|Updating the Document>

  Because of the amount of page-referencing going on to calculate the
  chunklet references, it can sometimes require the document to be updated
  three or more times to fix the links and references.

  <\enumerate>
    <item>The first time, a chunk has to discover which page it is one.

    <item>The second time all the chunks can be given the correct id based on
    the page.

    <item>The third time, all references to a chunk can be updated to the
    correct id.

    <item>A forth and additional times may be required if the page-breaking
    was changed as a result of a change in label size <emdash> although this
    is only likely to occur if a reference occured in the text of the
    document for the references in the header have enough space so as not to
    affect layout.
  </enumerate>

  <subsubsection|Extracting the source>

  The file <verbatim|./hello-world.c> can be extracted directly with:

  <\verbatim>
    texmacs -s -c hello-world.tm hello-world.txt -q &&

    fangle -R./hello-world.c hello-world.txt \<gtr\> hello-world.c
  </verbatim>

  Although this is a little verbose, it shows how things work. There is a
  Makefile.inc project that allows you to do all that sort of thing
  automatically.
</body>

<\initial>
  <\collection>
    <associate|info-flag|detailed>
    <associate|page-medium|paper>
    <associate|page-screen-margin|false>
    <associate|page-show-hf|true>
    <associate|preamble|false>
    <associate|src-style|scheme>
  </collection>
</initial>

<\references>
  <\collection>
    <associate||<tuple|?a|?>>
    <associate|./hello-world.c|<tuple|2c|2>>
    <associate|.hello-world.c|<tuple|?c|?>>
    <associate|a|<tuple|?a|?>>
    <associate|as|<tuple|?a|?>>
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-2|<tuple|2|1>>
    <associate|auto-3|<tuple|3|1>>
    <associate|auto-4|<tuple|4|2>>
    <associate|auto-5|<tuple|4.1|2>>
    <associate|auto-6|<tuple|4.1.1|?>>
    <associate|auto-7|<tuple|4.1.2|?>>
    <associate|auto-8|<tuple|5|?>>
    <associate|auto-9|<tuple|6|?>>
    <associate|code-end-./hello-world.c-1|<tuple|2a|2>>
    <associate|code-end-./hello-world.c-2|<tuple|2b|2>>
    <associate|code-end-./hello-world.c-3|<tuple|2c|2>>
    <associate|code-end-.hello-world.c-1|<tuple|?c|?>>
    <associate|code-end-hello-world.c-1|<tuple|2a|2>>
    <associate|code-end-hello-world.c-2|<tuple|2b|2>>
    <associate|code-end-hello-world.c-3|<tuple|2c|2>>
    <associate|code-end-main-1|<tuple|1d|2>>
    <associate|code-end-message-1|<tuple|1a|1>>
    <associate|code-end-message-printf-1|<tuple|1b|1>>
    <associate|code-end-message-puts-1|<tuple|1c|1>>
    <associate|code-label-|<tuple|<with|font-size|<quote|0.771>|2>|?>>
    <associate|code-label--1|<tuple|[ 1]|?>>
    <associate|code-label-./hello-world.c-1|<tuple|[./hello-world.c 1]|2>>
    <associate|code-label-./hello-world.c-2|<tuple|[./hello-world.c 2]|2>>
    <associate|code-label-./hello-world.c-3|<tuple|[./hello-world.c 3]|2>>
    <associate|code-label-.hello-world.c-1|<tuple|[.hello-world.c 1]|?>>
    <associate|code-label-a-1|<tuple|[a 1]|?>>
    <associate|code-label-as-1|<tuple|[as 1]|?>>
    <associate|code-label-h|<tuple|<with|font-size|<quote|0.771>|2>|?>>
    <associate|code-label-h-1|<tuple|[h 1]|?>>
    <associate|code-label-he|<tuple|<with|font-size|<quote|0.771>|2>|?>>
    <associate|code-label-he-1|<tuple|[he 1]|?>>
    <associate|code-label-hel|<tuple|<with|font-size|<quote|0.771>|2>|?>>
    <associate|code-label-hel-1|<tuple|[hel 1]|?>>
    <associate|code-label-hell|<tuple|<with|font-size|<quote|0.771>|2>|?>>
    <associate|code-label-hell-1|<tuple|[hell 1]|?>>
    <associate|code-label-hello|<tuple|<with|font-size|<quote|0.771>|2>|?>>
    <associate|code-label-hello-|<tuple|<with|font-size|<quote|0.771>|2>|?>>
    <associate|code-label-hello--1|<tuple|[hello- 1]|?>>
    <associate|code-label-hello-1|<tuple|[hello 1]|?>>
    <associate|code-label-hello-w|<tuple|<with|font-size|<quote|0.771>|2>|?>>
    <associate|code-label-hello-w-1|<tuple|[hello-w 1]|?>>
    <associate|code-label-hello-wo|<tuple|<with|font-size|<quote|0.771>|2>|?>>
    <associate|code-label-hello-wo-1|<tuple|[hello-wo 1]|?>>
    <associate|code-label-hello-wor|<tuple|<with|font-size|<quote|0.771>|2>|?>>
    <associate|code-label-hello-wor-1|<tuple|[hello-wor 1]|?>>
    <associate|code-label-hello-worl|<tuple|<with|font-size|<quote|0.771>|2>|?>>
    <associate|code-label-hello-worl-1|<tuple|[hello-worl 1]|?>>
    <associate|code-label-hello-world|<tuple|<with|font-size|<quote|0.771>|2>|?>>
    <associate|code-label-hello-world-1|<tuple|[hello-world 1]|?>>
    <associate|code-label-hello-world.|<tuple|<with|font-size|<quote|0.771>|2>|?>>
    <associate|code-label-hello-world.-1|<tuple|[hello-world. 1]|?>>
    <associate|code-label-hello-world.c|<tuple|4|1>>
    <associate|code-label-hello-world.c-|<tuple|[hello-world.c
    <error|compound the-code-chunk-hello-world.c>]|2>>
    <associate|code-label-hello-world.c-1|<tuple|[hello-world.c 1]|2>>
    <associate|code-label-hello-world.c-2|<tuple|[hello-world.c 2]|2>>
    <associate|code-label-hello-world.c-3|<tuple|[hello-world.c 3]|2>>
    <associate|code-label-hello-world.c1|<tuple|<with|font-size|<quote|0.771>|3>|1>>
    <associate|code-label-hello-worlsd.c-1|<tuple|[hello-worlsd.c 1]|?>>
    <associate|code-label-m|<tuple|?|?>>
    <associate|code-label-m-1|<tuple|[m 1]|?>>
    <associate|code-label-ma|<tuple|<with|font-size|<quote|0.771>|3>|?>>
    <associate|code-label-ma-1|<tuple|[ma 1]|?>>
    <associate|code-label-mai|<tuple|<with|font-size|<quote|0.771>|3>|?>>
    <associate|code-label-mai-1|<tuple|[mai 1]|?>>
    <associate|code-label-main|<tuple|3|1>>
    <associate|code-label-main-|<tuple|[main <error|compound
    the-code-chunk-main>]|2>>
    <associate|code-label-main-1|<tuple|[main 1]|1>>
    <associate|code-label-main-2|<tuple|[main 2]|1>>
    <associate|code-label-main-3|<tuple|[main 3]|1>>
    <associate|code-label-main1|<tuple|?|1>>
    <associate|code-label-main2|<tuple|<with|font-size|<quote|0.771>|2>|1>>
    <associate|code-label-me|<tuple|?|?>>
    <associate|code-label-me-1|<tuple|[me 1]|?>>
    <associate|code-label-mes|<tuple|?|?>>
    <associate|code-label-mes-1|<tuple|[mes 1]|?>>
    <associate|code-label-mess|<tuple|?|?>>
    <associate|code-label-mess-1|<tuple|[mess 1]|?>>
    <associate|code-label-messa|<tuple|?|?>>
    <associate|code-label-messa-1|<tuple|[messa 1]|?>>
    <associate|code-label-messag|<tuple|?|?>>
    <associate|code-label-messag-1|<tuple|[messag 1]|?>>
    <associate|code-label-message|<tuple|1|1>>
    <associate|code-label-message-|<tuple|<pageref|code-label-message-1>a|2>>
    <associate|code-label-message--1|<tuple|[message- 1]|?>>
    <associate|code-label-message-1|<tuple|[message 1]|1>>
    <associate|code-label-message-2|<tuple|[message 2]|?>>
    <associate|code-label-message-p|<tuple|<pageref|code-label-message-printf-1>b|?>>
    <associate|code-label-message-p-1|<tuple|[message-p 1]|?>>
    <associate|code-label-message-pf|<tuple|<pageref|code-label-message-printf-1>b|?>>
    <associate|code-label-message-pf-1|<tuple|[message-pf 1]|?>>
    <associate|code-label-message-pintf|<tuple|<pageref|code-label-message-printf-1>b|?>>
    <associate|code-label-message-pintf-1|<tuple|[message-pintf 1]|?>>
    <associate|code-label-message-pntf|<tuple|<pageref|code-label-message-printf-1>b|?>>
    <associate|code-label-message-pntf-1|<tuple|[message-pntf 1]|?>>
    <associate|code-label-message-pr|<tuple|<pageref|code-label-message-1>a|?>>
    <associate|code-label-message-pr-1|<tuple|[message-pr 1]|?>>
    <associate|code-label-message-pri|<tuple|<pageref|code-label-message-1>a|?>>
    <associate|code-label-message-pri-1|<tuple|[message-pri 1]|?>>
    <associate|code-label-message-prin|<tuple|<pageref|code-label-message-1>a|?>>
    <associate|code-label-message-prin-1|<tuple|[message-prin 1]|?>>
    <associate|code-label-message-print|<tuple|<pageref|code-label-message-1>a|?>>
    <associate|code-label-message-print-1|<tuple|[message-print 1]|?>>
    <associate|code-label-message-printf|<tuple|2|1>>
    <associate|code-label-message-printf-1|<tuple|[message-printf 1]|1>>
    <associate|code-label-message-printf-2|<tuple|[message-printf 2]|?>>
    <associate|code-label-message-ptf|<tuple|<pageref|code-label-message-printf-1>b|?>>
    <associate|code-label-message-ptf-1|<tuple|[message-ptf 1]|?>>
    <associate|code-label-message-pu|<tuple|<pageref|code-label-message-printf-1>b|?>>
    <associate|code-label-message-pu-1|<tuple|[message-pu 1]|?>>
    <associate|code-label-message-put|<tuple|<pageref|code-label-message-printf-1>b|?>>
    <associate|code-label-message-put-1|<tuple|[message-put 1]|?>>
    <associate|code-label-message-puts|<tuple|1b line
    <with|font-size|<quote|0.771>|1>|1>>
    <associate|code-label-message-puts-1|<tuple|[message-puts 1]|1>>
    <associate|code-label-message1|<tuple|?|1>>
    <associate|code-label-my-1|<tuple|[my 1]|1>>
    <associate|code-label-myname-1|<tuple|[myname 1]|1>>
    <associate|code-label-myname-2|<tuple|[myname 2]|1>>
    <associate|code-label-myname-3|<tuple|[myname 3]|1>>
    <associate|code-label-sd|<tuple|?|?>>
    <associate|code-label-sd-1|<tuple|[sd 1]|?>>
    <associate|code-label-test|<tuple|<with|font-size|<quote|0.771>|2>|1>>
    <associate|code-label-test-1|<tuple|[test 1]|1>>
    <associate|code-label-z|<tuple|<with|font-size|<quote|0.771>|4>|?>>
    <associate|code-label-z-1|<tuple|[z 1]|?>>
    <associate|code-label-zo|<tuple|<with|font-size|<quote|0.771>|4>|?>>
    <associate|code-label-zo-1|<tuple|[zo 1]|?>>
    <associate|code-label-zoz|<tuple|<with|font-size|<quote|0.771>|4>|?>>
    <associate|code-label-zoz-1|<tuple|[zoz 1]|?>>
    <associate|code-label-zozz|<tuple|<with|font-size|<quote|0.771>|4>|?>>
    <associate|code-label-zozz-1|<tuple|[zozz 1]|?>>
    <associate|code-label-zozzz|<tuple|<with|font-size|<quote|0.771>|4>|?>>
    <associate|code-label-zozzz-1|<tuple|[zozzz 1]|?>>
    <associate|code-label-zozzzz|<tuple|<with|font-size|<quote|0.771>|2>|1>>
    <associate|code-label-zozzzz-1|<tuple|[zozzzz 1]|1>>
    <associate|code-label-zzizz|<tuple|<with|font-size|<quote|0.771>|5>|1>>
    <associate|code-label-zzizz-|<tuple|[zzizz <error|compound
    the-code-chunk-zzizz>]|2>>
    <associate|code-label-zzizz-1|<tuple|[zzizz 1]|1>>
    <associate|code-label-zzizz1|<tuple|<with|font-size|<quote|0.771>|5>|1>>
    <associate|code-ref--1|<tuple|?a|?>>
    <associate|code-ref-./hello-world.c-1|<tuple|2a|2>>
    <associate|code-ref-./hello-world.c-2|<tuple|2b|2>>
    <associate|code-ref-./hello-world.c-3|<tuple|2c|2>>
    <associate|code-ref-.hello-world.c-1|<tuple|?c|?>>
    <associate|code-ref-a-1|<tuple|?a|?>>
    <associate|code-ref-as-1|<tuple|?a|?>>
    <associate|code-ref-h-1|<tuple|<pageref|code-label-h-1>g|?>>
    <associate|code-ref-he-1|<tuple|<pageref|code-label-he-1>g|?>>
    <associate|code-ref-hel-1|<tuple|<pageref|code-label-hel-1>g|?>>
    <associate|code-ref-hell-1|<tuple|<pageref|code-label-hell-1>g|?>>
    <associate|code-ref-hello--1|<tuple|<pageref|code-label-hello--1>g|?>>
    <associate|code-ref-hello-1|<tuple|<pageref|code-label-hello-1>g|?>>
    <associate|code-ref-hello-w-1|<tuple|<pageref|code-label-hello-w-1>g|?>>
    <associate|code-ref-hello-wo-1|<tuple|<pageref|code-label-hello-wo-1>g|?>>
    <associate|code-ref-hello-wor-1|<tuple|<pageref|code-label-hello-wor-1>g|?>>
    <associate|code-ref-hello-worl-1|<tuple|<pageref|code-label-hello-worl-1>g|?>>
    <associate|code-ref-hello-world-1|<tuple|<pageref|code-label-hello-world-1>g|?>>
    <associate|code-ref-hello-world.-1|<tuple|<pageref|code-label-hello-world.-1>g|?>>
    <associate|code-ref-hello-world.c-|<tuple|[hello-world.c
    <pageref|code-label-hello-world.c->]|2>>
    <associate|code-ref-hello-world.c-1|<tuple|2a|2>>
    <associate|code-ref-hello-world.c-2|<tuple|2b|2>>
    <associate|code-ref-hello-world.c-3|<tuple|2c|2>>
    <associate|code-ref-hello-worlsd.c-1|<tuple|?a|?>>
    <associate|code-ref-m-1|<tuple|<pageref|code-label-m-1>a|?>>
    <associate|code-ref-ma-1|<tuple|<pageref|code-label-ma-1>f|?>>
    <associate|code-ref-mai-1|<tuple|<pageref|code-label-mai-1>f|?>>
    <associate|code-ref-main-1|<tuple|1d|1>>
    <associate|code-ref-main-3|<tuple|<pageref|code-label-main-3>i|1>>
    <associate|code-ref-me-1|<tuple|<pageref|code-label-me-1>a|?>>
    <associate|code-ref-mes-1|<tuple|<pageref|code-label-mes-1>a|?>>
    <associate|code-ref-mess-1|<tuple|<pageref|code-label-mess-1>a|?>>
    <associate|code-ref-messa-1|<tuple|<pageref|code-label-messa-1>a|?>>
    <associate|code-ref-messag-1|<tuple|<pageref|code-label-messag-1>a|?>>
    <associate|code-ref-message-|<tuple|[message
    <pageref|code-label-message->]|2>>
    <associate|code-ref-message--1|<tuple|<pageref|code-label-message--1>b|?>>
    <associate|code-ref-message-1|<tuple|1a|1>>
    <associate|code-ref-message-2|<tuple|<pageref|code-label-message-2>b|?>>
    <associate|code-ref-message-p-1|<tuple|<pageref|code-label-message-p-1>c|?>>
    <associate|code-ref-message-pf-1|<tuple|<pageref|code-label-message-pf-1>c|?>>
    <associate|code-ref-message-pintf-1|<tuple|<pageref|code-label-message-pintf-1>c|?>>
    <associate|code-ref-message-pntf-1|<tuple|<pageref|code-label-message-pntf-1>c|?>>
    <associate|code-ref-message-pr-1|<tuple|<pageref|code-label-message-pr-1>b|?>>
    <associate|code-ref-message-pri-1|<tuple|<pageref|code-label-message-pri-1>b|?>>
    <associate|code-ref-message-prin-1|<tuple|<pageref|code-label-message-prin-1>b|?>>
    <associate|code-ref-message-print-1|<tuple|<pageref|code-label-message-print-1>b|?>>
    <associate|code-ref-message-printf-1|<tuple|1b|1>>
    <associate|code-ref-message-printf-2|<tuple|<pageref|code-label-message-printf-2>c|?>>
    <associate|code-ref-message-ptf-1|<tuple|<pageref|code-label-message-ptf-1>c|?>>
    <associate|code-ref-message-pu-1|<tuple|<pageref|code-label-message-pu-1>c|?>>
    <associate|code-ref-message-put-1|<tuple|<pageref|code-label-message-put-1>c|?>>
    <associate|code-ref-message-puts-1|<tuple|1c|1>>
    <associate|code-ref-my-1|<tuple|1a|1>>
    <associate|code-ref-myname-1|<tuple|1a|1>>
    <associate|code-ref-myname-2|<tuple|?a|1>>
    <associate|code-ref-myname-3|<tuple|1c|1>>
    <associate|code-ref-sd-1|<tuple|<pageref|code-label-sd-1>a|?>>
    <associate|code-ref-test-1|<tuple|<pageref|code-label-test-1>g|1>>
    <associate|code-ref-z-1|<tuple|<pageref|code-label-z-1>i|?>>
    <associate|code-ref-zo-1|<tuple|<pageref|code-label-zo-1>i|?>>
    <associate|code-ref-zoz-1|<tuple|<pageref|code-label-zoz-1>i|?>>
    <associate|code-ref-zozz-1|<tuple|<pageref|code-label-zozz-1>i|?>>
    <associate|code-ref-zozzz-1|<tuple|<pageref|code-label-zozzz-1>i|?>>
    <associate|code-ref-zozzzz-1|<tuple|<pageref|code-label-zozzzz-1>g|1>>
    <associate|code-ref-zzizz-|<tuple|[zzizz <pageref|code-label-zzizz->]|2>>
    <associate|code-ref-zzizz-1|<tuple|<pageref|code-label-zzizz-1>h|1>>
    <associate|footnote-1|<tuple|1|1>>
    <associate|footnote-2|<tuple|2|1>>
    <associate|footnr-1|<tuple|1|1>>
    <associate|footnr-2|<tuple|2|1>>
    <associate|h|<tuple|<pageref|code-label-h-1>g|?>>
    <associate|he|<tuple|<pageref|code-label-he-1>g|?>>
    <associate|hel|<tuple|<pageref|code-label-hel-1>g|?>>
    <associate|hell|<tuple|<pageref|code-label-hell-1>g|?>>
    <associate|hello|<tuple|<pageref|code-label-hello-1>g|?>>
    <associate|hello-|<tuple|<pageref|code-label-hello--1>g|?>>
    <associate|hello-w|<tuple|<pageref|code-label-hello-w-1>g|?>>
    <associate|hello-wo|<tuple|<pageref|code-label-hello-wo-1>g|?>>
    <associate|hello-wor|<tuple|<pageref|code-label-hello-wor-1>g|?>>
    <associate|hello-worl|<tuple|<pageref|code-label-hello-worl-1>g|?>>
    <associate|hello-world|<tuple|<pageref|code-label-hello-world-1>g|?>>
    <associate|hello-world.|<tuple|<pageref|code-label-hello-world.-1>g|?>>
    <associate|hello-world.c|<tuple|2a|2>>
    <associate|hello-worlsd.c|<tuple|?a|?>>
    <associate|jim|<tuple|5|2>>
    <associate|joe|<tuple|5|2>>
    <associate|m|<tuple|<pageref|code-label-m-1>a|?>>
    <associate|ma|<tuple|<pageref|code-label-ma-1>f|?>>
    <associate|mai|<tuple|<pageref|code-label-mai-1>f|?>>
    <associate|main|<tuple|1d|1>>
    <associate|mainx|<tuple|?|?>>
    <associate|man|<tuple|?|?>>
    <associate|me|<tuple|<pageref|code-label-me-1>a|?>>
    <associate|mes|<tuple|<pageref|code-label-mes-1>a|?>>
    <associate|mess|<tuple|<pageref|code-label-mess-1>a|?>>
    <associate|messa|<tuple|<pageref|code-label-messa-1>a|?>>
    <associate|messag|<tuple|<pageref|code-label-messag-1>a|?>>
    <associate|message|<tuple|1a|1>>
    <associate|message-|<tuple|<pageref|code-label-message--1>b|?>>
    <associate|message-p|<tuple|<pageref|code-label-message-p-1>c|?>>
    <associate|message-pf|<tuple|<pageref|code-label-message-pf-1>c|?>>
    <associate|message-pintf|<tuple|<pageref|code-label-message-pintf-1>c|?>>
    <associate|message-pntf|<tuple|<pageref|code-label-message-pntf-1>c|?>>
    <associate|message-pr|<tuple|<pageref|code-label-message-pr-1>b|?>>
    <associate|message-pri|<tuple|<pageref|code-label-message-pri-1>b|?>>
    <associate|message-prin|<tuple|<pageref|code-label-message-prin-1>b|?>>
    <associate|message-print|<tuple|<pageref|code-label-message-print-1>b|?>>
    <associate|message-printf|<tuple|1b|1>>
    <associate|message-ptf|<tuple|<pageref|code-label-message-ptf-1>c|?>>
    <associate|message-pu|<tuple|<pageref|code-label-message-pu-1>c|?>>
    <associate|message-put|<tuple|<pageref|code-label-message-put-1>c|?>>
    <associate|message-puts|<tuple|1c|1>>
    <associate|min|<tuple|?|?>>
    <associate|my|<tuple|1a|1>>
    <associate|myname|<tuple|1c|1>>
    <associate|printfs|<tuple|2|1>>
    <associate|s|<tuple|6|?>>
    <associate|sd|<tuple|<pageref|code-label-sd-1>a|?>>
    <associate|sis|<tuple|<with|font-size|<quote|0.771>|2>|1>>
    <associate|siz|<tuple|6|?>>
    <associate|sizz|<tuple|12|?>>
    <associate|so|<tuple|6|?>>
    <associate|soz|<tuple|6|?>>
    <associate|sozz|<tuple|12|?>>
    <associate|test|<tuple|<pageref|code-label-test-1>g|1>>
    <associate|tim|<tuple|hee hee|?>>
    <associate|value-1|<tuple|lots of stuff|?>>
    <associate|value-2|<tuple|lots of stuff|2>>
    <associate|value-3|<tuple|lots of stuff|2>>
    <associate|value-34|<tuple|xlots of stuff|2>>
    <associate|value-345|<tuple|xlots of stuff|?>>
    <associate|x|<tuple|3|?>>
    <associate|xxx|<tuple|2a line <with|font-size|<quote|0.771>|3>|2>>
    <associate|z|<tuple|<pageref|code-label-z-1>i|?>>
    <associate|ziz|<tuple|<with|font-size|<quote|0.771>|7>|2>>
    <associate|zo|<tuple|<pageref|code-label-zo-1>i|?>>
    <associate|zox|<tuple|<with|font-size|<quote|0.771>|7>|2>>
    <associate|zoz|<tuple|<pageref|code-label-zoz-1>i|?>>
    <associate|zozz|<tuple|<pageref|code-label-zozz-1>i|2>>
    <associate|zozzz|<tuple|<pageref|code-label-zozzz-1>i|?>>
    <associate|zozzzz|<tuple|<pageref|code-label-zozzzz-1>g|1>>
    <associate|zz|<tuple|<with|font-size|<quote|0.771>|5>|?>>
    <associate|zzi|<tuple|<with|font-size|<quote|0.771>|5>|?>>
    <associate|zziz|<tuple|<with|font-size|<quote|0.771>|5>|?>>
    <associate|zzizz|<tuple|<pageref|code-label-zzizz-1>h|1>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <with|par-left|<quote|3fn>|1<space|2spc>Message
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1>>

      <with|par-left|<quote|3fn>|2<space|2spc>Displaying the message
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>

      <with|par-left|<quote|3fn>|3<space|2spc>The main function
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <with|par-left|<quote|3fn>|4<space|2spc>Header files
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <with|par-left|<quote|3fn>|5<space|2spc>Updating the Document
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>
    </associate>
  </collection>
</auxiliary>