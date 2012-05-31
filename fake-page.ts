<TeXmacs|1.0.7.15>

<style|<tuple|source|std-utils|tmdoc-markup>>

<\body>
  <\active*>
    <\src-title>
      <src-style-file|fake-page|0.5>

      <\src-purpose>
        Presenting fake pages to aid the demonstration of document creation,
        with convenient isolation of page numbers, references, links etc.
      </src-purpose>

      <\src-copyright|2012>
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

  <active*|<assign|ignore|<macro|x|>>>

  <if|<not|<provides|show-active>>|<assign|show-active|<macro|x|<surround|<arg|x>||<rewrite-inactive|<arg|x>|>>>>><active*|<active*|<assign|show-active|<macro|x|<surround|<arg|x>||<rewrite-inactive|<arg|x>|>>>>>>

  Sometimes when explaining the use of sophisticated <active*|<TeXmacs>>
  style sheets it is helpful to lead the reader through the development of an
  example document that makes use of that style sheet.

  Rather than merely instruct the reader in the creation of the example
  document, it can be helpful to show the state of the example document as it
  would appear at the different stages during development.

  To visually distinguish the sample page from the explanation, it might be
  rendered in an ornamented border.

  <active*|<show-active|<assign|render-simple-fake-page|<macro|x|<with|ornament-color|#eeeeee|ornament-sunny-color|#000000|ornament-shadow-color|#000000|ornament-borderx|2l|ornament-hpadding|2ex|ornament-vpadding|2ex|<ornament|<surround||<htab|0spc>|<indent-both|1cm|1cm|<arg|x>>>>>>>>>

  \;

  <\active*>
    <\render-simple-fake-page>
      Example fake page

      Should be able to contain all normal page elements, etc...
    </render-simple-fake-page>
  </active*>

  \;

  The fake page might also have a fake caret, or text insertion point, so
  that this may be represented. This fake caret is calculated according to
  the current font size and unlike the real cared, it does not change size
  according to the height of the character that preceded it.

  <show-active|<assign|fake-caret|<macro|<space|0.5spc><with|gr-mode|<tuple|edit|line>|gr-frame|<tuple|scale|1fs|<tuple|0.5gw|0.5gh>>|gr-geometry|<tuple|geometry|3ln|1.5ex|bottom>|gr-color|red|gr-auto-crop|false|<graphics||<with|color|red|<line|<point|0gw|1ln>|<point|1gw|1ln>>>|<with|color|red|<line|<point|0.5gw|1ln>|<point|0.5gw|1gh>>>|<with|color|red|<line|<point|0gw|1gh>|<point|1gw|1gh>>>>><space|0.5spc>>>>

  <\active*>
    <\render-simple-fake-page>
      Example fake page with the fake caret<fake-caret>

      The fake caret can be troublesome when passed as an argument to some
      macros.
    </render-simple-fake-page>
  </active*>

  A difficulty arises, however, which is that the fake pages share the same
  environment with each-other and with the main document.

  How would it look if repeated section headings from revisions of fake pages
  appeared in the real table of contents? Further revisions of the same fake
  page might conflict labels, references, section numbers and other counters,
  with each-other, and with the main document.\ 

  We might enclose the fake page in a with block
  <inactive*|<with|...|...|<fake-page|...>>> shadowing most global variables,
  so that the fake page had it's own environment.\ 

  Consider also that a fake page might be broken into annotaed fragments that
  share the same private environment, so that a second fragment of a fake
  page might demonstrate a new section, which should be numbered as following
  on from the section in the previous fragment, like this (we use a fake page
  to enclose the example document that contains two fake pages):

  <\active*>
    <\render-simple-fake-page>
      The first section would look like this

      <\render-simple-fake-page>
        Section 1. Example fake page

        ...
      </render-simple-fake-page>

      and so, blah blah...

      <\render-simple-fake-page>
        Section 2. Using closures

        ...
      </render-simple-fake-page>
    </render-simple-fake-page>
  </active*>

  \;

  This requires that the state of the environment, counters, labels, etc, be
  preserved and restored at the start of the following fragment of the same
  fake-page.

  We therefore require a form of closure that preserves essential variables
  and allows continuation macros to be invoked in that saved context.

  Closures

  An enclosed macro would be of this form, invoking <src-arg|x> within the
  defined environment:

  <style-only*|<inactive*|<macro|x|<with|...|...|<arg|x>>>>>

  so we need to emit such a macro where ... are filled in with the closed
  values; e.g.

  <style-only*|<inactive*|<macro|x|<with|a|AHA|<arg|x>>>>>

  So the constructing macro will be an xmacro, taking a list like
  <style-only*|<inactive*|<with|...|...|...>>> does, from which it will
  construct the <src-macro|with> statement.

  <show-active|<assign|make-enclosure|<xmacro|w|<quasiquote|<macro|x|<with|<unquote*|<quote-arg|w>>|<arg|x>>>>>>>

  But it would be simpler to just to specify the names of the variables to
  preserve, and have their values looked up automatically instead of having
  to specify the values too. So we need to be able to generate a
  <style-only*|<inactive*|<with|var|val|...>>> style list from just a list of
  variable names.

  This macro converts a variable name into a tuple of the name and it's
  value.

  <show-active|<assign|enclose-single|<macro|x|<tuple|<arg|x>|<value|<arg|x>>>>>>

  Many of these pair-tuples could \ be merged into a single long tuple and
  then <src-macro|unquote*>'d with <src-arg|x>, as arguments for
  <src-macro|make-enclosure>

  <show-active|<assign|enclose|<xmacro|x|<quasi|<make-enclosure|<unquote*|<map-args|enclose-single|merge|x>>>>>>>

  We can demonstrate the value of the closure here, by assigning a value to
  <src-var|message>:

  <show-active|<assign|message|hello>>

  We then create a closure called <src-var|saved-message>

  <show-active|<assign|saved-message|<enclose|message>>>

  If we then update message to something else, like this,
  <show-active|<assign|message|missed>>, we can then use the closure to emit
  the saved value:

  <show-active|<saved-message|Hello there: <value|message>>>

  It should be clear then, that as long as a list of variables to be saved is
  ready at the end of the fake page, a closure may be created which could be
  used to restore the environment at the start of a subsequent fragment.

  Such variables would include <src-var|page-nr>, <src-var|item-nr> and
  <src-var|the-label>. These values would also want initialising for the
  first fake-page fragment, so it becomes clear that a default closure need
  to be established as the basis for each new fake-page.

  Other <TeXmacs> packages may introduce further variables that need
  enclosing for the fake page.

  Therefore we introduce a mechanism so that such enclosed variables may be
  declared as such pages are used.\ 

  Simple Way

  <src-var|fake-page-defaults> will hold a list of variable names, usually
  one per package. Each variable will hold a tuple of variable names and
  default values.

  As some of those packages may get initialised before the fake page package,
  we need a way for them to register these values that can be picked up
  later. We can't define a macro to help with this, as the fake page package
  might not be loaded at that time.

  A package would declare it's closure variables by storing their names and
  values in a tuple. For instance, the widget package might do this:

  <inactive*|<assign|enclose-widget|<tuple|widget-nr|<value|widget-nr>|widget-states|<value|widget-states>>>>

  The name of this list is added to the list of names --- we add the name of
  the variable (enclose-widget) containing the enclosed variables, not it's
  value (<src-var|enclose-wudget>)<compound|src-value|>.

  <inactive*|<assign|enclose-defaults|<merge|<if|<provides|enclose-defaults>|<value|enclose-defaults>|<tuple|>>|<tuple|enclose-widget>>>>

  It's a bit clumsy, but <src-macro|merge> fails when invoked on the value of
  an undefined variable.

  Advanced Way

  Each package registers a callback that will be invoked when the fake-page
  package loads.

  The widget would define it's callback like this:

  <inactive*|<assign|fake-page-init-widget|<macro|version|<fake-page-init|widget|<tuple|widget-nr|widget-states>>>>>

  And invoke the callback if fake page has already loaded, otherwise register
  the callback in <src-value|fake-page-init-> so that the fake page package
  will invoke it later:

  <inactive*|<if|<provides|fake-page-version>|<fake-page-init-widget|<value|fake-page-version>>|<assign|fake-page-init-|<merge|<if|<provides|fake-page-init->|<value|fake-page-init->|<tuple|>>|<tuple|fake-page-init->>>>>

  Bugs

  If a fake page fragment were to terminate part way through a nested enum,
  the nested structure could not be re-created by means of the closure. Each
  fragment has to be fully normal, with all open tags closed at the end of
  the fake page chunk. This type of fragment could be permitted if the entire
  fake page were present within each fragment but with rendering disabled
  except between certain checkpoints, but at present I have no mechanism to
  divert rendering to a null device which can also cross document tag
  structure --- i.e. comment rendering after a section heading and halt
  rendering halfway through an enum nest.

  References

  Variables are not the only items that need isolating, references create
  entries in the document aux section. Two stages of revision of the same
  fake page might re-define the same labels. Clearly some further isolation
  is needed so that references in one fake page revision to not refer to
  labels in subsequent revisions of the same page.

  Each fake page needs to be uniquely defined, so that it's closure
  preserving the final values can be named. This definition can be used to
  prefix labels and references, as we re-define <src-macro|label>,
  <src-macro|reference>, etc, to use the fake page identifier as a prefix.

  We will call this prefix <src-var|fake-page-base-name> and it will be part
  of the closure. An initial empty value is defined here:
  <show-active|<assign|fake-page-base-name|>>

  Thus we can override the <src-macro|label> macro within the fake page like
  this:

  <show-active|<assign|fake-page-label|<macro|x|<with|the-label|<tuple|<value|the-label>|<value|page-no>>|<quasi|<old-label|<unquote|<fake-page-make-new-label|<arg|x>>>>>>>>>

  We have overridden <src-var|the-label> be a tuple of the original
  <src-var|the-label> and <src-var|page-no>. This is because we need to be
  able to recover the fake page number later, but <TeXmacs> will insert the
  real page number during pagination.

  After faking <src-var|the-label> we then fake the label name with
  <src-macro|fake-page-make-new-label> which prefixes the label name with our
  fake page base name.

  <show-active|<assign|fake-page-make-new-label|<macro|x|<merge|<value|fake-page-base-name>|-|<arg|x>>>>>

  Of course, now we have "fixed" the <src-macro|label> macro, we need to fix
  the <src-macro|reference> macro to match.

  BUG: Normally <src-macro|reference> will emit a locus whose displayed value
  is the original value of <src-var|the-label> and whose action navigates to
  that location. We stored the original <src-var|the-label> as the first
  member of a tuple. Thus we show the correct label text --- which is good
  for type-setting, but this is not yet active as a link.

  <show-active|<assign|fake-page-reference|<macro|x|<quasi|<with|b|<get-binding|<unquote|<fake-page-make-new-label|<arg|x>>>|0>|<compound|look-up-default|<value|b>|0|<uninit>>>>>>>

  We use a tuple helper macro <src-macro|look-up-default> to return the first
  tuple member, or if that fails, to return uninit rather than an error.

  <show-active|<assign|look-up-default|<macro|x|i|o|<if|<and|<equal|<get-label|<arg|x>>|tuple>|<greater|<length|<arg|x>>|<arg|i>>>|<look-up|<arg|x>|<arg|i>>|<arg|o>>>>>

  Fake page hierachy

  As a fake page is used in document development, there is a hierachy of
  relationships between revisions and chunks.

  Typically the example document will be developed in parts, and each part
  will undergo revisions. In the diagram shown, only the outlined elements
  represent fake pages, the other elements are just to help label the
  hierachy of closure inheritance.

  <tree|Tutorial 1 |<tree|Part 1|<tree|<render-simple-fake-page|Revision
  1>|>|<tree|<render-simple-fake-page|Revision
  2>|>|<tree|<render-simple-fake-page|Revision 3>|<tree|Part
  2|<tree|<render-simple-fake-page|Revision
  1>|>|<tree|<render-simple-fake-page|Revision
  2>|>|<tree|<render-simple-fake-page|Revision
  3>|>>>|<tree|<render-simple-fake-page|Revision 4>|<tree|Part
  2|<tree|<render-simple-fake-page|Revision 4>|>>>>>

  Once a part is completed with it's final revision, it will serve as the
  basis for the next part which will inherit it's labels and counters. Of
  course any revision of any part could serve as the basis for another part,
  and in some cases a further revision of Part 1 may be shown, perhaps
  followed by further revisions of further parts.

  A fake page is emitted with the tag: <inactive*|<new-fake-page|from-name|new-name|...>>

  The first argument is the name of the fake page to continue from, but can
  be empty --- meaning the default closure. The second arument is the name
  given to this fake page, which is important if a further page would
  continue from this page. Any remaining argument pairs are like the pairs of
  a <src-macro|with> clause with the final argument being the page contents.

  As a convenience a new revision can be emitted with:
  <inactive*|<revise-fake-page|from-name|new-name|...>>

  This is like <src-macro|new-fake-page> except instead of continuing from
  <src-var|from-name> it continues from what <src-var|from-name> continued
  from, thus it is a replacement.

  Thus, to contrive the relationships shown in the diagram, these macros
  would have been executed in this order:\ 

  <\inactive*>
    <new-fake-page||part-1-revision-1|...>

    <revise-fake-page|part-1-revision-1|part-1-revision-2|...>

    <revise-fake-page|part-1-revision-1|part-1-revision-3|...>

    <new-fake-page|part-1-revision-3|part-2-revision-1|...>

    <revise-fake-page|part-2-revision-1|part-2-revision-2|...>

    <revise-fake-page|part-2-revision-1|part-2-revision-3|...>

    <revise-fake-page|part-1-revision-1|part-1-revision-4|...>

    <new-fake-page|part-1-revision-4|part-2-revision-4|...>
  </inactive*>

  Of course you could re-use the <src-var|old-name> as the
  <src-var|new-name>, though this would make it impossible to reference the
  <src-var|old-name> in any way.

  \;

  \;

  \;

  \;

  \;

  \;

  \;

  \;

  \;

  <assign|default-to|<macro|x|d|<if|<or|<equal|<get-label|<arg|x>>|error>|<equal|<uninit>|<arg|x>>>|<arg|d>|<arg|x>>>>

  \;

  <assign|fake-page-environment|<macro|x|<with|old-label|<value|label>|label|<value|fake-page-label>|pagerefpage|<value|fake-page-pagerefpage>|old-reference|<value|reference>|reference|<value|fake-page-reference>|this-page-no|<macro|<value|page-no>>|<arg|x>>>>

  <assign|render-fake-page|<macro|x|<render-simple-fake-page|<arg|x>>>>

  <assign|fake-page|<macro|content|doc|page-no|instance|<with|doc|<default-to|<arg|doc>|>|page-no|<default-to|<arg|page-no>|0>|instance|<init-or|<arg|instance>|0>|fake-page-base-name|<merge|fake-page-|<arg|doc>|-|<arg|page-no>|-|<arg|instance>>|<render-fake-page|<surround|<new-counter|<nf-id|nf-chunk>>||<fake-page-environment|<arg|content>>>>>>>

  <assign|this-page-no|<macro|<auto-label><get-binding|<the-auto>|1>>>

  \;

  \;
</body>

<\initial>
  <\collection>
    <associate|preamble|false>
  </collection>
</initial>