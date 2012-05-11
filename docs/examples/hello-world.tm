<TeXmacs|1.0.7.10>

<style|<tuple|article|fangle>>

<\body>
  <\hide-preamble>
    <assign|par-first|0fn><assign|par-par-sep|0.5fn>
  </hide-preamble>

  <doc-data|<doc-title|Literate Example>|<doc-author-data|<author-name|Sam
  Liddicott>|<\author-address>
    sam@liddicott.com
  </author-address>>>

  <\abstract>
    <\small>
      This is a simple example of how to use literate programming templates,
      using hello-world.

      Hello-world is a famous <em|first program> with a visible side effect.

      This example produces hello-world in multiple languages.
    </small>
  </abstract>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Hello
    World> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <with|par-left|1.5fn|1.1<space|2spc>In French
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2>>

    <with|par-left|1.5fn|1.2<space|2spc>In German
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3>>
  </table-of-contents>

  <section|Hello World>

  The typical hello world program looks like this:

  <\nf-chunk|hello-world>
    <item>/* The traditional hello-world program in <nf-arg|language>\ 

    <item> * generated using fangle literate programming macros

    <item> */

    <item>

    <item>#include stdio.c

    <item>

    <item>main() {

    <item> \ printf("<nf-arg|message>\\n");

    <item>}
  </nf-chunk||<tuple|message|language>>

  <subsection|In French>

  \;

  We will derive the french hello-world program like this:

  <\nf-chunk|./hello-world.fr.c>
    <item><nf-ref|hello-world|<tuple|Bonjour tout le monde|french>>
  </nf-chunk||>

  <subsection|In German>

  We will derive the german hello-world program like this:

  <\nf-chunk|./hello-world.de.c>
    <item><nf-ref|hello-world|<tuple|Hallo welt|german>>
  </nf-chunk||>
</body>

