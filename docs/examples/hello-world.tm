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
</references>

<\auxiliary>
</auxiliary>