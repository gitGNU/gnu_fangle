<TeXmacs|1.0.7.14>

<style|<tuple|article|fangle|env-program>>

<\body>
  <\hide-preamble>
    <assign|LyX|<macro|L<space|-0.1667em><move|Y|0fn|-0.25em><space|-0.125em>X>>
  </hide-preamble>

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

  Here is the message that we wish to give to
  world:<new-fangle|messagess|sh|<tuple|a1|a2>>

  message is below:

  <\messagess>
    hello

    more

    eyc
  </messagess>

  end

  \;

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
    <chunk-page-reference|message|1>.<\footnote>
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
    the chunk we set the page header to be the same as the chunk header.
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
    <associate|src-style|angular>
  </collection>
</initial>

<\references>
</references>

<\auxiliary>
</auxiliary>