<\references>
  <\collection>
    <associate||<tuple|?c|?>>
    <associate|./hello-world|<tuple|?a|?>>
    <associate|./hello-world.de.c|<tuple|?b|?>>
    <associate|./hello-world.fr.c|<tuple|?a|?>>
    <associate|.hello-world|<tuple|?a|?>>
    <associate|.hello-world.de.c|<tuple|?b|?>>
    <associate|.hello-world.fr.c|<tuple|?a|?>>
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-2|<tuple|1.1|1>>
    <associate|auto-3|<tuple|1.2|1>>
    <associate|code-end--1|<tuple|?c|?>>
    <associate|code-end-./hello-world-1|<tuple|?a|?>>
    <associate|code-end-./hello-world.de.c-1|<tuple|?b|?>>
    <associate|code-end-./hello-world.fr.c-1|<tuple|?a|?>>
    <associate|code-end-.hello-world-1|<tuple|?a|?>>
    <associate|code-end-.hello-world.de.c-1|<tuple|?b|?>>
    <associate|code-end-.hello-world.fr.c-1|<tuple|?a|?>>
    <associate|code-end-h-1|<tuple|?c|?>>
    <associate|code-end-he-1|<tuple|?c|?>>
    <associate|code-end-hel-1|<tuple|?c|?>>
    <associate|code-end-hell-1|<tuple|?c|?>>
    <associate|code-end-hello--1|<tuple|?c|?>>
    <associate|code-end-hello-1|<tuple|?c|?>>
    <associate|code-end-hello-w-1|<tuple|?c|?>>
    <associate|code-end-hello-wo-1|<tuple|?c|?>>
    <associate|code-end-hello-wor-1|<tuple|?c|?>>
    <associate|code-end-hello-worl-1|<tuple|?c|?>>
    <associate|code-end-hello-world--1|<tuple|?c|?>>
    <associate|code-end-hello-world-1|<tuple|1a|1>>
    <associate|code-end-hello-world-2|<tuple|?c|?>>
    <associate|code-end-hello-world-d-1|<tuple|?c|?>>
    <associate|code-end-hello-world-de-1|<tuple|?c|?>>
    <associate|code-end-hello-world-de.-1|<tuple|?c|?>>
    <associate|code-end-hello-world-de.c-1|<tuple|?c|?>>
    <associate|code-end-hello-world.-1|<tuple|?b|?>>
    <associate|code-end-hello-world.de.c-1|<tuple|1a|1>>
    <associate|code-end-hello-world.f-1|<tuple|?b|?>>
    <associate|code-end-hello-world.fr-1|<tuple|?b|?>>
    <associate|code-end-hello-world.fr.-1|<tuple|?b|?>>
    <associate|code-end-hello-world.fr.c-1|<tuple|1b|1>>
    <associate|code-end-hello-worldde.c-1|<tuple|?c|?>>
    <associate|code-label--1|<tuple|[ 1]|?>>
    <associate|code-label-./hello-world-1|<tuple|[./hello-world 1]|?>>
    <associate|code-label-./hello-world.de.c-1|<tuple|[./hello-world.de.c
    1]|?>>
    <associate|code-label-./hello-world.fr.c-1|<tuple|[./hello-world.fr.c
    1]|?>>
    <associate|code-label-.hello-world-1|<tuple|[.hello-world 1]|?>>
    <associate|code-label-.hello-world.de.c-1|<tuple|[.hello-world.de.c
    1]|?>>
    <associate|code-label-.hello-world.fr.c-1|<tuple|[.hello-world.fr.c
    1]|?>>
    <associate|code-label-h-1|<tuple|[h 1]|?>>
    <associate|code-label-he-1|<tuple|[he 1]|?>>
    <associate|code-label-hel-1|<tuple|[hel 1]|?>>
    <associate|code-label-hell-1|<tuple|[hell 1]|?>>
    <associate|code-label-hello--1|<tuple|[hello- 1]|?>>
    <associate|code-label-hello-1|<tuple|[hello 1]|?>>
    <associate|code-label-hello-w-1|<tuple|[hello-w 1]|?>>
    <associate|code-label-hello-wo-1|<tuple|[hello-wo 1]|?>>
    <associate|code-label-hello-wor-1|<tuple|[hello-wor 1]|?>>
    <associate|code-label-hello-worl-1|<tuple|[hello-worl 1]|?>>
    <associate|code-label-hello-world--1|<tuple|[hello-world- 1]|?>>
    <associate|code-label-hello-world-1|<tuple|[hello-world 1]|1>>
    <associate|code-label-hello-world-2|<tuple|[hello-world 2]|?>>
    <associate|code-label-hello-world-d-1|<tuple|[hello-world-d 1]|?>>
    <associate|code-label-hello-world-de-1|<tuple|[hello-world-de 1]|?>>
    <associate|code-label-hello-world-de.-1|<tuple|[hello-world-de. 1]|?>>
    <associate|code-label-hello-world-de.c-1|<tuple|[hello-world-de.c 1]|?>>
    <associate|code-label-hello-world.-1|<tuple|[hello-world. 1]|?>>
    <associate|code-label-hello-world.de.c-1|<tuple|[hello-world.de.c 1]|1>>
    <associate|code-label-hello-world.f-1|<tuple|[hello-world.f 1]|?>>
    <associate|code-label-hello-world.fr-1|<tuple|[hello-world.fr 1]|?>>
    <associate|code-label-hello-world.fr.-1|<tuple|[hello-world.fr. 1]|?>>
    <associate|code-label-hello-world.fr.c-1|<tuple|[hello-world.fr.c 1]|1>>
    <associate|code-label-hello-worldde.c-1|<tuple|[hello-worldde.c 1]|?>>
    <associate|code-ref--1|<tuple|?c|?>>
    <associate|code-ref-./hello-world-1|<tuple|?a|?>>
    <associate|code-ref-./hello-world.de.c-1|<tuple|?b|?>>
    <associate|code-ref-./hello-world.fr.c-1|<tuple|?a|?>>
    <associate|code-ref-.hello-world-1|<tuple|?a|?>>
    <associate|code-ref-.hello-world.de.c-1|<tuple|?b|?>>
    <associate|code-ref-.hello-world.fr.c-1|<tuple|?a|?>>
    <associate|code-ref-h-1|<tuple|?c|?>>
    <associate|code-ref-he-1|<tuple|?c|?>>
    <associate|code-ref-hel-1|<tuple|?c|?>>
    <associate|code-ref-hell-1|<tuple|?c|?>>
    <associate|code-ref-hello--1|<tuple|?c|?>>
    <associate|code-ref-hello-1|<tuple|?c|?>>
    <associate|code-ref-hello-w-1|<tuple|?c|?>>
    <associate|code-ref-hello-wo-1|<tuple|?c|?>>
    <associate|code-ref-hello-wor-1|<tuple|?c|?>>
    <associate|code-ref-hello-worl-1|<tuple|?c|?>>
    <associate|code-ref-hello-world--1|<tuple|?c|?>>
    <associate|code-ref-hello-world-1|<tuple|1a|1>>
    <associate|code-ref-hello-world-2|<tuple|?c|?>>
    <associate|code-ref-hello-world-d-1|<tuple|?c|?>>
    <associate|code-ref-hello-world-de-1|<tuple|?c|?>>
    <associate|code-ref-hello-world-de.-1|<tuple|?c|?>>
    <associate|code-ref-hello-world-de.c-1|<tuple|?c|?>>
    <associate|code-ref-hello-world.-1|<tuple|?b|?>>
    <associate|code-ref-hello-world.de.c-1|<tuple|1a|1>>
    <associate|code-ref-hello-world.f-1|<tuple|?b|?>>
    <associate|code-ref-hello-world.fr-1|<tuple|?b|?>>
    <associate|code-ref-hello-world.fr.-1|<tuple|?b|?>>
    <associate|code-ref-hello-world.fr.c-1|<tuple|1b|1>>
    <associate|code-ref-hello-worldde.c-1|<tuple|?c|?>>
    <associate|h|<tuple|?c|?>>
    <associate|he|<tuple|?c|?>>
    <associate|hel|<tuple|?c|?>>
    <associate|hell|<tuple|?c|?>>
    <associate|hello|<tuple|?c|?>>
    <associate|hello-|<tuple|?c|?>>
    <associate|hello-w|<tuple|?c|?>>
    <associate|hello-wo|<tuple|?c|?>>
    <associate|hello-wor|<tuple|?c|?>>
    <associate|hello-worl|<tuple|?c|?>>
    <associate|hello-world|<tuple|1a|1>>
    <associate|hello-world-|<tuple|?c|?>>
    <associate|hello-world-d|<tuple|?c|?>>
    <associate|hello-world-de|<tuple|?c|?>>
    <associate|hello-world-de.|<tuple|?c|?>>
    <associate|hello-world-de.c|<tuple|?c|?>>
    <associate|hello-world.|<tuple|?b|?>>
    <associate|hello-world.de.c|<tuple|1a|1>>
    <associate|hello-world.f|<tuple|?b|?>>
    <associate|hello-world.fr|<tuple|?b|?>>
    <associate|hello-world.fr.|<tuple|?b|?>>
    <associate|hello-world.fr.c|<tuple|1b|1>>
    <associate|hello-worldde.c|<tuple|?c|?>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Hello
      World> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <with|par-left|<quote|1.5fn>|1.1<space|2spc>In French
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>

      <with|par-left|<quote|1.5fn>|1.2<space|2spc>In German
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>
    </associate>
  </collection>
</auxiliary>