<TeXmacs|1.99.2>

<style|source>

<\body>
  <\active*>
    <\src-title>
      <src-style-file|fangle|0.5>

      <\src-purpose>
        Style to be used in literate programs.
      </src-purpose>

      <\src-copyright|2009-2012>
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

  <\active*>
    <\src-comment>
      The previous release of newfangle did not embed the \<less\>item\<gtr\>
      tags within the listing to denote a new line. Instead it used tricks to
      break the environment contents into lines and enumerated over those and
      emitting an \<less\>item\<gtr\> tag before each one.

      Such a technique prevented lines from wrapping when typesetting and
      also prevented users from inserting soft line-breaks (as they can with
      normal enumerate environments).

      For these reasons, a change is made to explicitly use the
      \<less\>item\<gtr\> tag at the beginning of each line in a listing.
      When the program is extracted from the document:

      1. lines that do not begin with \<less\>item\<gtr\> will be joined to
      the previous line by a single space character.

      2. if the first line does not begin with \<less\>item\<gtr\> then

      \ \ \ a. if it is not the first instance of a chunk name, it will be
      joined to the end of the last line of the previous chunk instance

      Note: if a line is included in another chunk without starting a new
      line in the including chunk then the included chunk will not start a
      new line, regardless of whether or not it is prefixed with
      \<less\>item\<gtr\>

      \;

      This sed will convert <TeXmacs> documents from the old to the new
      format. Within nf-chunk tags it detects the start of a new entry by the
      preceding blank line and inserts an \<less\>item\<gtr\> tag. It also
      inserts an \<less\>item\<gtr\> tag right after the start of the
      nf-chunk tag as this does not have a blank line.

      <\verbatim>
        sed -e '

        /^[[:space:]]*\<less\>\\/nf-chunk/h

        /^$/{n;/[^ ]/{x;/^[[:space:]]*\<less\>\\\\nf-chunk/{x;s/[[:space:]]*/
        \<less\>item\<gtr\>/;x};x}}

        /^[[:space:]]*\<less\>\\\\nf-chunk/{h;n;s/[[:space:]]*/
        \<less\>item\<gtr\>/}

        ' slow.tm
      </verbatim>
    </src-comment>
  </active*>

  <\active*>
    <\src-comment>
      These are our package dependancies
    </src-comment>
  </active*>

  <use-package|std|env|tmdoc-markup>

  <\active*>
    <\src-comment>
      This is a failed attempt to add nf-chunk to the list tag definitions.
      It does not work and must currently be executed from Tools, Execute,
      Evaluate Scheme Expression
    </src-comment>
  </active*>

  <extern|(lambda() (define-group enumerate-tag nf-chunk))>

  <assign|list-of-chunks|<\macro|aux|body>
    <render-index|List of Code Chunks|<arg|body>>
  </macro>>

  <assign|list-of-chunks*|<\macro|aux|name|body>
    <render-index|<localize|<arg|name>>|<arg|body>>
  </macro>>

  <\active*>
    <\src-comment>
      The filename macro is intended to format filenames with appropriate
      visual markup and avoiding confusing insertions of hyphens when the
      name is split over a line
    </src-comment>
  </active*>

  <assign|filename|<macro|name|<verbatim|<arg|name>>>>

  <\active*>
    <\src-comment>
      The build-in code and verbaitim formats have an unpleasant line spacing
    </src-comment>
  </active*>

  <assign|old-code|<value|code>>

  <assign|code|<macro|x|<with|par-par-sep|0fn|<compound|old-code|<arg|x>>>>>

  <assign|old-verbatim|<value|verbatim>>

  <assign|verbatim|<macro|x|<with|<merge|ov-|<get-label|<arg|x>>>|<macro|x|<old-verbatim|<arg|x>>>|ov-document|<macro|x|<with|par-par-sep|0fn|<small|<old-verbatim|<arg|x>>>>>|<compound|<merge|ov-|<get-label|<arg|x>>>|<arg|x>>>>>

  <\active*>
    <\src-comment>
      This style renders causes hyperlinks to show the URL in a footnote -
      very useful for printed text and while <TeXmacs> PDF output does not
      support hyperlink clicking
    </src-comment>
  </active*>

  <assign|old-hlink|<value|hlink>>

  <assign|hlink|<macro|t|l|<old-hlink|<arg|t>|<arg|l>><if|<greater|<length|<arg|l>>|0>|<\footnote>
    <old-hlink|<arg|l>|<arg|l>>
  </footnote>>>>

  <assign|old-render-footnote|<value|render-footnote>>

  <assign|render-footnote|<macro|nr|x|<specific|html|\<less\>table
  width="30%" align="right"\<gtr\>\<less\>tr\<gtr\>\<less\>td\<gtr\>><assign|zz|<arg|nr>><with|footnote-sep|<macro|<specific|html|<value|zz>>.
  >|<old-render-footnote|<arg|nr>|<arg|x>>><specific|html|\<less\>/td\<gtr\>\<less\>/tr\<gtr\>\<less\>/table\<gtr\>>>>

  <\active*>
    <\src-comment>
      This style makes it easy to render a sequence of keystrokes.

      TODO: boundry from single-to multiple or back must have an extra space
    </src-comment>
  </active*>

  <assign|keys|<xmacro|args|<with|c|0|m|<length|<map-args|identity|tuple|args>>|<while|<less|<value|c>|<value|m>>|<if|<greater|<value|c>|0>|<if|<greater|<length|<arg|args|<value|c>>>|1>|
  >><key|<arg|args|<value|c>>><if|<less|<plus|<value|c>|1>|<value|m>>|<if|<and|<greater|<length|<arg|args|<value|c>>>|1>|<not|<greater|<length|<arg|args|<plus|<value|c>|1>>>|1>>>|
  >><assign|c|<plus|<value|c>|1>>>>>>

  <\active*>
    <\src-comment>
      This style makes it easy to render a fake text insertion point/caret

      TODO: make it full height. Maybe make it also italic when needed
    </src-comment>
  </active*>

  <assign|look-up-or|<macro|x|i|o|<if|<and|<equal|<get-label|<arg|x>>|tuple>|<greater|<length|<arg|x>>|<arg|i>>>|<look-up|<arg|x>|<arg|i>>|<arg|o>>>>

  <assign|fake-caret|<macro|<space|0.5spc><with|gr-mode|<tuple|edit|line>|gr-frame|<tuple|scale|1fs|<tuple|0.5gw|0.5gh>>|gr-geometry|<tuple|geometry|3ln|1.5ex|bottom>|gr-color|red|gr-auto-crop|false|<graphics||<with|color|red|<line|<point|0gw|1ln>|<point|1gw|1ln>>>|<with|color|red|<line|<point|0.5gw|1ln>|<point|0.5gw|1gh>>>|<with|color|red|<line|<point|0gw|1gh>|<point|1gw|1gh>>>>><space|0.5spc>>>

  <assign|sub-page|<macro|x|<with|ornament-color|#eeeeee|ornament-sunny-color|#000000|ornament-shadow-color|#000000|ornament-borderx|2l|ornament-hpadding|2ex|ornament-vpadding|2ex|<ornament|<surround||<htab|0spc>|<indent-both|1cm|1cm|<arg|x>>>>>>>

  <assign|fake-page-base-name|>

  <assign|fake-page-make-new-label|<macro|x|<merge|<value|fake-page-base-name>|-|<arg|x>>>>

  <assign|fake-page-label|<macro|x|<with|the-label|<tuple|<value|the-label>|<value|page-no>>|<quasi|<old-label|<unquote|<fake-page-make-new-label|<arg|x>>>>>>>>

  <assign|fake-page-pagerefpage|<macro|x|<quasi|<look-up-or|<get-binding|<unquote|<fake-page-make-new-label|<arg|x>>>|0>|1|<uninit>>>>>

  <assign|fake-page-reference|<macro|x|<quasi|<with|b|<get-binding|<unquote|<fake-page-make-new-label|<arg|x>>>|0>|<compound|look-up-or|<value|b>|0|<uninit>>>>>>

  <assign|fake-page-environment|<macro|x|<with|old-label|<value|label>|label|<value|fake-page-label>|pagerefpage|<value|fake-page-pagerefpage>|old-reference|<value|reference>|reference|<value|fake-page-reference>|this-page-no|<macro|<value|page-no>>|fake-page-base-name|<merge|fake-page-|<value|doc>|-|<value|page-no>|-|<value|instance>>|<arg|x>>>>

  <assign|init-or|<macro|x|i|<if|<not|<equal|<uninit>|<arg|x>>>|<arg|x>|<arg|i>>>>

  <assign|fake-page|<macro|content|doc|page-no|instance|<with|doc|<compound|init-or|<arg|doc>|>|page-no|<compound|init-or|<arg|page-no>|0>|instance|<compound|init-or|<arg|instance>|0>|<sub-page|<fake-page-environment|<arg|content>>>>>>

  <assign|this-page-no|<macro|<auto-label><get-binding|<the-auto>|1>>>

  <\active*>
    <\src-comment>
      Now, some extensions to standard <TeXmacs> functionality.

      \ - the get-binding trick to extract a page number is kindly given by
      Joris who gave us so much already.

      I would rather ispageref? just made the first test comparing to uninit
      (the red question mark) so that real but un-placed page refs would
      still be recognized as a pageref - however I have found documents with
      stale labels - that no longer exist in the document but which are still
      stored in the document references section with a target page of ?

      --- additional note: I have found that stale labels are now not even
      reverting to ? but retain the last known value. The only fix is to
      insert \<less\>assign\|save-aux\|false\<gtr\> in the pre-amble and hope
      that it works (it often doesn't) so that page references are not saved
      at all but created from scratch each time - avoiding the problem of
      stale labels as they won't get created!
    </src-comment>
  </active*>

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
      the page number for a label (as it was last calculated to be).\ 

      This is useful when constructing our own labels that consist of the
      page number and a sub-page counter of the target.
    </src-comment>
  </active*>

  <assign|pagerefpage|<macro|x|<get-binding|<arg|x>|1>>>

  <\active*>
    <\src-comment>
      These next macros control how a code chunk is rendered on the screen,
      and could legitimately be re-defined in the document.
    </src-comment>
  </active*>

  <\active*>
    <\src-comment>
      nf-framed-table defines the format of the single cell that used to hold
      the listing. The listing is no longer defined in a cell, but we still
      draw top and bottom borders.

      Currenly we can't draw left and right borders.
    </src-comment>
  </active*>

  <assign|nf-cell-border|0.5ln>

  <assign|nf-cell-no-border|0.0ln>

  <assign|nf-cell-top-border|<value|nf-cell-border>>

  <assign|nf-cell-left-border|<value|nf-cell-border>>

  <assign|nf-cell-bottom-border|<value|nf-cell-no-border>>

  <assign|nf-cell-right-border|<value|nf-cell-border>>

  <\active*>
    <\src-comment>
      DEPRACATED: nf-framed-fragment defines the listing to be rendered in a
      table with a single cell.
    </src-comment>
  </active*>

  <assign|nf-framed-table|<macro|x|<with|color|dark
  grey|<tformat|<twith|table-width|1par>|<cwith|1|-1|1|-1|cell-hyphen|t>|<cwith|1|-1|1|-1|cell-bsep|1spc>|<cwith|1|-1|1|-1|cell-tsep|1spc>|<cwith|1|-1|1|-1|cell-background|white>|<cwith|1|-1|1|-1|cell-lborder|<value|nf-cell-left-border>>|<cwith|1|-1|1|-1|cell-rborder|<value|nf-cell-right-border>>|<cwith|1|-1|1|-1|cell-bborder|<value|nf-cell-bottom-border>>|<cwith|1|-1|1|-1|cell-tborder|<value|nf-cell-top-border>>|<arg|x>>>>>

  <\active*>
    <\src-comment>
      DEPREACTED: nf-framed-fragment defines the listing to be rendered in a
      table with a single cell.\ 

      As we currently use \<less\>wide-underlined\<gtr\> or
      \<less\>wide-bothlined\<gtr\> to draw the lines this is done on lines
      before and after the listing by underlining the header and a following
      blank line, so nf-framed-fragment is currently null.
    </src-comment>
  </active*>

  <assign|nf-framed-fragment-old|<macro|x|<nf-framed-table|<tformat|<table|<row|<\cell>
    <with|color|black|<arg|x>>
  </cell>>>>>>>

  <assign|nf-framed-fragment|<macro|x|<arg|x>>>

  <\active*>
    <\src-comment>
      This is how top and bottom borders are drawn using solid or jagged
      lines - it needs reworking, its a horrid hack with repeated code. \ 
    </src-comment>
  </active*>

  <assign|nf-jag-top|<macro|<with|gr-geometry|<tuple|geometry|0.25fn|1fn>|gr-mode|<tuple|edit|line>|gr-frame|<tuple|scale|1cm|<tuple|0gw|1gh>>|gr-line-width|0.5ln|<graphics||<line|<point|0gw|-0.4gh>|<point|0.5gw|-0.25gh>|<point|1gw|-0.4gh>>>>>>

  <assign|nf-jag-bottom|<macro|<with|gr-geometry|<tuple|geometry|0.25fn|1bls>|gr-mode|<tuple|edit|line>|gr-frame|<tuple|scale|1cm|<tuple|0gw|1gh>>|gr-line-width|1ln|<graphics||<line|<point|0gw|0.5gh>|<point|0.5gw|0.35gh>|<point|1gw|0.5gh>>>>>>

  <assign|nf-jags-top|<macro|x|<repeat|<arg|x>|<nf-jag-top>>>>

  <assign|nf-jags-bottom|<macro|x|<repeat|<arg|x>|<nf-jag-bottom>>>>

  <assign|nf-jagit-top|<macro|body|<datoms|<macro|x|<nf-jags-top|<arg|x>>>|<surround||<htab|5mm*|last><vspace*|1sep>|<arg|body>>>>>

  <assign|nf-jagit-bottom|<macro|body|<datoms|<macro|x|<nf-jags-bottom|<arg|x>>>|<surround||<htab|5mm*|last><vspace*|1sep>|<arg|body>>>>>

  <assign|nf-top-border-line|<macro|body|<wide-underlined|<value|nf-cell-border>|1ln|<arg|body>>>>

  <assign|nf-top-border-jags|<macro|body|<nf-jagit-top|<arg|body>>>>

  <assign|nf-top-border-true|<macro|body|<nf-top-border-line|<arg|body>>>>

  <assign|nf-top-border-false|<macro|body|<nf-top-border-jags|<arg|body>>>>

  <assign|nf-top-border|<macro|first|body|<compound|<merge|nf-top-border-|<arg|first>>|<arg|body>>>>

  <assign|nf-bottom-border-line|<macro|body|<wide-bothlined|<value|nf-cell-border>|0ln|1ln|0ln|<arg|body>>>>

  <assign|nf-bottom-border-jags|<macro|body|<nf-jagit-bottom|<arg|body>>>>

  <assign|nf-bottom-border-true|<macro|body|<nf-bottom-border-line|<arg|body>>>>

  <assign|nf-bottom-border-false|<macro|body|<nf-bottom-border-jags|<arg|body>>>>

  <assign|nf-bottom-border|<macro|first|body|<compound|<merge|nf-bottom-border-|<arg|first>>|<arg|body>>>>

  <\active*>
    <\src-comment>
      prog-f renders a body in prog mode with specified language and without
      a ghastly par-par-sep
    </src-comment>
  </active*>

  <assign|prog-f|<macro|lang|body|<with|mode|prog|prog-language|<arg|lang>|<with|par-par-sep|0fn|<arg|body>>>>>

  <\active*>
    <\src-comment>
      nf-border-if takes a boolean and then returns a correct width to show
      (or not show) a border -- either as a table sell or a wide-underlined
    </src-comment>
  </active*>

  <assign|nf-border-if|<macro|x|<if|<arg|x>|<value|nf-cell-border>|<value|nf-cell-no-border>>>>

  <\active*>
    <\src-comment>
      ???prog-fragment is the top level macro used for rendering a listing
      (without line numbers). It renders prog-f within a framed fragment.
    </src-comment>
  </active*>

  <assign|prog-fragment|<\macro|name|lang|x>
    <with|nf-cell-top-border|<nf-border-if|<compound|nf-first-chunklet?|<arg|name>>>|nf-cell-bottom-border|<nf-border-if|<nf-last-chunklet?|<arg|name>>>|<nf-framed-fragment|<compound|prog-f|<arg|lang>|<arg|x>>>>
  </macro>>

  <assign|nf-pf|<macro|name|lang|x|<nf-framed-fragment|<prog-f|<arg|lang>|<arg|x>>>>>

  <\active*>
    <\src-comment>
      ???Numbering the listing
    </src-comment>
  </active*>

  <assign|nflp|<macro|x|<arg|x>>>

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
      tell when a chunk is on a different page to the previous chunk --- in
      order to reset the alpha-counter.
    </src-comment>
  </active*>

  <assign|nf-page|0>

  <\active*>
    <\src-comment>
      Chunks have a name which is provided by the user, but more than one
      chunk can have the same name. These are called chunklets of the same
      chunk.

      Although chunklets have the same name, they have a different id, which
      is the name with a specified prefix, and a suffix which is the chunklet
      sequence number.

      nf-chunk-id computes a chunk id from a fixed "code-" namespace, a
      supplied "tag" namespace name, the name and the chunklet number
    </src-comment>
  </active*>

  <assign|nf-base|<macro|x|<if|<provides|fake-page-base-name>|<merge|<value|fake-page-base-name>|-|<arg|x>>|<arg|x>>>>

  <assign|zog|<xmacro|x|<quasi|<if|<and|<provides|fake-page-base-name>|<greater|<length|<value|fake-page-base-name>>|0>>|<merge|<value|fake-page-base-name>|-|<unquote*|<quote-arg|x>>>|<merge|<unquote*|<quote-arg|x>>>>>>>

  <assign|nf-chunk-id|<macro|name|tag|n|<merge|<nf-base|code->|<arg|tag>|-|<unquote|<arg|name>>|-|<arg|n>>>>

  <\active*>
    <\src-comment>
      nf-this-chunk-id is a convenience that uses the counter for the current
      chunklet. (Each chunk has it's own counter to count it's chunklets)

      ???Possibly unquote should be used by the called and not here
    </src-comment>
  </active*>

  <assign|nf-this-chunk-id|<macro|name|tag|<nf-chunk-id|<arg|name>|<arg|tag>|<compound|<merge|the-code-chunk-|<unquote|<arg|name>>>>>>>

  <\active*>
    <\src-comment>
      Simple way to discover if we are processing the first chunklet of a
      named chunk - by checking it's chunklet counter.
    </src-comment>
  </active*>

  <assign|nf-first-chunklet?|<macro|name|<equal|<compound|<merge|the-code-chunk-|<unquote|<arg|name>>>>|1>>>

  <\active*>
    <\src-comment>
      Simple way to discover if we are processing the last chunklet of a
      named chunk - by checking if there is a chunklet with an increased
      counter
    </src-comment>
  </active*>

  <assign|nf-last-chunklet?|<macro|name|<not|<nf-chunklet-exists?|<nf-next-chunk-id|<arg|name>>>>>>

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
      nf-nav renders the links to the previous and next chunklets of this
      chunk (if they exist).

      Looks like this: <math|\<vartriangleleft\>>7b
      7d<math|\<vartriangleright\>>
    </src-comment>
  </active*>

  <assign|nf-prev-chunk-id|<macro|name|<nf-chunk-id|<arg|name>|ref|<minus|<compound|<merge|the-code-chunk-|<unquote|<arg|name>>>>|1>>>>

  <assign|nf-next-chunk-id|<macro|name|<nf-chunk-id|<arg|name>|ref|<plus|<compound|<merge|the-code-chunk-|<unquote|<arg|name>>>>|1>>>>

  <assign|fangle-nav-left|<math|\<vartriangleleft\>>>

  <assign|fangle-nav-up|<math|\<vartriangle\>>>

  <assign|fangle-nav-down|<math|\<triangledown\>>>

  <assign|fangle-nav-right|<math|\<vartriangleright\>>>

  <assign|render-fangle-nav|<style-with|src-compact|none|<macro|<style-with|src-compact|all|<if|<not|<equal|<length|<value|prev_label>>|0>>|<value|prev><value|prev_label>><style-with|src-compact|all|<if|<not|<equal|<length|<value|next_label>>|0>>|
  <value|next_label><value|next>>>>>>>

  <assign|fangle-nav|<style-with|src-compact|none|<\macro|name>
    <with|prev|<if|<equal|<pagerefpage|<nf-prev-chunk-id|<arg|name>>>|<pagerefpage|<nf-this-chunk-id|<arg|name>|label>>>|<math|\<vartriangle\>>|<math|\<vartriangleleft\>>>|prev_label|<if|<not|<nf-first-chunklet?|<arg|name>>>|<reference|<nf-prev-chunk-id|<arg|name>>>>|next|<if|<not|<nf-last-chunklet?|<arg|name>>>|<if|<equal|<pagerefpage|<nf-next-chunk-id|<arg|name>>>|<pagerefpage|<nf-this-chunk-id|<arg|name>|label>>>|<math|\<triangledown\>>|<math|\<vartriangleright\>>>>|next_label|<if|<not|<nf-last-chunklet?|<arg|name>>>|
    <reference|<nf-next-chunk-id|<arg|name>>>>|<render-fangle-nav>>

    <style-with|src-compact|all|>
  </macro>>>

  <assign|xnf-nav|<style-with|src-compact|none|<macro|name|<style-with|src-compact|all|<if|<not|<nf-first-chunklet?|<arg|name>>>|<if|<equal|<pagerefpage|<nf-prev-chunk-id|<arg|name>>>|<pagerefpage|<nf-this-chunk-id|<arg|name>|label>>>|<math|\<vartriangle\>>|<math|\<vartriangleleft\>>><reference|<nf-prev-chunk-id|<arg|name>>>>><if|<nf-chunklet-exists?|<nf-next-chunk-id|<arg|name>>>|
  <reference|<nf-next-chunk-id|<arg|name>>><if|<equal|<pagerefpage|<nf-next-chunk-id|<arg|name>>>|<pagerefpage|<nf-this-chunk-id|<arg|name>|label>>>|<math|\<triangledown\>>|<math|\<vartriangleright\>>>>>>>

  <\active*>
    <\src-comment>
      nf-header renders the single line header before the listing. It lists
      the reference of this chunk which is the-label (already estiablished by
      nf-chunk-init) along with the chunk name and language, the chunklet
      number and a reference to the first chunklet with the same name, and
      also the chunklet navigation.

      Like this:\ 
    </src-comment>
  </active*>

  <assign|render-fangle-header|<macro|name|lang|args|<shift|<resize|<specific-verbatim|\<#000A\>><value|chunk_label>
  |||0fn|>|-2.0fn|><nv-langle><with|color|blue|<arg|name>>[<value|chunk_no><style-with|src-compact|none|]><if|<not|<equal|<value|chunk_no>|1>>|<if|<not|<equal|<length|<arg|args>>|0>>|(<with|nf-render-commas|<macro|x|<arg|x>>|<nf-commas|<arg|args>>>)>
  <math|\<Uparrow\>><value|first_chunk_label>|(<nf-commas|<arg|args>>)>,
  lang=<with|color|blue|<arg|lang>><nv-rangle>
  <math|<if|<not|<equal|<value|chunk_no>|1>>|+>\<equiv\>>>>

  <drd-props|render-fangle-header|accessible|all>

  <assign|if-provides|<macro|x|<if|<provides|<arg|x>>|<arg|x>>>>

  <assign|fangle-header|<macro|name|lang|args|<render-fangle-header|<arg|name>|<arg|lang>|<arg|args>|<if-provides|<compound|<merge|the-code-chunk-|<unquote|<arg|name>>>>>|<value|the-label>>>>

  <assign|draw-fangle-header|<macro|name|lang|args|chunk_no|chunk_label|first_chunk_label|prev|prev_label|next|next_label|<with|name|<arg|name>|lang|<arg|lang>|args|<arg|args>|chunk_no|<arg|chunk_no>|chunk_label|<arg|chunk_label>|first_chunk_label|<arg|first_chunk_label>|prev|<arg|prev>|prev_label|<arg|prev_label>|next_label|<arg|next_label>|next|<arg|next>|<render-fangle-header><htab|0pt><render-fangle-nav>>>>

  <assign|nf-pad|<macro|w|<if|<not|<less|<arg|w>|1>>|
  <nf-pad|<minus|<arg|w>|1>>>>>

  <assign|nf-header|<macro|name|lang|args|<shift|<resize|<specific-verbatim|\<#000A\>><value|the-label>
  |||0fn|>|-2.0fn|><nv-langle><with|color|blue|<arg|name>>[<compound|<merge|the-code-chunk-|<unquote|<arg|name>>>><style-with|src-compact|none|]><if|<not|<nf-first-chunklet?|<arg|name>>>|<if|<not|<equal|<value|<merge|code-args-|<unquote|<arg|name>>>>|<uninit>>>|(<with|nf-render-commas|<macro|x|<arg|x>>|<nf-commas|<value|<merge|code-args-|<unquote|<arg|name>>>>>>)>
  <math|\<Uparrow\>><reference|<nf-chunk-id|<arg|name>|ref|1>>|(<nf-commas|<arg|args>>)>,
  lang=<with|color|blue|<arg|lang>><nv-rangle>
  <math|<if|<not|<nf-first-chunklet?|<arg|name>>>|+>\<equiv\>><htab|0pt><fangle-nav|<arg|name>>>>

  <assign|nf-header|<macro|name|lang|args|<with|chunk_label|<value|the-label>|chunk_no|<compound|<merge|the-code-chunk-|<unquote|<arg|name>>>>|first_chunk_label|<reference|<nf-chunk-id|<arg|name>|ref|1>>|<fangle-header|<arg|name>|<arg|lang>|<if|<not|<equal|<value|<merge|code-args-|<unquote|<arg|name>>>>|<uninit>>>|<if|<nf-first-chunklet?|<arg|name>>|<nf-commas|<arg|args>>|<nf-commas|<value|<merge|code-args-|<unquote|<arg|name>>>>>>|<arg|args>>><htab|0pt><xnf-nav|<arg|name>>>>>

  \;

  <drd-props|nf-header|accessible|all>

  <assign|nf-render-commas|<macro|x|<with|color|blue|<arg|x>>>>

  <assign|nf-commas|<macro|items|<if|<equal|<get-label|<arg|items>>|tuple>|<if|<less|<length|<arg|items>>|1>|<arg|items><specific-verbatim|\<#000B\>>|<nf-render-commas|<look-up|<arg|items>|0>><if|<greater|<length|<arg|items>>|1>|<specific-verbatim|\<#000B\>>,
  <nf-commas|<range|<arg|items>|1|<length|<arg|items>>>>|<specific-verbatim|\<#000B\>>>>|<arg|items><if|<not|<equal|<length|<arg|items>>|0>>|<specific-verbatim|\<#000B\>>>>>>

  <drd-props|nf-commas|accessible|all>

  <assign|nf-commaxy|<macro|x|, (<arg|x>)>>

  <assign|nf-commax|<xmacro|args|[<arg|args|0><map-args|nf-commaxy|concat|args|1>]>>

  <assign|bla|<xmacro|args|<arg|args|0>:<arg|args|1>(<arg|args>)>>

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

  <assign|nf-chunk-new|<macro|name|args|<quasi|<new-counter|<merge|code-chunk-|<unquote|<arg|name>>>><new-counter|<merge|code-line-|<unquote|<arg|name>>>><assign|<unquote|<merge|code-item-|<arg|name>>>|<macro|<compound|<unquote|<merge|next-code-line-|<arg|name>>>><render-item|<compound|<unquote|<merge|the-code-line-|<arg|name>>>>>>><compound|<merge|inc-code-chunk-|<unquote|<arg|name>>>><assign|<merge|code-args-|<unquote|<arg|name>>>|<arg|args>>><write|nf-chunk|<tuple|<tuple|<arg|name>>|<reference|<nf-this-chunk-id|<arg|name>|ref>>>>>>

  <\active*>
    <\src-comment>
      nf-chunk-next is called by nf-chunk-init for the additional chunklets
      of a given chunk name. \ It increments the chunklet counter
    </src-comment>
  </active*>

  <assign|nf-chunk-next|<macro|name|<compound|<merge|inc-code-chunk-|<unquote|<arg|name>>>><write|nf-chunk|<tuple|<tuple|<arg|name>>|<reference|<nf-this-chunk-id|<arg|name>|ref>>>>>>

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
      ???????? Review from here onwards
    </src-comment>
  </active*>

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
      There seems to be no \<less\>specific\|...\<gtr\> tag for verbatim
      exports, so we use specific-verbatim. The body is not visible except in
      text exports.
    </src-comment>
  </active*>

  <assign|specific-verbatim|<macro|x|<clipped|<arg|x>|0|0|0|0>>>

  <\active*>
    <\src-comment>
      except-specific-verbatim is intended to output in all forms except
      verbatim. This is used because some entities do not have a text
      representation --- like \<less\>langle\<gtr\> and the fall-back
      representation is ugly. This macro does not work in page headers, the
      \<less\>if*\|false\|body\<gtr\> fails to leave the correct space
    </src-comment>
  </active*>

  <assign|except-specific-verbatim|<macro|body|<specific|screen|<arg|body>><specific|printer|<arg|body>><if*|false|<arg|body>>>>

  <\active*>
    <\src-comment>
      nv-langle-subst and lv-rangle-subst define characters that should be
      output in verbatim mode instead of langle and rangle which would
      otherwise be output as the literal text rangle and langle
    </src-comment>
  </active*>

  <assign|nv-langle-subst|\<less\>>

  <assign|nv-rangle-subst|\<gtr\>>

  <\active*>
    <\src-comment>
      nv-langle and nv-rangle are macros that can be used to generate a
      langle and rangle exceot in text mode were they use the subst
      characters \<less\> and \<gtr\>
    </src-comment>
  </active*>

  <assign|nv-langle|<macro|<except-specific-verbatim|<with|mode|math|<left|langle>>><specific-verbatim|<value|nv-langle-subst>>>>

  <assign|nv-rangle|<macro|<except-specific-verbatim|<with|mode|math|<right|rangle>>><specific-verbatim|<value|nv-rangle-subst>>>>

  <\active*>
    <\src-comment>
      nv-render-line-no renders the line numbers for listings in a way that
      is suitable for typeset and also verbatim export.
    </src-comment>
  </active*>

  <assign|nf-render-line-no|<macro|x|<with|mode|text|par-mode|right|<with|font-family|tt|<with|font-base-size|6|<specific-verbatim|<nf-pad|<minus|3|<length|<value|item-nr>>>>><aligned-space-item|<arg|x>><specific-verbatim|\|
  >>>><nf-bar>>>

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
      nf-chunk-outit is called at the end of nf-chunk mainly to create a
      label so that we can see if the chunk ended on the same page it began.\ 
    </src-comment>
  </active*>

  <assign|nf-chunk-outit|<macro|name|<label|<nf-this-chunk-id|<arg|name>|end>>>>

  <\active*>
    <\src-comment>
      These macros output either a solid line ________ or a torn-paper-line
      /\\/\\/\\ at the top and bottom of listins in verbatim mode, to signify
      if the chunk continues or ends with this chunklet
    </src-comment>
  </active*>

  <assign|nf-jags|<macro|<datoms|<macro|x|<repeat|<arg|x>|<with|gr-geometry|<tuple|geometry|2mm|5mm|center>|gr-mode|<tuple|edit|line>|gr-frame|<tuple|scale|1cm|<tuple|0.589991gw|0.5gh>>|<graphics||<line|<point|0mm|0mm>|<point|1mm|1mm>|<point|2mm|0mm|>>>>>>|<htab|5mm*|last>>>>

  <assign|nf-bar|<macro|>>

  <assign|nf-barx|<macro|<merge|<times|<value|font-base-size>|<value|font-size>>|pt><with|gr-geometry|<tuple|geometry|2mm|<merge|<times|<value|font-base-size>|<value|font-size>|1>|pt>|center>|gr-mode|<tuple|edit|line>|line-width|8ln|<graphics||<line|<point|0mm|0mm>|<point|0mm|30pt>>>>>>

  <assign|nf-verbatim-top|<macro|new|<if|<arg|new>|<specific-verbatim|
  \ \ \ \ \ ________________________________________________________________________>|<specific-verbatim|
  \ \ \ \ ./\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\>>>>

  <assign|nf-verbatim-bottom|<macro|new|<if|<arg|new>|<specific-verbatim|
  \ \ \ \ \|________________________________________________________________________>|<specific-verbatim|
  \ \ \ \ \|/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\>>>>

  <\active*>
    <\src-comment>
      nf-chunk is the first public macro. It shows a named listing with all
      the trimmings.\ 

      We used to disable the full header if previous chunk on this page had
      same name and this is not the first chunk on a page
    </src-comment>
  </active*>

  <assign|nf-use-page-header|<macro|h|<set-this-page-header|<value|page-even-header>>>>

  <assign|nf-use-page-header|<macro|h|<set-this-page-header|<arg|h>>>>

  <assign|nf-chunk|<macro|name|x|lang|args|<with|the-label||xnv-langle-subst||xnv-rangle-subst||nf-name|<unquote|<arg|name>>|y|<value|pob>|<small|<surround|<aligned-space-item|><nf-chunk-init|<arg|name>|<arg|args>><wide-underlined|<nf-border-if|<nf-first-chunklet?|<value|nf-name>>>|1ln|<no-page-break*><label|<arg|name>><small|<nf-header|<arg|name>|<arg|lang>|<arg|args>>><no-page-break>>|<if|<nf-last-chunklet?|<value|nf-name>>|<wide-bothlined|<nf-border-if|<nf-last-chunklet?|<value|nf-name>>>|0ln|1ln|0ln|<if|<nf-first-chunklet?|<value|nf-name>>|<nf-show-used-by>><htab|5mm*|last>>|<if|<nf-first-chunklet?|<value|nf-name>>|<nf-show-used-by>>>|<\with|item|<value|<merge|code-item-|<unquote|<arg|name>>>>|item-vsep|0fn|current-item|<value|nf-render-line-no>|transform-item|<value|identity>>
    <\surround||<nf-chunk-outit|<arg|name>><if|<and|<not|<equal|<value|nf-page>|<pagerefpage|<nf-this-chunk-id|<arg|name>|end>>>>|<ispageref?|<nf-this-chunk-id|<arg|name>|end>>>|<nf-use-page-header|<with|nv-langle|<macro|<with|mode|math|<left|langle>>>|nv-rangle|<macro|<with|mode|math|<right|rangle>>>|<small|<nf-header|<arg|name>|<arg|lang>|<arg|args>>>>>>>
      <no-page-break><nf-verbatim-top|<nf-first-chunklet?|<value|nf-name>>>

      <with|nv-langle-subst|\S|nv-rangle-subst|\T|nf-current-chunk|<arg|name>|<nf-pf|<value|nf-name>|<arg|lang>|<arg|x>>>

      <no-page-break*><if|<nf-last-chunklet?|<value|nf-name>>|<assign|<merge|code-line-|<value|nf-name>|-nr>|0>><nf-verbatim-bottom|<nf-last-chunklet?|<value|nf-name>>>
    </surround>
  </with>>>>>>

  <assign|nf-chunkl|<macro|name|x|lang|args|<with|the-label||xnv-langle-subst||xnv-rangle-subst||nf-name|<unquote|<arg|name>>|y|<value|pob>|||<small|<\surround|<nf-chunk-init|<arg|name>|<arg|args>><label|<arg|name>><no-page-break*><small|<nf-top-border|<nf-first-chunklet?|<value|nf-name>>|<nf-header|<arg|name>|<arg|lang>|<arg|args>>>><no-page-break>|<nf-bottom-border|<nf-last-chunklet?|<value|nf-name>>|<htab|5mm*|last>>>
    <\with|item|<value|<merge|code-item-|<unquote|<arg|name>>>>|item-vsep|0fn|current-item|<value|nf-render-line-no>|transform-item|<value|identity>>
      <\surround||<nf-chunk-outit|<arg|name>><if|<and|<not|<equal|<value|nf-page>|<pagerefpage|<nf-this-chunk-id|<arg|name>|end>>>>|<ispageref?|<nf-this-chunk-id|<arg|name>|end>>>|<nf-use-page-header|<with|nv-langle|<macro|<with|mode|math|<left|langle>>>|nv-rangle|<macro|<with|mode|math|<right|rangle>>>|<small|<nf-header|<arg|name>|<arg|lang>|<arg|args>>>>>>>
        <no-page-break><nf-verbatim-top|<nf-first-chunklet?|<value|nf-name>>>

        <with|nv-langle-subst|\S|nv-rangle-subst|\T|<nf-pf|<value|nf-name>|<arg|lang>|<arg|x>>>

        <if|<nf-last-chunklet?|<value|nf-name>>|<assign|<merge|code-line-|<value|nf-name>|-nr>|0>>
      </surround>
    </with>
  </surround>>>>>

  <assign|nf-fake-chunk|<macro|name|x|lang|args|chunk_no|chunk_label|chunk_first_label|prev|prev_label|next|next_label|line-no|<with|the-label||xnv-langle-subst||xnv-rangle-subst||nf-name|<unquote|<arg|name>>|chunk_no|<arg|chunk_no>|chunk_label|<arg|chunk_label>|first_chunk_label|<arg|chunk_first_label>|prev|<arg|prev>|prev_label|<arg|prev_label>|next|<arg|next>|next_label|<arg|next_label>|<small|<surround|<aligned-space-item|><wide-underlined|<nf-border-if|<equal|<value|chunk_no>|1>>|1ln|<no-page-break*><small|<render-fangle-header|<arg|name>|<arg|lang>|<arg|args>><htab|0pt><render-fangle-nav>><no-page-break>>|<if|<equal|<length|<value|next>>|0>|<wide-bothlined|<nf-border-if|<equal|<length|<value|next>>|0>>|0ln|1ln|0ln|<htab|5mm*|last>>|<nf-jags>>|<\with|xitem|<arg|line-no>|item-nr|0|item-vsep|0fn|current-item|<value|nf-render-line-no>|transform-item|<value|identity>>
    <no-page-break><nf-verbatim-top|<nf-first-chunklet?|<value|nf-name>>>

    <with|nv-langle-subst|\S|nv-rangle-subst|\T|<nf-pf|<value|nf-name>|<arg|lang>|<arg|x>>>

    <no-page-break*><if|<nf-last-chunklet?|<value|nf-name>>|<assign|<merge|code-line-|<value|nf-name>|-nr>|0>><nf-verbatim-bottom|<nf-last-chunklet?|<value|nf-name>>>
  </with>>>>>>

  <new-list|nfl|<value|aligned-dot-item>|<value|identity>>

  <drd-props|nf-chunk|accessible|all>

  <drd-props|nf-fake-chunk|accessible|all>

  <assign|nf-comment|<macro|x|<with|mode|text|<specific-verbatim|/*
  ><arg|x><specific-verbatim| */>>>>

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

  <assign|nf-ref|<style-with|src-compact|none|<macro|name|args|<if|<and|<provides|nf-current-chunk>|<not|<equal|<uninit>|<value|nf-current-chunk>>>|<not|<equal|?|<value|nf-current-chunk>>>>|<nf-used-by-chunk|<arg|name>|<nf-chunk-id|<value|nf-current-chunk>|ref|1>><write|nf-chunk|<tuple|<tuple|<arg|name>|Used
  by>|<reference|<nf-chunk-id|<value|nf-current-chunk>|ref|1>>>>|<auto-label><write|nf-chunk|<tuple|<tuple|<arg|name>|Mentioned>|<nf-render-used-by|<the-auto>>>>><nv-langle><arg|name><if|<and|<or|<equal|<get-label|<arg|args>>|tuple>|<equal|<get-label|<arg|args>>|string>>|<greater|<length|<arg|args>>|0>>|<specific-verbatim|\<#000B\>>(<if|<equal|<get-label|<arg|args>>|tuple>|<nf-commas|<arg|args>>|<with|color|blue|<arg|args>>>)|<phantom|(><arg|args>>
  <reference|<nf-chunk-id|<arg|name>|ref|1>><nv-rangle><flag|<arg|name>|red><if|<equal|0|1>|<compound|<quote-arg|name>>>>>>

  <assign|nf-fake-ref|<style-with|src-compact|none|<macro|name|args|ref|<nv-langle><arg|name><if|<equal|<get-label|<arg|args>>|tuple>|<specific-verbatim|\<#000B\>>(<nf-commas|<arg|args>>)>
  <arg|ref><nv-rangle><flag|<arg|name>|red><if|<equal|0|1>|<compound|<quote-arg|name>>>>>>

  <drd-props|nf-ref|accessible|all>

  <drd-props|nf-fake-ref|accessible|all>

  <assign|nf-render-used-by|<macro|x|<reference|<arg|x>> (<localize|page>
  <pageref|<arg|x>>)>>

  <assign|nf-used-by-chunk|<macro|name|<write|nf-chunk|<tuple|<tuple|<arg|name>|Used
  by>|<reference|<nf-chunk-id|<value|nf-current-chunk>|ref|1>>>>>>

  <assign|nf-put|<macro|name|value|<with|the-label|<arg|value>|<label|<arg|name>>>>>

  <assign|nf-get|<macro|name|<get-binding|<arg|name>|0>>>

  <assign|nf-ping-old|<macro|name|<if|<not|<provides|<merge|old-|<arg|name>>>>|<assign|<merge|old-|<arg|name>>|<get-binding|<arg|name>|0>>>>>

  <assign|nf-used-by-chunk|<macro|name|used|<nf-ping-old|<merge|nf-code-use-|<arg|name>>><with|uses|<value|<merge|nf-code-use-|<arg|name>>>|<if|<not|<equal|<get-label|<value|uses>>|tuple>>|<assign|<merge|nf-code-use-|<arg|name>>|<tuple|<arg|used>>>|<if|<not|<equal|<look-up|<value|<merge|nf-code-use-|<arg|name>>>|<minus|<length|<value|<merge|nf-code-use-|<arg|name>>>>|1>>|<arg|used>>>|<assign|<merge|nf-code-use-|<arg|name>>|<merge|<value|<merge|nf-code-use-|<arg|name>>>|<tuple|<arg|used>>>>>><nf-put|<merge|nf-code-use-|<arg|name>>|<value|<merge|nf-code-use-|<arg|name>>>>>>>

  <assign|nf-show-used-by|<macro|<nf-ping-old|<merge|nf-code-use-|<value|nf-name>>><with|uses|<value|<merge|old-nf-code-use-|<value|nf-name>>>|<if|<equal|<get-label|<value|uses>>|tuple>|Used
  by <nf-render-used-by|<value|uses>>|<smaller|not used>>>>>

  <assign|render-join|<xmacro|args|<with|join|<arg|args|0>|render|<arg|args|1>|render-join|<macro|x|<value|join><compound|<value|render>|<arg|x>>>|<compound|<value|render>|<arg|args|2>><map-args|render-join|concat|args|3>>>>

  <assign|nf-render-used-by|<macro|t|with|render|<quasi|<render-join|,
  |reference|<unquote*|<arg|t>>>>>>

  <\active*>
    <\src-comment>
      nf-quote causes literal text to be included in a new language mode -
      it's main task is to do some of the horrid nested quoting that some
      languages require.

      For instance to match a backslash in a gsub regex in awk requires 4
      back slashes - first quote the single backslash for the regex which
      makes two backslashes, and then quote each of those for the string
      argument to gsub
    </src-comment>
  </active*>

  <assign|output-mode?|<macro|<assign|output-mode|unknown><specific|screen|<assign|output-mode|typeset>><specific|html|<assign|output-mode|export>>>>

  <assign|nf-text-render-typeset|<macro|x|mode|submode|<math|<wide|<text|<verbatim|<arg|x>>>|\<wide-overbrace\>><rsup|<arg|mode>:<arg|submode>>>>>

  <assign|nf-text-render-export|<macro|x|mode|submode|<nv-langle><arg|mode>:<arg|submode>:<arg|x><nv-rangle>>>

  <assign|nf-text|<macro|x|mode|submode|<output-mode?><compound|<merge|nf-text-render-|<value|output-mode>>|<arg|x>|<arg|mode>|<arg|submode>>>>

  <drd-props|nf-text|accessible|all>

  <\active*>
    <\src-comment>
      nf-arg is a public macro. It will be replaced by the value of the chunk
      argument when the code is extracted.

      I really want to use \<less\>with\|nv-langle\|${\<gtr\> etc, but
      evaluation of this is deferred until afterwards or something
    </src-comment>
  </active*>

  <assign|nf-arg|<macro|name|<with|nv-langle-subst||nv-rangle-subst||<nv-langle><specific-verbatim|${><with|color|dark
  green|<with|prog-font-shape|italic|<arg|name>>><specific-verbatim|}><nv-rangle>>>>

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

      nf-untab will output 0xE2 0x86 0xA4 and is a hack; during untanging
      [[:space:]]*0xE2 0x86 0xA4 will be deleted. This is useful for
      removeing the indent of here documents in bash scripts
    </src-comment>
  </active*>

  <assign|nf-tab-stop|8>

  <assign|xafter|<specific-verbatim|\<#000A\> \ \ \ \<#221F\>>>

  <assign|xnf-tab|<macro|<resize|\<#0009\><with|mode|math|\<mapsto\>>|||<merge|c+|<minus|<value|nf-tab-stop>|<mod|<value|nf-len>|<value|nf-tab-stop>>>|spc>|>>>

  <assign|nf-tab|<macro|<resize|<with|mode|math|\<mapsto\>>|||8spc|>>>

  <assign|nf-untab|<macro|<with|mode|math|\<mapsfrom\>>>>

  <assign|nf-ht|<macro|<extern|(lambda () `(concat "[" ,(string #\\ht)
  "]"))>>>

  <\active*>
    <\src-comment>
      THIS is the NEW fangle
    </src-comment>
  </active*>

  <assign|fangle-chunk-new|<macro|name|args|<quasi|<new-counter|<merge|code-chunk-|<unquote|<arg|name>>>><new-counter|<merge|code-line-|<unquote|<arg|name>>>><assign|<unquote|<merge|code-item-|<arg|name>>>|<macro|<compound|<unquote|<merge|next-code-line-|<arg|name>>>><render-item|<compound|<unquote|<merge|the-code-line-|<arg|name>>>>>>><compound|<merge|inc-code-chunk-|<unquote|<arg|name>>>><assign|<merge|code-args-|<unquote|<arg|name>>>|<arg|args>>>>>

  <assign|fangle-chunk-init|<macro|name|args|<with|nf-same-chunk|<equal|<value|nf-last-chunk>|<arg|name>>|<if|<not|<provides|<merge|code-chunk-|<unquote|<arg|name>>|-nr>>>|<fangle-chunk-new|<arg|name>|<arg|args>>|<nf-chunk-next|<arg|name>>><nf-chunk-label|<arg|name>><nf-chunk-ref|<arg|name>><assign|nf-continues|<and|<value|nf-same-chunk>|<not|<equal|<number|<the-nf-chunk>|alpha>|a>>>>>>>

  <assign|fangle-render-list|<\macro|body>
    <\padded-normal|<item-vsep>|<item-vsep>>
      <\indent-left|<item-hsep>>
        <surround|<no-page-break*>|<no-indent*>|<arg|body>>
      </indent-left>
    </padded-normal>
  </macro>>

  <assign|fangle-list|<\macro|item-render|item-transform|body>
    <\with|current-item|<arg|item-render>|transform-item|<arg|item-transform>|_item-nr|0>
      <fangle-render-list|<arg|body>>
    </with>
  </macro>>

  <assign|new-fangle|<\macro|name|lang|args>
    <fangle-chunk-init|<arg|name>|<arg|args>><quasi|<style-with|src-compact|none|<assign|<arg|name>|<\macro|body>
      <small|<with|item-vsep|0fn|item-nr|<value|<unquote|<merge|code-line-|<arg|name>|-nr>>>|<fangle-list|<value|nf-render-line-no>|<value|identity>|<prog-f|<unquote|<arg|lang>>|<arg|body>>>>>
    </macro>>><drd-props|<unquote|<arg|name>>|arity|1|accessible|all>>
  </macro>>

  <assign|nf-chunkz|<macro|name|x|lang|args|<with|the-label||xnv-langle-subst||xnv-rangle-subst||nf-name|<unquote|<arg|name>>|y|<value|pob>|<small|<surround|<nf-chunk-init|<arg|name>|<arg|args>><wide-underlined|<nf-border-if|<nf-first-chunklet?|<value|nf-name>>>|1ln|<no-page-break*><label|<arg|name>><small|<nf-header|<arg|name>|<arg|lang>|<arg|args>>><no-page-break>>|<if|<nf-last-chunklet?|<value|nf-name>>|<wide-bothlined|<nf-border-if|<nf-last-chunklet?|<value|nf-name>>>|0ln|1ln|0ln|<htab|5mm*|last>>|<nf-jags>>|<\with|item|<value|<merge|code-item-|<unquote|<arg|name>>>>|item-vsep|0fn|current-item|<value|nf-render-line-no>|transform-item|<value|identity>>
    <\surround||<nf-chunk-outit|<arg|name>><if|<and|<not|<equal|<value|nf-page>|<pagerefpage|<nf-this-chunk-id|<arg|name>|end>>>>|<ispageref?|<nf-this-chunk-id|<arg|name>|end>>>|<nf-use-page-header|<with|nv-langle|<macro|<with|mode|math|<left|langle>>>|nv-rangle|<macro|<with|mode|math|<right|rangle>>>|<small|<nf-header|<arg|name>|<arg|lang>|<arg|args>>>>>>>
      <no-page-break><nf-verbatim-top|<nf-first-chunklet?|<value|nf-name>>>

      <with|nv-langle-subst|\S|nv-rangle-subst|\T|<nf-pf|<value|nf-name>|<arg|lang>|<arg|x>>>

      <no-page-break*><if|<nf-last-chunklet?|<value|nf-name>>|<assign|<merge|code-line-|<value|nf-name>|-nr>|0>><nf-verbatim-bottom|<nf-last-chunklet?|<value|nf-name>>>
    </surround>
  </with>>>>>>
</body>

<\initial>
  <\collection>
    <associate|page-medium|automatic>
    <associate|preamble|true>
  </collection>
</initial>