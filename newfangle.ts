<TeXmacs|1.0.7.6>

<style|source>

<\body>
  <\active*>
    <\src-title>
      <src-style-file|newfangle-literate-programming|0.2>

      <\src-purpose>
        Style to be used in literate programs.
      </src-purpose>

      <\src-copyright|2009-2010>
        Sam Liddicott
      </src-copyright>

      <\src-license>
        This <TeXmacs> style file falls under the <hlink|GNU general public
        license|$TEXMACS_PATH/LICENSE> and comes WITHOUT ANY WARRANTY
        WHATSOEVER. If you do not have a copy of the license, then write to
        the Free Software Foundation, Inc., 59 Temple Place - Suite 330,
        Boston, MA 02111-1307, USA.
      </src-license>
    </src-title>
  </active*>

  <use-package|std|env|tmdoc-markup>

  <assign|filename|<macro|name|<verbatim|<arg|name>>>>

  <assign|old-code|<value|code>>

  <assign|code|<macro|x|<with|par-par-sep|0fn|<compound|old-code|<arg|x>>>>>

  <assign|old-verbatim|<value|verbatim>>

  <assign|verbatim|<macro|x|<with|par-par-sep|0fn|<compound|old-verbatim|<arg|x>>>>>

  <\active*>
    <\src-comment>
      First, some extensions to standard <TeXmacs> functionality - the
      get-binding trick to extract a page number is kindly given by Joris who
      gave us so much already.

      I would rather ispageref? just made the first test comparing to uninit
      (the red question mark) so that real but un-placed page refs would
      still be recognized as a pageref - however I have found documents with
      stale labels - that no longer exist in the document but which are still
      stored in the document references section with a target page of ?
    </src-comment>
  </active*>

  \;

  <assign|ispageref?|<macro|x|<and|<not|<equal|<uninit>|<pagerefpage|<arg|x>>>>|<not|<equal|?|<pagerefpage|<arg|x>>>>>>>

  <\active*>
    <\src-comment>
      Joris tells me:

      <\verbatim>
        Page references are links, defined by the following macro:

        \ \ \ (macro "x"

        \ \ \ \ \ (locus (id (hard-id (arg "x")))

        \ \ \ \ \ \ \ \ \ \ \ \ (hyperlink (id (hard-id (arg "x")))

        \ \ \ \ \ (url (merge "#" (arg "x"))))

        (get-binding (arg "x") "1")))
      </verbatim>

      which leads to this definition if pagerefpage whose job it is to give
      the page number for a label (as it was last calculated to be). This is
      useful when constructing our own labels that consist of the page number
      and a sub-page counter of the target.
    </src-comment>
  </active*>

  <assign|pagerefpage|<macro|x|<get-binding|<arg|x>|1>>>

  <\active*>
    <\src-comment>
      These next macros control how a code chunk is rendered on the screen,
      and could ligitimately be re-defined in the document.
    </src-comment>
  </active*>

  <\active*>
    <\src-comment>
      nf-framed-table defines the format of the single cell that holds the
      listing. I prefer a top and left border
    </src-comment>
  </active*>

  <assign|nf-cell-border|0.5ln>

  <assign|nf-cell-no-border|0.0ln>

  <assign|nf-cell-top-border|<value|nf-cell-border>>

  <assign|nf-cell-left-border|<value|nf-cell-border>>

  <assign|nf-cell-bottom-border|<value|nf-cell-no-border>>

  <assign|nf-cell-right-border|<value|nf-cell-border>>

  <assign|nf-framed-table|<macro|x|<with|color|dark
  grey|<tformat|<twith|table-width|1par>|<cwith|1|-1|1|-1|cell-hyphen|t>|<cwith|1|-1|1|-1|cell-bsep|1spc>|<cwith|1|-1|1|-1|cell-tsep|1spc>|<cwith|1|-1|1|-1|cell-background|white>|<cwith|1|-1|1|-1|cell-lborder|<value|nf-cell-left-border>>|<cwith|1|-1|1|-1|cell-rborder|<value|nf-cell-right-border>>|<cwith|1|-1|1|-1|cell-bborder|<value|nf-cell-bottom-border>>|<cwith|1|-1|1|-1|cell-tborder|<value|nf-cell-top-border>>|<arg|x>>>>>

  <\active*>
    <\src-comment>
      nf-framed-fragment defines the listing to be rendered in a table with a
      single cell.
    </src-comment>
  </active*>

  <assign|nf-framed-fragment|<macro|x|<nf-framed-table|<tformat|<table|<row|<\cell>
    <with|color|black|<arg|x>>
  </cell>>>>>>>

  <\active*>
    <\src-comment>
      prog-f renders a body in prog mode with specified language and without
      a ghastly par-par-sep
    </src-comment>
  </active*>

  <assign|prog-f|<macro|lang|body|<with|mode|prog|prog-language|<arg|lang>|<with|par-par-sep|0fn|<arg|body>>>>>

  <\active*>
    <\src-comment>
      prog-fragment is the top level macro used for rendering a listing
      (without line numbers). It renders prog-f within a framed fragment.
    </src-comment>
  </active*>

  <assign|nf-border-if|<macro|x|<if|<arg|x>|<value|nf-cell-border>|<value|nf-cell-no-border>>>>

  <assign|prog-fragment|<\macro|name|lang|x>
    <with|nf-cell-top-border|<nf-border-if|<compound|nf-first-chunklet?|<arg|name>>>|nf-cell-bottom-border|<nf-border-if|<nf-last-chunklet?|<arg|name>>>|<nf-framed-fragment|<compound|prog-f|<arg|lang>|<arg|x>>>>
  </macro>>

  <\active*>
    <\src-comment>
      Numbering the listing
    </src-comment>
  </active*>

  <assign|nflp|<macro|x|<arg|x>>>

  <\active*>
    <\src-comment>
      numbered-prog-fragment isn't used because it doesn't work when called
      from nf-chunk, and I don't know why. The same definition is instead
      used directly within nf-chunk. numbered-prog-fragment as shown here
      represents a desire to re-factor the code when I understand what is
      going wrong.
    </src-comment>
  </active*>

  <assign|numbered-prog-fragment|<style-with|src-compact|none|<macro|name|lang|x|<prog-fragment|<arg|lang>|<list|<macro|x|<arg|x>
  >|<macro|x|<smaller|<arg|x>>>|<assign|item-nr|<value|<merge|code-line-|<unquote|<arg|name>>|-nr>>><if|<equal|<get-label|<arg|x>>|document>|<map-args|itemly|document|x>|<arg|x>><assign|<merge|code-line-|<unquote|<arg|name>>|-nr>|<value|item-nr>>>>>>>

  <\active*>
    <\src-comment>
      itemly is what is used to add line numbers to the listing. It is
      invoked within an enumerate environment.\ 

      If the listing is a document node then it is invoked on map-args of the
      listing - which means on each line. We insert an \<less\>item\<gtr\>
      tag at the start which will emit the line number (as it is within an
      enumerate environment). We also define the label text to refer to the
      line number within the listing. I would rather use the-item not item-nr
      but the-item comes out in a smaller font size.
    </src-comment>
  </active*>

  <assign|nf-line-string|<macro|x|[STRING:(<value|nf-len>)=<arg|x><assign|nf-len|<plus|<value|nf-len>|<length|<arg|x>>>>;<value|nf-len>]>>

  <assign|nf-line-concat|<macro|x|<with|end|<get-arity|<arg|x>>|i|0|<if|<greater|<value|end>|0>|<while|<less|<value|i>|<value|end>>|[(<length|<look-up|<arg|x>|<value|i>>>)<look-up|<arg|x>|<value|i>>]<assign|i|<plus|<value|i>|1>>>|\<less\>\<less\><get-label|<arg|x>>\<gtr\>\<gtr\><arg|x>>>>>

  <assign|nf-render-tags|<macro|x|<case|<equal|<get-label|<arg|x>>|string>|<nf-line-string|<arg|x>>|<equal|<get-label|<arg|x>>|concat>|<nf-line-concat|<arg|x>>|<arg|x>>>>

  <assign|itemly|<macro|x|<item><assign|the-label|<value|the-chunk-label>
  <localize|line> <item-nr>><with|nf-len|0|<arg|x>>>>

  <assign|nitemly|<macro|x|<assign|the-label|<value|the-chunk-label>
  <localize|line> <item-nr>><with|nf-len|0|<arg|x>>>>

  <\active*>
    <\src-comment>
      itemly-c and itemly-d are not used right now, but are attempts to
      recursively navigate a listings tree that may include in-place
      expansions of other listings - so that numbering will be correct.\ 

      The strategy is to recurse through the tree and each time a document
      node is found, all it's children are handled by itemly which must also
      recurse in the same way.

      It doesn't work yet.\ 
    </src-comment>
  </active*>

  <assign|itemly-c|<macro|x|<case|<equal|<get-label|<arg|x>>|document>|CCC<get-arity|<arg|x>><get-label|<arg|x>><item><map-args|itemly-d|document|<arg|x>>|<arg|x>>>>

  <assign|itemly-d|<\macro|x>
    <item><case|<equal|<get-label|<arg|x>>|concat>|DDD<get-arity|<arg|x>><get-label|<arg|x>><map|itemly-c|<arg|x>>|<arg|x>>
  </macro>>

  <\active*>
    <\src-comment>
      Forgot what nf-chunk is for
    </src-comment>
  </active*>

  <new-counter|nf-chunk>

  <\active*>
    <\src-comment>
      The noweb format that we follow names listings after the page number
      followed by an alpha-counter that is reset on each page; e.g. 12a then
      12b, 12c and then on page 13 back to 13a

      As there is no trigger called on a new page that can help us, we
      instead store the page number as we process each chunk so that we can
      tell when a chunk is on a different page to the last chunk in order to
      reset the alpha-counter.
    </src-comment>
  </active*>

  <assign|nf-page|0>

  <\active*>
    <\src-comment>
      The next-code-chunk-counter macro used before the code lines to set the
      current label to something more useful that the line number
    </src-comment>
  </active*>

  <assign|xxxnext-chunk-code-counter|<macro|>>

  <\active*>
    <\src-comment>
      The next-code-line-counter macro used in the code lines to set the
      current label to the chunk reference and the line number
    </src-comment>
  </active*>

  <assign|xxxnext-chunk-line-counter|<macro|>>

  <\active*>
    <\src-comment>
      Chunks have a name which is provided by the user, but more than one
      chunk can have the same name. These are called chunklets of the same
      chunk.

      Although chunklets have the same name, they have a different id, which
      is the name with a prefix, and a suffix which is the chunklet sequence
      number.
    </src-comment>
  </active*>

  <assign|nf-chunk-id|<macro|name|tag|n|<merge|code-|<arg|tag>|-|<unquote|<arg|name>>|-|<arg|n>>>>

  <\active*>
    <\src-comment>
      nf-this-chunk-id is a convenience that uses the counter for the current
      chunk. (Each chunk has it's own counter to count it's chunklets)
    </src-comment>
  </active*>

  <assign|nf-this-chunk-id|<macro|name|tag|<nf-chunk-id|<arg|name>|<arg|tag>|<compound|<merge|the-code-chunk-|<unquote|<arg|name>>>>>>>

  <\active*>
    <\src-comment>
      Simple way to discover if we are processing the first chunklet of a
      named chunk - by checjing it's chunklet counter.
    </src-comment>
  </active*>

  <assign|nf-first-chunklet?|<macro|name|<equal|<compound|<merge|the-code-chunk-|<unquote|<arg|name>>>>|1>>>

  <assign|nf-last-chunklet?|<macro|name|<not|<compound|nf-chunklet-exists?|<nf-chunk-id|<arg|name>|ref|<plus|<compound|<merge|the-code-chunk-|<unquote|<arg|name>>>>|1>>>>>>

  <\active*>
    <\src-comment>
      Simple way to discover if a chunklet (probably) exists - which is
      needed to know if we should show a forward reference to the next
      chunklet. As each chunklet defines a label, we just need to check if
      there is a pageref to that label.
    </src-comment>
  </active*>

  <assign|nf-chunklet-exists?|<macro|id|<ispageref?|<arg|id>>>>

  <\active*>
    <\src-comment>
      nf-nav shows renders the links to the previous and next chunklets of
      this chunk (if they exist).
    </src-comment>
  </active*>

  <assign|nf-nav|<style-with|src-compact|none|<macro|name|<style-with|src-compact|all|<if|<not|<nf-first-chunklet?|<arg|name>>>|<math|\<vartriangleleft\>><reference|<nf-chunk-id|<arg|name>|ref|<minus|<compound|<merge|the-code-chunk-|<unquote|<arg|name>>>>|1>>>>><if|<compound|nf-chunklet-exists?|<nf-chunk-id|<arg|name>|ref|<plus|<compound|<merge|the-code-chunk-|<unquote|<arg|name>>>>|1>>>|
  <reference|<nf-chunk-id|<arg|name>|ref|<plus|<compound|<merge|the-code-chunk-|<unquote|<arg|name>>>>|1>>><math|\<vartriangleright\>>>>>>

  <\active*>
    <\src-comment>
      nf-header renders the single line header before the listing. It lists
      the reference of this chunk which is the-label (already estiablished by
      nf-chunk-init) along with the chunk name and language, the chunklet
      number and a reference to the first chunklet with the same name, and
      also the chunklet navigation.
    </src-comment>
  </active*>

  <assign|nf-render-commas|<macro|x|<with|color|blue|<arg|x>>>>

  <assign|nf-commas|<macro|items|<if|<equal|<get-label|<arg|items>>|tuple>|<if|<less|<length|<arg|items>>|1>||<nf-render-commas|<look-up|<arg|items>|0>><if|<greater|<length|<arg|items>>|1>|,
  <nf-commas|<range|<arg|items>|1|<length|<arg|items>>>>>>|<arg|items>>>>

  <assign|nf-commaxy|<macro|x|, (<arg|x>)>>

  <assign|nf-commax|<xmacro|args|[<arg|args|0><map-args|nf-commaxy|concat|args|1>]>>

  <assign|bla|<xmacro|args|<arg|args|0>:<arg|args|1>(<arg|args>)>>

  <assign|nf-header|<macro|name|lang|args|<with|par-first|-2fn|<yes-indent>><resize|<value|the-label>
  |r-1.5fn||r+0.5fn|><with|mode|math|<left|langle>><label|<arg|name>><with|color|blue|<arg|name>>[<compound|<merge|the-code-chunk-|<unquote|<arg|name>>>><style-with|src-compact|none|]><if|<not|<compound|nf-first-chunklet?|<arg|name>>>|<if|<not|<equal|<value|<merge|code-args-|<unquote|<arg|name>>>>|<uninit>>>|(<with|nf-render-commas|<macro|x|<arg|x>>|<nf-commas|<value|<merge|code-args-|<unquote|<arg|name>>>>>>)>
  <math|\<Uparrow\>><reference|<nf-chunk-id|<arg|name>|ref|1>>|(<compound|nf-commas|<arg|args>>)>,
  lang=<with|color|blue|<arg|lang>><with|mode|math|<right|rangle>>
  <math|<if|<not|<nf-first-chunklet?|<arg|name>>>|+>\<equiv\>><htab|0pt><nf-nav|<arg|name>>>>

  <\active*>
    <\src-comment>
      nf-gather is an attempt to remember each named chunk so that it can
      optionally be expanded in-place in other chunks. It's a poor attempt
      and only works for forward uses. Such expansion should be compined with
      over-brace or side-brace decoration of the included chunk, and also
      requires that the inline continuation after the expanded chunk continue
      from the baseline of the expanded chunk instead of the baseline before
      the expanded chunk was included.
    </src-comment>
  </active*>

  <assign|nf-gather|<macro|name|x|lang|<if|<provides|<arg|name>>|<assign|<unquote|<arg|name>>|<value|<arg|name>><unquote|<arg|x>>>|<assign|<unquote|<arg|name>>|<quote|<arg|x>>>>>>

  <\active*>
    <\src-comment>
      nf-chunk-new is called by nf-chunk-init for the first chunklet of a
      given chunk name - it defines a chunklet counter and a line number
      counter
    </src-comment>
  </active*>

  <assign|nf-chunk-new|<macro|name|args|<new-counter|<merge|code-chunk-|<unquote|<arg|name>>>><new-counter|<merge|code-line-|<unquote|<arg|name>>>><compound|<merge|inc-code-chunk-|<unquote|<arg|name>>>><assign|<merge|code-args-|<unquote|<arg|name>>>|<arg|args>>>>

  <\active*>
    <\src-comment>
      nf-chunk-new is called by nf-chunk-init for the additional chunklets of
      a given chunk name.\ 

      It increments the chunklet counter
    </src-comment>
  </active*>

  <assign|nf-chunk-next|<macro|name|<compound|<merge|inc-code-chunk-|<unquote|<arg|name>>>>>>

  <\active*>
    <\src-comment>
      nf-check-page uses the label defined in nf-chunk-label to get the
      number of the page containing this chunk to compare to nf-page (the
      number of the page containing the previous chunk) to see if this chunk
      is the first chunk on a page. If so, then the nf-chunk alpha counter is
      reset, otherwise it is increased.
    </src-comment>
  </active*>

  <assign|nf-check-page|<macro|name|<if|<not|<equal|<value|nf-page>|<pagerefpage|<nf-this-chunk-id|<arg|name>|label>>>>|<reset-nf-chunk><inc-nf-chunk><assign|nf-page|<pagerefpage|<nf-this-chunk-id|<arg|name>|label>>>|<inc-nf-chunk>>>>

  <\active*>
    <\src-comment>
      nf-chunk-ref defines labels and label text so that we can generate
      references to chunklets in the form
      \<less\>PAGENO\<gtr\>\<less\>the-nf-chunk\<gtr\> \ e.g. 17a then 17b
      etc.

      The label text is stored in the-chunk-label which is used by XXX. It
      then creates a label (with the tag ref) of the form code-ref-NAME-NO
      which is a bit long winded to use with \<less\>reference\|...\<gtr\>
      and so \<less\>chunk-reference\|...\<gtr\> is provided to help.

      The ref tagged label is to be used in preference to the label-tagged
      label created in nf-chunk-label whose only purpose is to find out what
      page a chunk starts on so that the chunk ref label can be created
    </src-comment>
  </active*>

  <assign|nf-chunk-ref|<macro|name|<nf-check-page|<arg|name>><assign|the-chunk-label|<pagerefpage|<nf-this-chunk-id|<arg|name>|label>><number|<the-nf-chunk>|alpha>><assign|the-label|<value|the-chunk-label>><label|<nf-this-chunk-id|<arg|name>|ref>>>>

  <\active*>
    <\src-comment>
      nf-render-line-no is responsible for rendering the listing line numbers
      outside of the table cell. It adds a padding and a pipe separator for
      text output to make text listings more readable. Only it does nothing!
      There seems to be no \<less\>specific\|...\<gtr\> tag for verbatim
      exports :-(
    </src-comment>
  </active*>

  <assign|specific-verbatim|<macro|x|<with|color|white|magnification|0.01|<arg|x>>>>

  <assign|nf-pad|<macro|w|<if|<not|<less|<arg|w>|1>>|
  <nf-pad|<minus|<arg|w>|1>>>>>

  <assign|nf-render-line-no|<macro|x|<with|mode|text|<with|font-family|tt|<resize|<with|font-base-size|7|<specific-verbatim|<nf-pad|<minus|3|<length|<value|item-nr>>>>><arg|x><specific-verbatim|\|
  >>|r+2.2fn||r+0.7fn|>>>>>

  <\active*>
    <\src-comment>
      A chunklabel is of the form [chunkaname chunkno] e.g. [main.c 1] but
      it's main purpose is not decorative or visual but as a means to
      discover the page number containing this chunk so that it can be used
      by nf-chunk-ref.
    </src-comment>
  </active*>

  <assign|nf-chunk-label|<macro|name|<assign|nf-last-chunk|<arg|name>><assign|the-label|[<arg|name>
  <compound|<merge|the-code-chunk-|<unquote|<arg|name>>>>]><label|<nf-this-chunk-id|<arg|name>|label>>>>

  <\active*>
    <\src-comment>
      nf-chunk-init is called at the start of nf-chunk to create all
      neccessary counters and labels. The
      \<less\>provides\|\<less\>merge\|code-chunk-\|\<less\>unquote\|name\<gtr\>\|-nr\<gtr\>\<gtr\>
      test could be replaced by some more canonical way to discover if a
      chunk or chunk counter is defined. It's old code and I don't want to
      change it now.
    </src-comment>
  </active*>

  <assign|nf-chunk-init|<macro|name|args|<with|nf-same-chunk|<equal|<value|nf-last-chunk>|<arg|name>>|<if|<not|<provides|<merge|code-chunk-|<unquote|<arg|name>>|-nr>>>|<nf-chunk-new|<arg|name>|<arg|args>>|<nf-chunk-next|<arg|name>>><nf-chunk-label|<arg|name>><nf-chunk-ref|<arg|name>><assign|nf-continues|<and|<value|nf-same-chunk>|<not|<equal|<number|<the-nf-chunk>|alpha>|a>>>>>>>

  <\active*>
    <\src-comment>
      nf-chunk is the first public macro. It shows a named listing with all
      the trimmings. We disable header if previous chunk on this page had
      same name and this is not the first chunk on a page
    </src-comment>
  </active*>

  <assign|nflp|<\macro|name|x|lang|args>
    <\with|the-label|>
      <nf-chunk-init|<arg|name>|<arg|args>><nf-gather|<arg|name>|<arg|x>|<arg|lang>><no-page-break><if|<not|<value|nf-continues>>|<small|<nf-header|<arg|name>|<arg|lang>|<arg|args>>>|<small|<arg|name>>>

      <\small>
        <prog-fragment|<arg|name>|<arg|lang>|<list|<macro|x|<nf-render-line-no|<arg|x>>>|<macro|x|<smaller|<arg|x>>>|><assign|item-nr|<value|<merge|code-line-|<unquote|<arg|name>>|-nr>>><if|<equal|<get-label|<arg|x>>|document>|<map-args|nitemly|document|x>|<arg|x>><assign|<merge|code-line-|<unquote|<arg|name>>|-nr>|<value|item-nr>>>
      </small>
    </with>
  </macro>>

  <assign|nf-chunk|<\macro|name|x|lang|args>
    <\with|the-label|>
      <nf-chunk-init|<arg|name>|<arg|args>><nf-gather|<arg|name>|<arg|x>|<arg|lang>><no-page-break><if|<not|<value|nf-continues>>|<small|<nf-header|<arg|name>|<arg|lang>|<arg|args>>>|<small|<arg|name>>>

      <\small>
        <prog-fragment|<arg|name>|<arg|lang>|<list|<macro|x|<nf-render-line-no|<arg|x>>>|<macro|x|<smaller|<arg|x>>>|<assign|item-nr|<value|<merge|code-line-|<unquote|<arg|name>>|-nr>>><if|<equal|<get-label|<arg|x>>|document>|<map-args|itemly|document|x>|<arg|x>><assign|<merge|code-line-|<unquote|<arg|name>>|-nr>|<value|item-nr>>>>
      </small>
    </with>
  </macro>>

  <drd-props|nf-chunk|accessible|all>

  <assign|nf-last-chunk|>

  <assign|nf-chunk-more|<\macro|x>
    <\with|the-label|>
      <nf-chunk-init|<value|nf-last-chunk>>

      <\small>
        <prog-fragment|<value|nf-last-chunk>|<arg|lang>|<list|<macro|x|<nf-render-line-no|<arg|x>>>|<macro|x|<smaller|<arg|x>>>|<assign|item-nr|<value|<merge|code-line-|<unquote|<value|nf-last-chunk>>|-nr>>><if|<equal|<get-label|<arg|x>>|document>|<map-args|itemly|document|x>|<arg|x>><assign|<merge|code-line-|<unquote|<value|nf-last-chunk>>|-nr>|<value|item-nr>>>>
      </small>
    </with>
  </macro>>

  <\active*>
    <\src-comment>
      nf-ref is the second public macro. It may be inserted into a chunk
      listing to signify that another listing should be included at that
      point. As \\ doesn't work in listings you'll have to type meta-\\ \ 

      This will become an xmacro or something so that it can take optional
      arguments (like C macros) which will be expanded when the programs are
      extracted.
    </src-comment>
  </active*>

  <assign|nf-ref|<style-with|src-compact|none|<macro|name|args|\S<arg|name><if|<equal|<get-label|<arg|args>>|tuple>|(<nf-commas|<arg|args>>)>
  <reference|<nf-chunk-id|<arg|name>|ref|1>>\T<flag|<arg|name>|red><if|<equal|0|1>|<compound|<quote-arg|name>>>>>>

  <\active*>
    <\src-comment>
      nf-arg is a public macro. It will be replaced by the value of the chunk
      argument when the code is extracted
    </src-comment>
  </active*>

  <assign|nf-arg|<macro|name|<with|mode|math|<left|langle>><specific-verbatim|${><with|color|dark
  green|<with|prog-font-shape|italic|<arg|name>>><specific-verbatim|}><with|mode|math|<right|rangle>>>>

  <\active*>
    <\src-comment>
      chunk-reference takes the chunks name and chunklet number and returns a
      regular reference - like \<less\>reference\|\<gtr\> but calculates the
      id for you.
    </src-comment>
  </active*>

  <assign|chunk-reference|<macro|name|n|<reference|<nf-chunk-id|<arg|name>|ref|<arg|n>>>>>

  <assign|chunk-page-reference|<macro|name|n|<pageref|<nf-chunk-id|<arg|name>|ref|<arg|n>>>>>

  <assign|chunk-page-reference-page|<macro|name|n|<pagerefpage|<nf-chunk-id|<arg|name>|ref|<arg|n>>>>>

  <\active*>
    <\src-comment>
      One day nf-tab will manage proper tab stops and emit a literal TAB
      character in text mode.

      Until then, it equals 8 spaces and the sequence 0xE2 0x86 0xA6 must be
      converted to a tab during untangling
    </src-comment>
  </active*>

  <assign|nf-tab-stop|8>

  <assign|nf-tab|<macro|<resize|<with|mode|math|\<mapsto\>>|||<merge|c+|<minus|<value|nf-tab-stop>|<mod|<value|nf-len>|<value|nf-tab-stop>>>|spc>|>>>

  <assign|nf-ht|<macro|<extern|(lambda () `(concat "[" ,(string #\\ht)
  "]"))>>>

  <\active*>
    <\src-comment>
      Trash Bin - contains half-thought out or no-longer-needed code that I
      don't want to delete yet.
    </src-comment>
  </active*>

  <assign|nf-parse-look-ahead|<macro|<with|nf-chunks-index|<look-up|<look-up|<look-up|<value|nf-chunks-index>|0>|1>|4>|<with|i|0|<while|<less|<value|i>|<get-arity|<value|nf-chunks-index>>>|<assign|<merge|nfla-|<look-up|<look-up|<value|nf-chunks-index>|<value|i>>|0>>|<look-up|<value|nf-chunks-index>|<value|i>>><assign|i|<plus|<value|i>|1>>>>>>>

  <assign|juggles|<macro|m|<tree|<arg|m>=<get-label|<value|<arg|m>>>(<get-arity|<value|<arg|m>>>)|<look-up|<value|<arg|m>>|0>|<look-up|<value|<arg|m>>|1>|<look-up|<value|<arg|m>>|2>|<look-up|<value|<arg|m>>|3>|<look-up|<value|<arg|m>>|4>|<look-up|<value|<arg|m>>|5>>>>

  <assign|old-nf-chunklet-exists?|<macro|name|<is-tuple|<value|<merge|nfla-|<arg|name>>>>>>

  <assign|global-put|<macro|key|value|<with|the-label|<arg|value>|<label|<arg|key>>>>>

  <assign|global-get|<macro|key|<get-binding|<arg|key>|0>>>

  <\active*>
    <\src-comment>
      Todo:

      references to code chunk labels have the line number small

      non-nf-header continue chunks don't have a 4e shown but this is still
      used for the references.
    </src-comment>
  </active*>
</body>

<\initial>
  <\collection>
    <associate|page-medium|automatic>
    <associate|page-screen-height|708864tmpt>
    <associate|page-screen-width|1209600tmpt>
    <associate|preamble|true>
  </collection>
</initial>