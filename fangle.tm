<TeXmacs|1.0.7.4>

<style|<tuple|book|newfangle>>

<\body>
  <hide-preamble|<assign|LyX|<macro|L<space|-0.1667em><move|Y|0fn|-0.25em><space|-0.125em>X>><assign|par-first|0fn><assign|par-par-sep|0.5fn>>

  <doc-data|<doc-title|newfangle>|<doc-author-data|<author-name|Sam
  Liddicott>|<\author-address>
    sam@liddicott.com
  </author-address>>|<doc-date|August 2009>>

  <section*|Introduction>

  <name|Newfangle> is a tool for newfangled literate programming. Newfangled
  is defined as <em|New and often needlessly novel> by
  <name|TheFreeDictionary.com>.

  In this case, newfangled means yet another new<footnote|and improved.>
  method for literate programming.

  <name|Literate Programming> has a long history starting with the great
  <name|Donald Knuth> himself, whose literate programming tools seem to make
  use of as many escape sequences for semantic markup as <TeX> (also by
  <name|Donald Knuth>).

  <name|Norman Ramsey> wrote the <name|Noweb> set of tools
  (<verbatim|notangle>, <verbatim|noweave> and <verbatim|noroots>) and
  helpfully reduced the amount of magic character sequences to pretty much
  just <verbatim|\<less\>\<less\>>, <verbatim|\<gtr\>\<gtr\>> and
  <verbatim|@>, and in doing so brought the wonders of literate programming
  within my reach.

  While using the <LyX> editor for <LaTeX> editing I had various troubles
  with the noweb tools, some of which were my fault, some of which were
  noweb's fault and some of which were <LyX>'s fault.

  <name|Noweb> generally brought literate programming to the masses through
  removing some of the complexity of the original literate programming, but
  this would be of no advantage to me if the <LyX> / <LaTeX> combination
  brought more complications in their place.

  <name|Newfangle> was thus born --- as an awk replacement for notangle,
  adding some important features, like better integration with <LyX> and
  <LaTeX> (and later <TeXmacs>), multiple output format conversions, and
  fixing notangle bugs like indentation when using -L for line numbers.

  Significantly, newfangle is just one program which replaces various
  programs in <name|Noweb>. Noweave is done away with and implemented
  directly as <LaTeX> macros, and noroots is implemented as a function of the
  untangler newfangle.

  Newfangle is written in awk for portability reasons, awk being available
  for most platforms. A Python version<\footnote>
    hasn't anyone implemented awk in python yet?
  </footnote> was considered for the benefit of <LyX> but a scheme version
  for <TeXmacs> will probably materialise first; as <TeXmacs> macro
  capabilities help make edit-time and format-time rendering of newfangle
  chunks simple enough for my weak brain.

  As an extension to many literate-programming styles, Newfangle permits code
  chunks to take parameters and thus operate somewhat like C pre-processor
  macros, or like C++ templates. Name parameters (or even local
  <em|variables> in the callers scope) are anticipated, as parameterized
  chunks <emdash> useful though they are <emdash> are hard to comprehend in
  the literate document.

  <section*|<new-page*>License><label|License>

  Newfangle is licensed under the GPL 3 (or later).

  This doesn't mean that you can't use or distribute newfangle with sources
  of an incompatible license, but it means you must make the source of
  newfangle available too.

  As newfangle is currently written in awk, an interpreted language, this
  should not be too hard.

  <\nf-chunk|gpl3-copyright>
    newfangle - fully featured notangle replacement in awk

    \;

    Copyright (C) 2009-2010 Sam Liddicott \<less\>sam@liddicott.com\<gtr\>

    \;

    This program is free software: you can redistribute it and/or modify

    it under the terms of the GNU General Public License as published by

    the Free Software Foundation, either version 3 of the License, or

    (at your option) any later version.

    \;

    This program is distributed in the hope that it will be useful,

    but WITHOUT ANY WARRANTY; without even the implied warranty of

    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. \ See the

    GNU General Public License for more details.

    \;

    You should have received a copy of the GNU General Public License

    along with this program. \ If not, see
    \<less\>http://www.gnu.org/licenses/\<gtr\>.
  </nf-chunk|text|>

  <\table-of-contents|toc>
    Introduction <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1>

    <new-page*>License <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2>

    <vspace*|2fn><with|font-series|bold|math-font-series|bold|font-size|1.19|I<space|2spc>Using
    Newfangle> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3><vspace|1fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Introduction
    to Literate Programming> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Running
    Newfangle> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5><vspace|0.5fn>

    2.1<space|2spc>Listing roots <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6>

    2.2<space|2spc>Extracting roots <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7>

    2.3<space|2spc>Formatting the document
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-8>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>Using
    Newfangle with L<rsup|<space|-0.8spc><move|A|0fn|-0.1fn>><space|-0.2spc>T<rsub|<space|-0.4spc><move|<resize|<with|math-level|0|E>||||0.5fn|>|0fn|-0.1fn>><space|-0.4spc>X>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-9><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>Using
    Newfangle with L<space|-0.1667em><move|Y|0fn|-0.25em><space|-0.125em>X>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-10><vspace|0.5fn>

    4.1<space|2spc>Installing the L<space|-0.1667em><move|Y|0fn|-0.25em><space|-0.125em>X
    module <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-11>

    4.2<space|2spc>Obtaining a decent mono font
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-12>

    <with|par-left|1.5fn|4.2.1<space|2spc>txfonts
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-13>>

    <with|par-left|1.5fn|4.2.2<space|2spc>ams pmb
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-14>>

    <with|par-left|1.5fn|4.2.3<space|2spc>Luximono
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-15>>

    4.3<space|2spc>Formatting your Lyx document
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-16>

    <with|par-left|1.5fn|4.3.1<space|2spc>Customising the listing appearance
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-17>>

    <with|par-left|1.5fn|4.3.2<space|2spc>Global customisations
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-18>>

    4.4<space|2spc>Configuring the build script
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-19>

    <with|par-left|1.5fn|4.4.1<space|2spc>...
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-20>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|5<space|2spc>Using
    Newfangle with T<rsub|<space|-0.4spc><move|<resize|<with|math-level|0|E>||||0.5fn|>|0fn|-0.1fn>><space|-0.4spc>X<rsub|<space|-0.4spc><move|<resize|M<space|-0.2spc>A<space|-0.4spc>CS||||0.5fn|>|0fn|-0.1fn>>>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-21><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|6<space|2spc>Newfangle
    with Makefiles> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-22><vspace|0.5fn>

    6.1<space|2spc>A word about makefiles formats
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-23>

    6.2<space|2spc>Extracting Sources <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-24>

    <with|par-left|1.5fn|6.2.1<space|2spc>Converting from
    L<space|-0.1667em><move|Y|0fn|-0.25em><space|-0.125em>X to
    L<rsup|<space|-0.8spc><move|A|0fn|-0.1fn>><space|-0.2spc>T<rsub|<space|-0.4spc><move|<resize|<with|math-level|0|E>||||0.5fn|>|0fn|-0.1fn>><space|-0.4spc>X
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-25>>

    <with|par-left|1.5fn|6.2.2<space|2spc>Converting from
    T<rsub|<space|-0.4spc><move|<resize|<with|math-level|0|E>||||0.5fn|>|0fn|-0.1fn>><space|-0.4spc>X<rsub|<space|-0.4spc><move|<resize|M<space|-0.2spc>A<space|-0.4spc>CS||||0.5fn|>|0fn|-0.1fn>>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-26>>

    <with|par-left|1.5fn|6.2.3<space|2spc>Extracting Program Source
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-27>>

    <with|par-left|1.5fn|6.2.4<space|2spc>Extracting C sources
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-28>>

    <with|par-left|1.5fn|6.2.5<space|2spc>Extracting Documentation
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-29>>

    <with|par-left|3fn|6.2.5.1<space|2spc>Running pdflatex
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-30>>

    <with|par-left|3fn|6.2.5.2<space|2spc>The docs as a whole
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-31>>

    <with|par-left|1.5fn|6.2.6<space|2spc>Other helpers
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-32>>

    6.3<space|2spc>Boot-strapping the extraction
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-33>

    6.4<space|2spc>Using Makefile.inc into existing projects
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-34>

    <with|par-left|6fn|Example <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-35><vspace|0.15fn>>

    <vspace*|2fn><with|font-series|bold|math-font-series|bold|font-size|1.19|II<space|2spc>Source
    Code> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-36><vspace|1fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|7<space|2spc>Newfangle
    awk source code> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-37><vspace|0.5fn>

    7.1<space|2spc>AWK tricks <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-38>

    7.2<space|2spc>Catching errors <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-39>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|8<space|2spc>lstlistings>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-40><vspace|0.5fn>

    8.1<space|2spc>Additional lstlstings parameters
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-41>

    8.2<space|2spc>Parsing chunk arguments
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-42>

    8.3<space|2spc>Expanding parameters in the text
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-43>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|9<space|2spc>Language
    Modes & Quoting> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-44><vspace|0.5fn>

    9.1<space|2spc>Modes <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-45>

    <with|par-left|1.5fn|9.1.1<space|2spc>Modes to keep code together
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-46>>

    <with|par-left|1.5fn|9.1.2<space|2spc>Modes to included chunks
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-47>>

    9.2<space|2spc>Language Mode Definitions
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-48>

    <with|par-left|1.5fn|9.2.1<space|2spc>Backslash
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-49>>

    <with|par-left|1.5fn|9.2.2<space|2spc>Strings
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-50>>

    <with|par-left|1.5fn|9.2.3<space|2spc>Parentheses, Braces and Brackets
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-51>>

    <with|par-left|1.5fn|9.2.4<space|2spc>Customizing Standard Modes
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-52>>

    <with|par-left|1.5fn|9.2.5<space|2spc>Comments
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-53>>

    <with|par-left|1.5fn|9.2.6<space|2spc>Regex
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-54>>

    <with|par-left|1.5fn|9.2.7<space|2spc>Perl
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-55>>

    <with|par-left|1.5fn|9.2.8<space|2spc>sh
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-56>>

    9.3<space|2spc>Some tests <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-57>

    9.4<space|2spc>A non-recursive mode tracker
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-58>

    <with|par-left|1.5fn|9.4.1<space|2spc>Constructor
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-59>>

    <with|par-left|1.5fn|9.4.2<space|2spc>Management
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-60>>

    <with|par-left|1.5fn|9.4.3<space|2spc>Tracker
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-61>>

    <with|par-left|3fn|9.4.3.1<space|2spc>One happy chunk
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-62>>

    <with|par-left|3fn|9.4.3.2<space|2spc>Tests
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-63>>

    9.5<space|2spc>Escaping and Quoting <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-64>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|10<space|2spc>Recognizing
    Chunks> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-65><vspace|0.5fn>

    10.1<space|2spc>Chunk start <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-66>

    <with|par-left|1.5fn|10.1.1<space|2spc>lstlistings
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-67>>

    <with|par-left|1.5fn|10.1.2<space|2spc>Noweb
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-68>>

    10.2<space|2spc>Chunk end <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-69>

    <with|par-left|1.5fn|10.2.1<space|2spc>lstlistings
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-70>>

    <with|par-left|1.5fn|10.2.2<space|2spc>noweb
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-71>>

    10.3<space|2spc>Chunk contents <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-72>

    <with|par-left|1.5fn|10.3.1<space|2spc>lstlistings
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-73>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|11<space|2spc>Processing
    Options> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-74><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|12<space|2spc>Generating
    the Output> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-75><vspace|0.5fn>

    12.1<space|2spc>Assembling the Chunks
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-76>

    <with|par-left|1.5fn|12.1.1<space|2spc>Chunk Parts
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-77>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|13<space|2spc>Storing
    Chunks> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-78><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|14<space|2spc>getopt>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-79><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|15<space|2spc>Newfangle
    LaTeX source code> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-80><vspace|0.5fn>

    15.1<space|2spc>newfangle module <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-81>

    <with|par-left|1.5fn|15.1.1<space|2spc>The Chunk style
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-82>>

    <with|par-left|1.5fn|15.1.2<space|2spc>The chunkref style
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-83>>

    15.2<space|2spc>Latex Macros <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-84>

    <with|par-left|1.5fn|15.2.1<space|2spc>The chunk command
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-85>>

    <with|par-left|3fn|15.2.1.1<space|2spc>Chunk parameters
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-86>>

    <with|par-left|1.5fn|15.2.2<space|2spc>The noweb styled caption
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-87>>

    <with|par-left|1.5fn|15.2.3<space|2spc>The chunk counter
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-89>>

    <with|par-left|1.5fn|15.2.4<space|2spc>Cross references
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-90>>

    <with|par-left|1.5fn|15.2.5<space|2spc>The end
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-91>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|16<space|2spc>Extracting
    newfangle> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-92><vspace|0.5fn>

    16.1<space|2spc>Extracting from Lyx <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-93>

    16.2<space|2spc>Extracting documentation
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-94>

    16.3<space|2spc>Extracting from the command line
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-95>

    16.4<space|2spc>Testing <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-96>

    <vspace*|2fn><with|font-series|bold|math-font-series|bold|font-size|1.19|III<space|2spc>Tests>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-97><vspace|1fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|17<space|2spc>Chunk
    Parameters> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-98><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|18<space|2spc>Compile-log-lyx>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-99><vspace|0.5fn>
  </table-of-contents>

  <part|Using Newfangle>

  <chapter|Introduction to Literate Programming>

  Todo: Should really follow on from a part-0 explanation of what literate
  programming is.

  <chapter|Running Newfangle>

  Newfangle is a replacement for <name|noweb>, which consists of
  <verbatim|notangle>, <verbatim|noroots> and <verbatim|noweave>.

  Like <verbatim|notangle> and <verbatim|noroots>, <verbatim|newfangle> can
  read multiple named files, or from stdin.

  <section|Listing roots>

  The -r option causes newfangle to behave like noroots.

  <code*|newfangle -r filename.tex>

  will print out the newfangle roots of a tex file.\ 

  Unlike the <verbatim|noroots> command, the roots are not enclosed in
  <verbatim|\<less\>\<less\>name\<gtr\>\<gtr\>>, unless at least one of the
  roots is defined using the <verbatim|notangle> notation
  <verbatim|\<less\>\<less\>name\<gtr\>\<gtr\>=>.

  Also, unlike noroots, it prints out all roots --- not just those that are
  not used elsewhere. I find that a root not being used doesn't make it
  particularly top level <emdash> and so-called top level roots could also be
  included in another root as well.\ 

  My convention is that top level roots to be extracted begin with
  <verbatim|./> and have the form of a filename.

  Makefile.inc, discussed in <reference|makefile.inc>, can automatically
  extract all such sources prefixed with <verbatim|./>

  <section|Extracting roots>

  notangle's <verbatim|-R> and <verbatim|-L> options are supported.

  The standard way to extract a file would be:

  <verbatim|newfangle -R./Makefile.inc newfangle.tex \<gtr\> ./Makefile.inc>

  Unlike the <verbatim|noroots> command, the <verbatim|<verbatim|-L>> option
  does not break indenting.

  Also, thanks to mode tracking (described in <reference|modes>) the
  <verbatim|-L> option does not interrupt (and break) multi-line C macros
  either.

  This does mean that sometimes the compiler might calculate the source line
  wrongly when generating error messages in such cases, but there isn't any
  other way around if multi-line macros include other chunks.

  <section|Formatting the document>

  The noweave replacement built into the editing and formatting environment
  for <TeXmacs>, <LyX> (which uses <LaTeX>), and even for raw <LaTeX>.

  Use of newfangle with <TeXmacs>, <LyX> and <LaTeX> are explained the the
  next few chapters.

  <chapter|Using Newfangle with <LaTeX>>

  Because the noweave replacement is impemented in <LaTeX>, there is no
  processing stage required before running the <LaTeX> command. <LaTeX> may
  need running two or more times, so that the code chunk references can be
  fully calculated.

  The formatting is managed by a set of macros shown in
  <reference|latex-source>, and can be included with:

  <verbatim|\\usepackage{newfangle.sty}>

  Norman Ramsay's origial <filename|noweb.sty> package is required as it is
  used for formatting the code chunk captions.

  The <filename|listings.sty> package is required, and is used for formatting
  the code chunks and syntax highlighting.

  The <filename|xargs.sty> package is also required, and makes writing
  <LaTeX> macro so much more pleasant.

  <todo|Add examples of use of Macros>

  <chapter|Using Newfangle with <LyX>>

  <LyX> uses the same <LaTeX> macros shown in <reference|latex-source> as
  part of a <LyX> module file <filename|newfangle.module>, which
  automatically includes the macros in the document pre-amble provided that
  the newfangle <LyX> module is used in the document.

  <section|Installing the <LyX> module>

  Copy <filename|newfangle.module> to your <LyX> layouts directory, which for
  unix users will be <filename|~/.lyx/layouts>

  In order to make the new literate styles availalble, you will need to
  reconfigure <LyX> by clicking Tools-\<gtr\>Reconfigure, and then re-start
  <LyX>.

  <section|Obtaining a decent mono font>

  The syntax high-lighting features of <name|lstlistings> makes use of bold;
  however a mono-space tt font is used to typeset the listings. Obtaining a
  <with|font-family|tt|<strong|bold> tt font> can be impossibly difficult and
  amazingly easy. I spent many hours at it, following complicated
  instructions from those who had spend many hours over it, and was finally
  delivered the simple solution on the lyx mailing list.

  <subsection|txfonts>

  The simple way was to add this to my preamble:

  <\verbatim>
    \\usepackage{txfonts}

    \\renewcommand{\\ttdefault}{txtt}
  </verbatim>

  \;

  <subsection|ams pmb>

  The next simplest way was to use ams poor-mans-bold, by adding this to the
  pre-amble:

  <\verbatim>
    \\usepackage{amsbsy}

    %\\renewcommand{\\ttdefault}{txtt}

    %somehow make \\pmb be the command for bold, forgot how, sorry, above
    line not work
  </verbatim>

  It works, but looks wretched on the dvi viewer.

  <subsection|Luximono>

  The lstlistings documention suggests using Luximono.

  Luximono was installed according to the instructions in Ubuntu Forums
  thread 1159181<\footnote>
    http://ubuntuforums.org/showthread.php?t=1159181
  </footnote> with tips from miknight<\footnote>
    http://miknight.blogspot.com/2005/11/how-to-install-luxi-mono-font-in.html
  </footnote> stating that <verbatim|sudo updmap --enable MixedMap ul9.map>
  is required. It looks fine in PDF and PS view but still looks rotten in dvi
  view.

  <section|Formatting your Lyx document>

  It is not necessary to base your literate document on any of the original
  <LyX> literate classes; so select a regular class for your document type.

  Add the new module <em|Newfangle Literate Listings> and also <em|Logical
  Markup> which is very useful.

  In the drop-down style listbox you should notice a new style defined,
  called <em|Chunk>.

  When you wish to insert a literate chunk, you enter it's plain name in the
  Chunk style, instead of the old <name|noweb> method that uses
  <verbatim|\<less\>\<less\>name\<gtr\>\<gtr\>=> type tags. In the line (or
  paragraph) following the chunk name, you insert a listing with:
  Insert-\<gtr\>Program Listing.

  Inside the white listing box you can type (or paste using
  <kbd|shift+ctrl+V>) your listing. There is not need to use <kbd|ctrl+enter>
  at the end of lines as with some older <LyX> literate techniques --- just
  press enter as normal.

  <subsection|Customising the listing appearance>

  Th code is formatted using the <name|lstlistings> package. The chunk style
  doesn't just define the chunk name, but can also define any other chunk
  options supported by the lstlistings package <verbatim|\\lstset> command.
  In fact, what you type in the chunk style is raw latex. If you want to set
  the chunk language without having to right-click the listing, just add
  <verbatim|,lanuage=C> after the chunk name. (Currently the language will
  affect all subsequent listings, so you may need to specify
  <verbatim|,language=> quite a lot).

  <todo|so fix the bug>

  Of course you can do this by editing the listings box advanced properties
  by right-clicking on the listings box, but that takes longer, and you can't
  see at-a-glance what the advanced settings are while editing the document;
  also advanced settings apply only to that box --- the chunk settings apply
  through the rest of the document<\footnote>
    It ought to apply only to subsequent chunks of the same name. I'll fix
    that later
  </footnote>.

  <todo|So make sure they only apply to chunks of that name>

  <subsection|Global customisations>

  As lstlistings is used to set the code chunks, it's <verbatim|\\lstset>
  command can be used in the pre-amble to set some document wide settings.

  If your source has many words with long sequences of capital letters, then
  <verbatim|columns=fullflexible> may be a good idea, or the capital letters
  will get crowded. (I think lstlistings ought to use a slightly smaller font
  for captial letters so that they still fit).

  The font family <verbatim|\\ttfamily> looks more normal for code, but has
  no bold (an alternate typewriter font is used).\ 

  With <verbatim|\\ttfamily>, I must also specify
  <verbatim|columns=fullflexible> or the wrong letter spacing is used.

  In my <LaTeX> pre-amble I usually specialise my code format with:

  <\nf-chunk|document-preamble>
    \\lstset{

    numbers=left, stepnumber=1, numbersep=5pt,

    breaklines=false,

    basicstyle=\\footnotesize\\ttfamily,

    numberstyle=\\tiny,

    language=C,

    columns=fullflexible,

    numberfirstline=true

    }
  </nf-chunk|tex|>

  \;

  <section|Configuring the build script>

  You can invoke code extraction and building from the <LyX> menu option
  Document-\<gtr\>Build Program.

  First, make sure you don't have a conversion defined for Lyx-\<gtr\>Program

  From the menu Tools-\<gtr\>Preferences, add a conversion from
  Latex(Plain)-\<gtr\>Program as:

  <\verbatim>
    set -x ; newfangle -Rlyx-build $$i \|\ 

    \ \ env LYX_b=$$b LYX_i=$$i LYX_o=$$o LYX_p=$$p LYX_r=$$r bash
  </verbatim>

  (But don't cut-n-paste it from this document or you'll be pasting a
  multi-line string which will break your lyx preferences file).\ 

  I hope that one day, <LyX> will set these into the environment when calling
  the build script.

  You may also want to consider adding options to this conversion...

  <verbatim|parselog=/usr/share/lyx/scripts/listerrors>

  ...but if you do you will lose your stderr<\footnote>
    There is some bash plumbing to get a copy of stderr but this footnote is
    too small
  </footnote>.

  Now, a shell script chunk called <filename|lyx-build> will be extracted and
  run whenever you choose the Document-\<gtr\>Build Program menu item.

  This document was originally managed using <LyX> and lyx-build script for
  this document is shown here for historical reference.\ 

  <\verbatim>
    lyx -e latex newfangle.lyx && \\

    \ \ newfangle newfangle.lyx \<gtr\> ./autoboot
  </verbatim>

  This looks simple enough, but as mentioned, newfangle has to be had from
  somewhere before it can be extracted.

  <subsection|...>

  When the lyx-build chunk is executed, the current directory will be a
  temporary directory, and <verbatim|LYX_SOURCE> will refer to the tex file
  in this temporary directory. This is unfortunate as our makefile wants to
  run from the project directory where the Lyx file is kept.

  We can extract the project directory from <verbatim|$$r>, and derive the
  probable Lyx filename from the noweb file that Lyx generated.

  <\nf-chunk|lyx-build-helper>
    PROJECT_DIR="$LYX_r"

    LYX_SRC="$PROJECT_DIR/${LYX_i%.tex}.lyx"

    TEX_DIR="$LYX_p"

    TEX_SRC="$TEX_DIR/$LYX_i"
  </nf-chunk|sh|>

  And then we can define a lyx-build fragment similar to the autoboot
  fragment

  <\nf-chunk|lyx-build>
    #! /bin/sh

    =\<less\>\\chunkref{lyx-build-helper}\<gtr\>

    cd $PROJECT_DIR \|\| exit 1

    \;

    #/usr/bin/newfangle -filter ./notanglefix-filter \\

    # \ -R./Makefile.inc "../../noweb-lyx/noweb-lyx3.lyx" \\

    # \ \| sed '/NOWEB_SOURCE=/s/=.*/=samba4-dfs.lyx/' \\

    # \ \<gtr\> ./Makefile.inc

    #

    #make -f ./Makefile.inc newfangle_sources
  </nf-chunk|sh|>

  \;

  <chapter|Using Newfangle with <TeXmacs>>

  <todo|Write this chapter>

  <chapter|Newfangle with Makefiles><label|makefile.inc>

  Here we describe a <filename|Makefile.inc> that you can include in your own
  Makefiles, or glue as a recursive make to other projects.

  <filename|Makefile.inc> will cope with extracting all the other source
  files from this or any specified literate document and keeping them up to
  date.\ 

  It may also be included by a <verbatim|Makefile> or <verbatim|Makefile.am>
  defined in a literate document to automatically deal with the extraction of
  source files and documents during normal builds.

  Thus, if <verbatim|Makefile.inc> is included into a main project makefile
  it add rules for the source files, capable of extracting the source files
  from the literate document.

  <section|A word about makefiles formats>

  Whitespace formatting is very important in a Makefile. The first character
  of each action line must be a TAB.\ 

  <\verbatim>
    target: pre-requisite

    <nf-tab>action

    <nf-tab>action
  </verbatim>

  This requires that the literate programming environment have the ability to
  represent a TAB character in a way the newfangle will generate an actual
  TAB character.

  We also adopt a convention that code chunks whose names beginning with
  <verbatim|./> should always be automatically extracted from the document.
  Code chunks whose names do not begin with <verbatim|./> are for internal
  reference. Such chunks may be extracted directly, but will not be
  automatically extracted by this Makefile.

  <section|Extracting Sources>

  Our makefile has two parts; variables must be defined before the targets
  that use them.

  As we progress through this chapter, explaining concepts, we will be adding
  lines to <nf-ref|Makefile.inc-vars|> and <nf-ref|Makefile.inc-targets|>
  which are included in <nf-ref|./Makefile.inc|> below.

  <\nf-chunk|./Makefile.inc>
    <nf-ref|Makefile.inc-vars|>

    <nf-ref|Makefile.inc-targets|>
  </nf-chunk|make|>

  We first define a placeholder for <verbatim|LITERATE_SOURCE> to hold the
  name of this document. This will normally be passed on the command line.

  <\nf-chunk|Makefile.inc-vars>
    LITERATE_SOURCE=
  </nf-chunk||>

  Newfangle cannot process <LyX> or <TeXmacs> documents directly, so the
  first stage is to convert these to more suitable text based
  formats<\footnote>
    <LyX> and <TeXmacs> formats are text-based, but not suitable for
    newfangle
  </footnote>.

  <subsection|Converting from <LyX> to <LaTeX>><label|Converting-from-Lyx>

  The first stage will always be to convert the <LyX> file to a <LaTeX> file.
  Newfangle must run on a <TeX> file because the <LyX> command
  <verbatim|server-goto-file-line><\footnote>
    The Lyx command <verbatim|server-goto-file-line> is used to position the
    Lyx cursor at the compiler errors.
  </footnote> requries that the line number provided be a line of the <TeX>
  file and always maps this the line in the <LyX> docment. We use
  <verbatim|server-goto-file-line> when moving the cursor to error lines
  during compile failures.

  The command <verbatim|lyx -e literate newfangle.lyx> will produce
  <verbatim|newfangle.tex>, a <TeX> file; so we define a make target to be
  the same as the <LyX> file but with the <verbatim|.tex> extension.

  The <verbatim|EXTRA_DIST> is for automake support so that the <TeX> files
  will automaticaly be distributed with the source, to help those who don't
  have <LyX> installed.

  <\nf-chunk|Makefile.inc-vars>
    TEX_SOURCE=$(LYX_SOURCE:.lyx=.tex)

    EXTRA_DIST+=$(TEX_SOURCE)
  </nf-chunk||>

  We then specify that the <TeX> source is to be generated from the <LyX>
  source.

  <\nf-chunk|Makefile.inc-targets>
    $(TEX_SOURCE): $(LYX_SOURCE)

    <nf-tab>lyx -e latex $\<less\>

    clean_tex:

    <nf-tab>rm -f -- $(TEX_SOURCE)

    clean: clean_tex
  </nf-chunk||>

  <subsection|Converting from <TeXmacs>><label|Converting-from-Lyx>

  Newfangle cannot process <TeXmacs> files directly<\footnote>
    but this is planned when <TeXmacs> uses xml as it's native format
  </footnote>, but must first convert them to text files.

  The command <verbatim|texmacs -c newfangle.tm newfangle.txt -q> will
  produce <verbatim|newfangle.txt>, a text file; so we define a make target
  to be the same as the <TeXmacs> file but with the <verbatim|.txt>
  extension.

  The <verbatim|EXTRA_DIST> is for automake support so that the <TeX> files
  will automaticaly be distributed with the source, to help those who don't
  have <LyX> installed.

  <\nf-chunk|Makefile.inc-vars>
    TXT_SOURCE=$(LITERATE_SOURCE:.tm=.txt)

    EXTRA_DIST+=$(TXT_SOURCE)
  </nf-chunk||>

  <todo|Add loop around each $\<less\> so multiple targets can be specified>

  <\nf-chunk|Makefile.inc-targets>
    $(TXT_SOURCE): $(LITERATE_SOURCE)

    <nf-tab>texmacs -c $\<less\> $(TXT_SOURCE)

    clean_txt:

    <nf-tab>rm -f -- $(TXT_SOURCE)

    clean: clean_txt
  </nf-chunk||>

  <section|Extracting Program Source>

  The program source is extracted using newfangle, which is designed to
  operate on text or a <LaTeX> documents<\footnote>
    <LaTeX> documents are just slightly special text documents
  </footnote>.

  <\nf-chunk|Makefile.inc-vars>
    NEWFANGLE_SOURCE=$(TEX_SOURCE) $(TXT_SOURCE)
  </nf-chunk||>

  The literate document can result in any number of source files, but not all
  of these will be changed each time the document is updated. We certainly
  don't want to update the timestamps of these files and cause the whole
  source tree to be recompiled just because the literate explanation was
  revised. We use <verbatim|CPIF> from the <em|Noweb> tools to avoid updating
  the file if the content has not changed.

  However, if a source file is not updated, then the newfangle file will
  always have a newer time-stamp and the makefile will always re-attempt to
  extact a newer source file.

  Because of this, we use a stamp file which is always updated each time the
  sources are fully extracted from the <LaTeX> document. If the stamp file is
  newer than the document, then we can avoid an attempt to re-extract any of
  the sources. Because this stamp file is only updated when extraction is
  complete, it is safe for the user to interrupt the build-process
  mid-extraction.

  We use <verbatim|echo> rather than <verbatim|touch> to update the stamp
  file beause the <verbatim|touch> command does not work very well over a
  <verbatim|sshfs> that I was using.

  <\nf-chunk|Makefile.inc-vars>
    NEWFANGLE_SOURCE_STAMP=$(NEWFANGLE_SOURCE).stamp
  </nf-chunk||>

  <\nf-chunk|Makefile.inc-targets>
    $(NEWFANGLE_SOURCE_STAMP): $(NEWFANGLE_SOURCE) \\

    <nf-tab> \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ $(NEWFANGLE_SOURCES) ; \\

    <nf-tab>echo -n \<gtr\> $(NEWFANGLE_SOURCE_STAMP)

    clean_stamp:

    <nf-tab>rm -f $(NEWFANGLE_SOURCE_STAMP)

    clean: clean_stamp
  </nf-chunk||>

  <section|Extracting Source Files>

  We compute <verbatim|NEWFANGLE_SOURCES> to hold the names of all the source
  files defined in this document. We compute this only once, by means of
  <verbatim|:=> in assignent. The sed deletes the any
  <verbatim|\<less\>\<less\>> and <verbatim|\<gtr\>\<gtr\>> which may
  surround the roots names (for compatibility with Noweb's noroots command).

  As we use chunk names beginning with <filename|./> to denote top level
  fragments that should be extracted, we filter out all fragments that do not
  begin with <filename|./>

  <\note>
    <verbatim|NEWFANGLE_PREFIX> is set to <verbatim|./> by default, but
    whatever it may be overridden to, the prefix is replaced by a literal
    <verbatim|./> before extraction so that files will be extracted in the
    current directory whatever the prefix. This supports namespace or
    sub-project prefixes like <verbatim|documents:> for chunks like
    <verbatim|documents:docbook/intro.xml>
  </note>

  <todo|This doesn't work though, because it loses the full name and doesn't
  know what to extact!>

  <\nf-chunk|Makefile.inc-vars>
    NEWFANGLE_PREFIX:=\\.\\/

    NEWFANGLE_SOURCES:=$(shell \\

    \ \ newfangle -r $(NEWFANGLE_SOURCE) \|\\

    \ \ sed -e 's/^[\<less\>][\<less\>]//;s/[\<gtr\>][\<gtr\>]$$//;/^$(NEWFANGLE_PREFIX)/!d'
    \\

    \ \ \ \ \ \ -e 's/^$(NEWFANGLE_PREFIX)/\\.\\//' )
  </nf-chunk||>

  The target below, <verbatim|echo_newfangle_sources> is a helpful debugging
  target and shows the names of the files that would be extracted.

  <\nf-chunk|Makefile.inc-targets>
    .PHONY: echo_newfangle_sources

    echo_newfangle_sources: ; @echo $(NEWFANGLE_SOURCES)
  </nf-chunk||>

  We define a convenient target called <verbatim|newfangle_sources> so that
  <verbatim|make -f newfangle_sources> will re-extract the source if the
  literate document has been updated.\ 

  <\nf-chunk|Makefile.inc-targets>
    .PHONY: newfangle_sources

    newfangle_sources: $(NEWFANGLE_SOURCE_STAMP)
  </nf-chunk||>

  And also a convenient target to remove extracted sources.

  <\nf-chunk|Makefile.inc-targets>
    .PHONY: clean_newfangle_sources

    clean_newfangle_sources: ; \\

    \ \ \ \ \ \ \ \ rm -f -- $(NEWFANGLE_SOURCE_STAMP) $(NEWFANGLE_SOURCES)
  </nf-chunk||>

  We now look at the extraction of the source files.

  This makefile macro <verbatim|if_extension> takes 4 arguments: the filename
  <verbatim|$(1)>, some extensions to match <verbatim|$(2)> and a some shell
  command to return if the filename matches the exentions <verbatim|$(3)>, or
  not <verbatim|$(4)>.

  <\nf-chunk|Makefile.inc-vars>
    if_extension=$(if $(findstring $(suffix $(1)),$(2)),$(3),$(4))
  </nf-chunk||>

  For some source files like C files, we want to output the line number and
  filename of the original <LaTeX> document from which the source
  came<\footnote>
    I plan to replace this option with a separate mapping file so as not to
    pollute the generated source, and also to allow a code pretty-printing
    reformatter like <verbatim|indent> be able to re-format the file and
    adjust for changes through comparing the character streams.
  </footnote>.

  To make this easier we define the file extensions for which we want to do
  this.

  <\nf-chunk|Makefile.inc-vars>
    C_EXTENSIONS=.c .h
  </nf-chunk||>

  We can then use the <verbatim|if_extensions> macro to define a macro which
  expands out to the <verbatim|-L> option if newfangle is being invoked in a
  C source file, so that C compile errors will refer to the line number in
  the Lyx document.\ 

  <\nf-chunk|Makefile.inc-vars>
    TABS=8

    nf_line=-L -T$(TABS)

    newfangle=newfangle $(call if_extension,$(2),$(C_EXTENSIONS),$(nf_line))
    -R"$(2)" $(1)
  </nf-chunk||>

  We can use a similar trick to define an indent macro which takes just the
  filename as an argument and can return a pipeline stage calling the indent
  command. Indent can be turned off with <verbatim|make newfangle_sources
  indent=>

  <\nf-chunk|Makefile.inc-vars>
    indent_options=-npro -kr -i8 -ts8 -sob -l80 -ss -ncs

    indent=$(call if_extension,$(1),$(C_EXTENSIONS), \| indent
    $(indent_options))
  </nf-chunk||>

  We now define the pattern for extracting a file. The files are written
  using noweb's <verbatim|cpif> so that the file timestamp will not be
  touched if the contents haven't changed. This avoids the need to rebuild
  the entire project because of a typographical change in the documentation,
  or if none or a few C source files have changed.

  <\nf-chunk|Makefile.inc-vars>
    newfangle_extract=@mkdir -p $(dir $(1)) && \\

    \ \ $(call newfangle,$(2),$(1)) \<gtr\> "$(1).tmp" && \\

    \ \ cat "$(1).tmp" $(indent) \| cpif "$(1)" \\

    \ \ && rm -- "$(1).tmp" \|\| \\

    \ \ (echo error newfangling $(1) from $(2) ; exit 1)
  </nf-chunk||>

  We define a target which will extract or update all sources. To do this we
  first defined a makefile template that can do this for any source file in
  the <LaTeX> document.

  <\nf-chunk|Makefile.inc-vars>
    define NEWFANGLE_template

    \ \ $(1): $(2)

    <nf-tab>$$(call newfangle_extract,$(1),$(2))

    \ \ NEWFANGLE_TARGETS+=$(1)

    endef
  </nf-chunk||>

  We then enumerate the discovered <verbatim|NEWTANGLE_SOURCES> to generate a
  makefile rule for each one using the makefile template we defined above.

  <\nf-chunk|Makefile.inc-targets>
    $(foreach source,$(NEWFANGLE_SOURCES),\\

    \ \ $(eval $(call NEWFANGLE_template,$(source),$(NEWFANGLE_SOURCE))) \\

    )
  </nf-chunk||>

  These will all be built with <verbatim|NEWFANGLE_SOURCE_STAMP>.

  We also remove the generated sources on a make distclean.

  <\nf-chunk|Makefile.inc-targets>
    _distclean: clean_newfangle_sources
  </nf-chunk||>

  <section|Extracting Documentation>

  We then identify the intermediate stages of the documentation and their
  build and clean targets.

  <subsection|Formatting <TeX>>

  <subsubsection|Running pdflatex>

  We produce a pdf file from the tex file.

  <\nf-chunk|Makefile.inc-vars>
    NEWFANGLE_PDF=$(TEX_SOURCE:.tex=.pdf)
  </nf-chunk||>

  We run pdflatex twice to be sure that the contents and aux files are up to
  date. We certainly are <em|required> to run pdflatex at least twice if
  these files do not exist.

  <\nf-chunk|Makefile.inc-targets>
    $(NEWFANGLE_PDF): $(TEX_SOURCE)

    <nf-tab>pdflatex $\<less\> && pdflatex $\<less\>

    \;

    clean_pdf:

    <nf-tab>rm -f -- $(NEWFANGLE_PDF) $(TEX_SOURCE:.tex=.toc) \\

    <nf-tab> \ $(TEX_SOURCE:.tex=.log) $(TEX_SOURCE:.tex=.aux)
  </nf-chunk||>

  <subsection|Formatting <TeXmacs>>

  <TeXmacs> can produce a PDF file directly.

  <\nf-chunk|Makefile.inc-vars>
    NEWFANGLE_PDF=$(TEX_SOURCE:.tm=.pdf)
  </nf-chunk||>

  <\todo>
    Outputting the PDF may not be enough to update the links and page
    references. I think

    we need to update twice, generate a pdf, update twice mode and generate a
    new PDF
  </todo>

  <\nf-chunk|Makefile.inc-targets>
    $(NEWFANGLE_PDF): $(TEXMACS_SOURCE)

    <nf-tab>texmacs -c $(TEXMACS_SOURCE) $\<less\> -q

    \;

    clean_pdf:

    <nf-tab>rm -f -- $(NEWFANGLE_PDF)
  </nf-chunk||>

  <subsection|Building the Documentation as a Whole>

  Currently we only build pdf as a final format, but
  <verbatim|NEWFANGLE_DOCS> may later hold other output formats.

  <\nf-chunk|Makefile.inc-vars>
    NEWFANGLE_DOCS=$(NEWFANGLE_PDF)
  </nf-chunk||>

  We also define <verbatim|newfangle_docs> as a convenient phony target.

  <\nf-chunk|Makefile.inc-targets>
    .PHONY: newfangle_docs

    newfangle_docs: $(NEWFANGLE_DOCS)

    docs: newfangle_docs
  </nf-chunk||>

  And define a convenient <verbatim|clean_noweb_docs> which we add to the
  regular clean target

  <\nf-chunk|Makefile.inc-targets>
    .PHONEY: clean_newfangle_docs

    clean_newfangle_docs: clean_tex clean_pdf

    clean: clean_newfangle_docs

    \;

    distclean_newfangle_docs: clean_tex clean_newfangle_docs

    distclean: clean distclean_newfangle_docs
  </nf-chunk||>

  <section|Other helpers>

  If <filename|Makefile.inc> is included into <filename|Makefile>, then
  extracted files can be updated with this command:

  <verbatim|make newfangle_sources>

  otherwise, with:

  <verbatim|make -f Makefile.inc newfangle_sources>

  <section|Boot-strapping the extraction>

  As well as having the makefile extract or update the source files as part
  of it's operation, it also seems convenient to have the makefile
  re-extracted itself from <em|this> document.

  It would also be convenient to have the code that extracts the makefile
  from this document to also be part of this document, however we have to
  start somewhere and this unfortunately requires us to type at least a few
  words by hand to start things off.

  Therefore we will have a minimal root fragment, which, when extracted, can
  cope with extracting the rest of the source. This shell script fragmen can
  do that. It's name is <verbatim|*> <emdash> out of regard for <name|Noweb>,
  but when extracted might better be called <verbatim|autoupdate>.

  <todo|De-lyxify>

  <\nf-chunk|*>
    #! /bin/sh

    \;

    MAKE_SRC="${1:-${NW_LYX:-../../noweb-lyx/noweb-lyx3.lyx}}"

    MAKE_SRC=\0dirname "$MAKE_SRC"\0/\0basename "$MAKE_SRC" .lyx\0

    NOWEB_SRC="${2:-${NOWEB_SRC:-$MAKE_SRC.lyx}}"

    lyx -e latex $MAKE_SRC

    \;

    newfangle -R./Makefile.inc ${MAKE_SRC}.tex \\

    \ \ \| sed "/NEWFANGLE_SOURCE=/s/^/#/;T;aNOWEB_SOURCE=$NEWFANGLE_SRC" \\

    \ \ \| cpif ./Makefile.inc

    \;

    make -f ./Makefile.inc newfangle_sources
  </nf-chunk|sh|>

  The general Makefile can be invoked with <filename|./autoboot> and can also
  be included into any automake file to automatically re-generate the source
  files.

  The <em|autoboot> can be extracted with this command:

  <\verbatim>
    lyx -e latex newfangle.lyx && \\

    \ \ newfangle newfangle.lyx \<gtr\> ./autoboot
  </verbatim>

  This looks simple enough, but as mentioned, newfangle has to be had from
  somewhere before it can be extracted.

  On a unix system will extract <filename|newfangle.module> and the
  <filename|newfangle> awk script, and run some basic tests.\ 

  <todo|cross-ref to test chapter when it is a chapter all on its own>

  <section|Incorporating Makefile.inc into existing projects>

  If you are writing a literate module of an existing non-literate program
  you may find it easier to use a slight recursive make instead of directly
  including <verbatim|Makefile.inc> in the projects makefile.\ 

  This way there is less chance of definitions in <verbatim|Makefile.inc>
  interfering with definitions in the main makefile, or with definitions in
  other <verbatim|Makefile.inc> from other literate modules of the same
  project.

  To do this we add some <em|glue> to the project makefile that invokes
  Makefile.inc in the right way. The glue works by adding a <verbatim|.PHONY>
  target to call the recursive make, and adding this target as an additional
  pre-requisite to the existing targets.

  <paragraph|Example>Sub-module of existing system

  In this example, we are building <verbatim|module.so> as a literate module
  of a larger project.

  We will show the sort glue that can be inserted into the projects Makefile
  <emdash> or more likely <emdash> a regular Makefile included in or invoked
  by the projects Makefile.

  <\nf-chunk|makefile-glue>
    module_srcdir=modules/module

    MODULE_SOURCE=module.tm

    MODULE_STAMP=$(MODULE_SOURCE).stamp
  </nf-chunk||>

  The existing build system may already have a build target for
  <filename|module.o>, but we just add another pre-requisite to that. In this
  case we use <filename|module.nf.stamp> as a pre-requisite, the stamp file's
  modified time indicating when all sources were extracted<\footnote>
    If the projects build system does not know how to build the module from
    the extracted sources, then just add build actions here as normal.
  </footnote>.

  <\nf-chunk|makefile-glue>
    $(module_srcdir)/module.o: $(module_srcdir)/$(MODULE_STAMP)
  </nf-chunk|make|>

  The target for this new pre-requisite will be generated by a recursive make
  using <filename|Makefile.inc> which will make sure that the source is up to
  date, before it is built by the main projects makefile.

  <\nf-chunk|makefile-glue>
    $(module_srcdir)/$(MODULE_STAMP): $(module_srcdir)/$(MODULE_SOURCE)

    <nf-tab>$(MAKE) -C $(module_srcdir) -f Makefile.inc newfangle_sources
    LITERATE_SOURCE=$(MODULE_SOURCE)
  </nf-chunk||>

  We can do similar glue for the docs, clean and distclean targets. In this
  example the main prject was using a double colon for these targets, so we
  must use the same in our glue.

  <\nf-chunk|makefile-glue>
    docs:: docs_module

    .PHONY: docs_module

    docs_module:

    <nf-tab>$(MAKE) -C $(module_srcdir) -f Makefile.inc docs
    LITERATE_SOURCE=$(MODULE_SOURCE)

    \;

    clean:: clean_module

    .PHONEY: clean_module

    clean_module:

    <nf-tab>$(MAKE) -C $(module_srcdir) -f Makefile.inc clean
    LITERATE_SOURCE=$(MODULE_SOURCE)

    \;

    distclean:: distclean_module

    .PHONY: distclean_module

    distclean_module:

    <nf-tab>$(MAKE) -C $(module_srcdir) -f Makefile.inc distclean
    LITERATE_SOURCE=$(MODULE_SOURCE)
  </nf-chunk||>

  We could do similarly for install targets to install the generated docs.

  <part|Source Code>

  <chapter|Newfangle awk source code>

  We use the copyright notice from chapter <reference|License>.

  <\nf-chunk|./newfangle>
    #! /usr/bin/awk -f

    # <nf-ref|gpl3-copyright|>
  </nf-chunk|awk|>

  We also use code from <person|Arnold Robbins> public domain getopt (1993
  revision) defined in <reference|getopt>, and naturally want to attribute
  this appropriately.

  <\nf-chunk|./newfangle>
    \;

    # NOTE: Arnold Robbins public domain getopt for awk is also used:

    =\<less\>\\chunkref{getopt.awk-header}\<gtr\>

    \;

    =\<less\>\\chunkref{getopt.awk-getopt()}\<gtr\>

    \;
  </nf-chunk||>

  And include the following chunks (which are explained further on) to make
  up the program:

  <\nf-chunk|./newfangle>
    <nf-ref|helper-functions|>

    <nf-ref|mode-tracker|>

    <nf-ref|parse_chunk_args|>

    <nf-ref|chunk-storage-functions|>

    <nf-ref|output_chunk_names()|>

    <nf-ref|output_chunks()|>

    <nf-ref|write_chunk()|>

    <nf-ref|expand_chunk_args()|>

    \;

    <nf-ref|begin|>

    <nf-ref|recognize-chunk|>

    <nf-ref|end|>
  </nf-chunk||>

  <section|AWK tricks>

  The portable way to erase an array in awk is to split the empty string, so
  we define a newfangle macro that can split an array, like this:

  <nf-chunk|awk-delete-array|split("", <nf-arg|ARRAY>);|awk|<tuple|ARRAY>>

  For debugging is is sometimes convenient to be able to dump the contents of
  an array to <verbatim|stderr>, and so this macro is also useful.

  <\nf-chunk|dump-array>
    print "\\nDump: <nf-arg|ARRAY>\\n--------\\n" \<gtr\> "/dev/stderr";

    for (_x in <nf-arg|ARRAY>) {

    \ \ print _x "=" <nf-arg|ARRAY>[_x] "\\n" \<gtr\> "/dev/stderr";

    }

    print "========\\n" \<gtr\> "/dev/stderr";
  </nf-chunk|awk|<tuple|ARRAY>>

  <section|Catching errors>

  Fatal errors are issued with the error function:

  <\nf-chunk|error()>
    function error(message)

    {

    \ \ print "ERROR: " FILENAME ":" FNR " " message \<gtr\> "/dev/stderr";

    \ \ exit 1;

    }
  </nf-chunk|awk|>

  and likewise for non-fatal warnings:

  <\nf-chunk|error()>
    function warning(message)

    {

    \ \ print "WARNING: " FILENAME ":" FNR " " message \<gtr\> "/dev/stderr";

    \ \ warnings++;

    }
  </nf-chunk|awk|>

  <todo|append=helper-functions>

  <chapter|<LaTeX> and lstlistings>

  <todo|Split LyX and TeXmacs parts>

  For <LyX> and <LaTeX>, the <verbatim|lstlistings> package is used to format
  the lines of code chunks. You may recal from chapter XXX that arguments to
  a chunk definition are pure <LaTeX> code. This means that newfangle needs
  to be able to parse <LaTeX> a little.

  <LaTeX> arguments to <verbatim|lstlistings> macros are a comma seperated
  list of key-value pairs, and values containing commas are enclosed in
  <verbatim|{> braces <verbatim|}> (which is to be expected for <LaTeX>).

  A sample expressions is:

  <verbatim|name=thomas, params={a, b}, something, something-else>

  but we see that this is just a simpler form of this expression:

  <verbatim|name=freddie, foo={bar=baz, quux={quirk, a=fleeg}}, etc>

  We may consider that we need a function that can parse such <LaTeX>
  expressions and assign the values to an AWK associated array, perhaps using
  a recursive parser into a multi-dimensional hash<\footnote>
    as AWK doesn't have nested-hash support
  </footnote>, resulting in:

  <tabular|<tformat|<cwith|2|6|1|2|cell-lborder|0.5pt>|<cwith|2|6|1|2|cell-rborder|0.5pt>|<cwith|2|6|1|2|cell-bborder|0.5pt>|<cwith|2|6|1|2|cell-tborder|0.5pt>|<cwith|1|1|1|2|cell-lborder|0.5pt>|<cwith|1|1|1|2|cell-rborder|0.5pt>|<cwith|1|1|1|2|cell-bborder|0.5pt>|<cwith|1|1|1|2|cell-tborder|0.5pt>|<table|<row|<cell|key>|<cell|value>>|<row|<cell|a[name]>|<cell|freddie>>|<row|<cell|a[foo,
  bar]>|<cell|baz>>|<row|<cell|a[foo, quux,
  quirk]>|<cell|>>|<row|<cell|a[foo, quux,
  a]>|<cell|fleeg>>|<row|<cell|a[etc]>|<cell|>>>>>

  Yet, also, on reflection it seems that sometimes such nesting is not
  desirable, as the braces are also used to delimit values that contain
  commas --- we may consider that

  <verbatim|name={williamson, freddie}>

  should assign <verbatim|williamson, freddie> to <verbatim|name>.

  In fact we are not so interested in the detail so as to be bothered by
  this, which turns out to be a good thing for two reasons. Firstly <TeX> has
  a malleable parser with no strict syntax, and secondly whether or not
  <verbatim|williamson> and <verbatim|freddie> should count as two items will
  be context dependant anyway.

  We need to parse this latex for only one reason; which is that we are
  extending lstlistings to add some additional arguments which will be used
  to express chunk parameters and other chunk options.

  <section|Additional lstlstings parameters>

  Further on we define a <verbatim|\\Chunk> <LaTeX> macro whose arguments
  will consist of a the chunk name, optionally followed by a comma and then a
  comma separated list of arguments. In fact we will just need to prefix
  <verbatim|name=> to the arguments to in order to create valid lstlistings
  arguments.\ 

  There will be other arguments supported too;\ 

  <\description-long>
    <item*|params>As an extension to many literate-programming styles,
    newfangle permits code chunks to take parameters and thus operate
    somewhat like C pre-processor macros, or like C++ templates. Chunk
    parameters are declared with a chunk argument called params, which holds
    a semi-colon separated list of parameters, like this:

    \;

    <verbatim|achunk,language=C,params=name;address>

    <item*|addto>a named chunk that this chunk is to be included into. This
    saves the effort of having to declare another listing of the named chunk
    merely to include this one.
  </description-long>

  Function get_chunk_args() will accept two paramters, text being the text to
  parse, and values being an array to receive the parsed values as described
  above. The optional parameter path is used during recursion to build up the
  multi-dimensional array path.

  <\nf-chunk|./newfangle>
    =\<less\>\\chunkref{get_chunk_args()}\<gtr\>
  </nf-chunk||>

  <\nf-chunk|get_chunk_args()>
    function get_chunk_args(text, values,

    \ \ # optional parameters

    \ \ path, # hierarchical precursors

    \ \ # local vars

    \ \ a, name)
  </nf-chunk||>

  The strategy is to parse the name, and then look for a value. If the value
  begins with a brace <verbatim|{>, then we recurse and consume as much of
  the text as necessary, returning the remaining text when we encounter a
  leading close-brace <verbatim|}>. This being the strategy --- and executed
  in a loop --- we realise that we must first look for the closing brace
  (perhaps preceded by white space) in order to terminate the recursion, and
  returning remaining text.

  <\nf-chunk|get_chunk_args()>
    {

    \ \ split("", next_chunk_args);

    \ \ while(length(text)) {

    \ \ \ \ if (match(text, "^ *}(.*)", a)) {

    \ \ \ \ \ \ return a[1];

    \ \ \ \ }

    \ \ \ \ =\<less\>\\chunkref{parse-chunk-args}\<gtr\>

    \ \ }

    \ \ return text;

    }
  </nf-chunk||>

  We can see that the text could be inspected with this regex:

  <\nf-chunk|parse-chunk-args>
    if (! match(text, " *([^,=]*[^,= ]) *(([,=]) *(([^,}]*) *,* *(.*))\|)$",
    a)) {

    \ \ return text;

    }
  </nf-chunk||>

  and that <verbatim|a> will have the following values:

  <tabular|<tformat|<cwith|2|7|1|2|cell-lborder|0.5pt>|<cwith|2|7|1|2|cell-rborder|0.5pt>|<cwith|2|7|1|2|cell-bborder|0.5pt>|<cwith|2|7|1|2|cell-tborder|0.5pt>|<cwith|1|1|1|2|cell-lborder|0.5pt>|<cwith|1|1|1|2|cell-rborder|0.5pt>|<cwith|1|1|1|2|cell-bborder|0.5pt>|<cwith|1|1|1|2|cell-tborder|0.5pt>|<table|<row|<cell|a[n]>|<cell|assigned
  text>>|<row|<cell|1>|<cell|freddie>>|<row|<cell|2>|<cell|=freddie,
  foo={bar=baz, quux={quirk, a=fleeg}}, etc>>|<row|<cell|3>|<cell|=>>|<row|<cell|4>|<cell|freddie,
  foo={bar=baz, quux={quirk, a=fleeg}}, etc>>|<row|<cell|5>|<cell|freddie>>|<row|<cell|6>|<cell|,
  foo={bar=baz, quux={quirk, a=fleeg}}, etc>>>>>

  <verbatim|a[3]> will be either <verbatim|=> or <verbatim|,> and signify
  whether the option named in <verbatim|a[1]> has a value or not
  (respectively).

  If the option does have a value, then if the expression
  <verbatim|substr(a[4],1,1)> returns a brace <verbatim|{> it will signify
  that we need to recurse:

  <\nf-chunk|parse-chunk-args>
    name=a[1];

    if (a[3] == "=") {

    \ \ if (substr(a[4],1,1) == "{") {

    \ \ \ \ text = get_chunk_args(substr(a[4],2), values, path name SUBSEP);

    \ \ } else {

    \ \ \ \ values[path name]=a[5];

    \ \ \ \ text = a[6];

    \ \ }

    } else {

    \ \ values[path name]="";

    \ \ text = a[2];

    }
  </nf-chunk||>

  We can test this function like this:

  <\nf-chunk|gca-test.awk>
    =\<less\>\\chunkref{get_chunk_args()}\<gtr\>

    BEGIN {

    \ \ SUBSEP=".";

    \;

    \ \ print get_chunk_args("name=freddie, foo={bar=baz, quux={quirk,
    a=fleeg}}, etc", a);

    \ \ for (b in a) {

    \ \ \ \ print "a[" b "] =\<gtr\> " a[b];

    \ \ }

    }
  </nf-chunk||>

  which should give this output:

  <\nf-chunk|gca-test.awk-results>
    a[foo.quux.quirk] =\<gtr\>\ 

    a[foo.quux.a] =\<gtr\> fleeg

    a[foo.bar] =\<gtr\> baz

    a[etc] =\<gtr\>\ 

    a[name] =\<gtr\> freddie
  </nf-chunk||>

  <section|Parsing chunk arguments><label|Chunk Arguments>

  Arguments to paramterized chunks are expressed in round brackets as a comma
  separated list of optional arguments. For example, a chunk that is defined
  with:

  <verbatim|\\Chunk{achunk, params=name ; address}>

  could be invoked as:

  <verbatim|\\chunkref{achunk}(John Jones, jones@example.com)>

  An argument list may be as simple as in <verbatim|\\chunkref{pull}(thing,
  otherthing)> or as complex as:

  <verbatim|\\chunkref{pull}(things[x, y], get_other_things(a, "(all)"))>

  --- which for all it's commas and quotes and parenthesis represents only
  two parameters: <verbatim|things[x, y]> and <verbatim|get_other_things(a,
  "(all)")>.

  If we simply split parameter list on commas, then the comma in
  <verbatim|things[x,y]> would split into two seperate arguments:
  <verbatim|things[x> and <verbatim|y]>--- neither of which make sense on
  their own.

  One way to prevent this would be by refusing to split text between matching
  delimiters, such as <verbatim|[>, <verbatim|]>, <verbatim|(>, <verbatim|)>,
  <verbatim|{>, <verbatim|}> and most likely also <verbatim|">, <verbatim|">
  and <verbatim|'>, <verbatim|'>. Of course this also makes it impossible to
  pass such mis-matched code fragments as parameters, but I think that it
  would be hard for readers to cope with authors who would pass such code
  unbalanced fragments as chunk parameters<\footnote>
    I know that I couldn't cope with users doing such things, and although
    the GPL3 license prevents me from actually forbidding anyone from trying,
    if they want it to work they'll have to write the code themselves and not
    expect any support from me.
  </footnote>.

  Unfortunately, the full set of matching delimiters may vary from language
  to language. In certain C++ template contexts, <verbatim|\<less\>> and
  <verbatim|\<gtr\>> would count as delimiters, and yet in other contexts
  they would not.

  This puts me in the unfortunate position of having to parse-somewhat all
  programming languages without knowing what they are!

  However, if this universal mode-tracking is possible, then parsing the
  arguments would be trivial. Such a mode tracker is described in chapter
  <reference|modes> and used here with simplicity.

  <\nf-chunk|parse_chunk_args>
    function parse_chunk_args(language, text, values, mode,

    \ \ # local vars

    \ \ c, context, rest)

    {

    \ \ =\<less\>\\chunkref{new-mode-tracker}(context, language, mode)\<gtr\>

    \ \ rest = mode_tracker(context, text, values);

    \ \ # extract values

    \ \ for(c=1; c \<less\>= context[0, "values"]; c++) {

    \ \ \ \ values[c] = context[0, "values", c];

    \ \ }

    \ \ return rest;

    }
  </nf-chunk||>

  <section|Expanding parameters in the text>

  Within the body of the chunk, the parameters are referred to with:
  <verbatim|${name}> and <verbatim|${address}>. There is a strong case that a
  <LaTeX> style notation should be used, like <verbatim|\\param{name}> which
  would be expressed in the listing as <verbatim|=\<less\>\\param{name}\<gtr\>>
  and be rendered as <verbatim|<nf-arg|name>>. Such notation would make me go
  blind, but I do intend to adopt it.

  We therefore need a function <verbatim|expand_chunk_args> which will take a
  block of text, a list of permitted parameters, and the arguments which must
  substitute for the parameters.\ 

  Here we split the text on <verbatim|${> which means that all parts except
  the first will begin with a parameter name which will be terminated by
  <verbatim|}>. The split function will consume the literal <verbatim|${> in
  each case.

  <\nf-chunk|expand_chunk_args()>
    function expand_chunk_args(text, params, args, \ 

    \ \ p, text_array, next_text, v, t, l)

    {

    \ \ if (split(text, text_array, "\\\\${")) {

    \ \ \ \ =\<less\>\\chunkref{substitute-chunk-args}\<gtr\>

    \ \ }

    \;

    \ \ return text;

    }
  </nf-chunk||>

  First, we produce an associative array of substitution values indexed by
  parameter names. This will serve as a cache, allowing us to look up the
  replacement values as we extract each name.

  <\nf-chunk|substitute-chunk-args>
    for(p in params) {

    \ \ v[params[p]]=args[p];

    }
  </nf-chunk||>

  We accumulate substituted text in the variable text. As the first part of
  the split function is the part before the delimiter --- which is
  <verbatim|${> in our case --- this part will never contain a parameter
  reference, so we assign this directly to the result kept in
  <verbatim|$text>.

  <\nf-chunk-more>
    text=text_array[1];
  </nf-chunk-more>

  We then iterate over the remaining values in the array<\footnote>
    I don't know why I think that it will enumerate the array in order, but
    it seems to work
  </footnote><todo|fix or prove it>, and substitute each reference for it's
  argument.

  <\nf-chunk|substitute-chunk-args>
    for(t=2; t in text_array; t++) {

    \ \ =\<less\>\\chunkref{substitute-chunk-arg}\<gtr\>

    }
  </nf-chunk||>

  After the split on <verbatim|${> a valid parameter reference will consist
  of valid parameter name terminated by a close-brace <verbatim|}>. A valid
  character name begins with the underscore or a letter, and may contain
  letters, digits or underscores.

  A valid looking reference that is not actually the name of a parameter will
  be and not substituted. This is good because there is nothing to substitute
  anyway, and it avoids clashes when writing code for languages where
  <verbatim|${...}> is a valid construct --- such constructs will not be
  interfered with unless the parameter name also matches.

  <\nf-chunk|substitute-chunk-arg>
    if (match(text_array[t], "^([a-zA-Z_][a-zA-Z0-9_]*)}", l) &&

    \ \ \ \ l[1] in v)\ 

    {

    \ \ text = text v[l[1]] substr(text_array[t], length(l[1])+2);

    } else {

    \ \ text = text "${" text_array[t];

    }
  </nf-chunk||>

  <chapter|Language Modes & Quoting><label|modes>

  <section|Modes>

  <verbatim|lstlistings> and <verbatim|newfangle> both recognize source
  languages, and perform some basic parsing. <verbatim|lstlistings> can
  detect strings and comments within a language definition and perform
  suitable rendering, such as italics for comments, and visible-spaces within
  strings.

  Newfangle similarly can recognize strings, and comments, etc, within a
  language, so that any chunks included with <verbatim|\\chunkref> can be
  suitably escape or quoted.

  <subsection|Modes to keep code together>

  As an example, in the C language there are a few parse modes, affecting the
  interpretation of characters.

  One parse mode is the strings mode. The string mode is commenced by an
  un-escaped quotation mark <verbatim|"> and terminated by the same. Within
  the string mode, only one additional mode can be commenced, it is the
  backslash mode <verbatim|\\>, which is always terminated after the folloing
  character.

  Another mode is <verbatim|[> which is terminated by a <verbatim|]> (unless
  it occurs in a string).

  Consider this fragment of C code:

  \;

  <math|things<wide|[x, y]|\<wide-overbrace\>><rsup|1. [ mode>,
  get_other_things<wide|(a, <wide*|<with|mode|text|">(all)<with|mode|text|">|\<wide-underbrace\>><rsub|3.
  " mode>)|\<wide-overbrace\>><rsup|2. ( mode>>

  \;

  Mode nesting prevents the close parenthesis in quote mode (part 3) from
  terminating the parenthesis mode (part 2).

  Each language has a set of modes, the default mode being the null mode.
  Each mode can lead to other modes.

  <subsection|Modes affect included chunks>

  For instance, consider this chunk with language=perl:

  <nf-chunk|example-perl|print "hello world $0\\n";|perl|>

  If it were included in a chunk with <verbatim|language=sh>, like this:

  <nf-chunk|example-sh|perl -e "=\<less\>\\chunkref{example-perl}\<gtr\>"|sh|>

  newfangle would need to generate output like this:

  <verbatim|perl -e "print \\"hello world \\$0\\\\n\\";" >

  See that the double quote <verbatim|">, back-slash <verbatim|\\> and
  <verbatim|$> have been quoted with a back-slash to protect them from shell
  interpretation.

  If that were then included in a chunk with language=make, like this:

  <\nf-chunk|example-makefile>
    target: pre-req

    <htab|5mm>=\<less\>\\chunkref{example-sh}\<gtr\>
  </nf-chunk|make|>

  We would need the output to look like this --- note the <verbatim|$$>:

  <\verbatim>
    target: pre-req

    \ \ \ \ \ \ \ \ perl -e "print \\"hello world \\$$0\\\\n\\";"
  </verbatim>

  In order to make this work, we need to define a mode-tracker supporting
  each language, that can detect the various quoting modes, and provide a
  transformation that must be applied to any included text so that included
  text will be interpreted correctly after any interpolation that it may be
  subject to at run-time.

  For example, the sed transformation for text to be inserted into shell
  double-quoted strings would be something like:

  <verbatim|s/\\\\/\\\\\\\\/g;s/$/\\\\$/g;s/"/\\\\"/g;>

  which protects <verbatim|\\ $ ">.

  <todo|I don't think this example is true>The mode tracker must also track
  nested mode-changes, as in this sh example.

  <verbatim|echo "hello \0id ...\0">

  <phantom|<verbatim|echo "hello \0id <math|<math|>>>><with|mode|math|\<uparrow\>>

  Any characters inserted at the point marked <with|mode|math|\<uparrow\>>
  would need to be escaped, including <verbatim|\0> <verbatim|\|>
  <verbatim|*> among others. First it would need escaping for the back-ticks
  <verbatim|\0>, and then for the double-quotes <verbatim|">.

  <todo|MAYBE>Escaping need not occur if the format and mode of the included
  chunk matches that of the including chunk.

  As each chunk is output a new mode tracker for that language is initialized
  in it's normal state. As text is output for that chunk the output mode is
  tracked. When a new chunk is included, a transformation appropriate to that
  mode is selected and pushed onto a stack of transformations. Any text to be
  output is first passed through this stack of transformations.

  It remains to consider if the chunk-include function should return it's
  generated text so that the caller can apply any transformations (and
  formatting), or if it should apply the stack of transformations itself.

  Note that the transformed text should have the property of not being able
  to change the mode in the current chunk.

  <todo|Note chunk parameters should probably also be transformed>

  <section|Language Mode Definitions>

  All modes are stored in a single multi-dimensional hash. The first index is
  the language, and the second index is the mode-identifier. The third
  indexes are terminators, and optionally, submodes, and delimiters.

  A useful set of mode definitions for a nameless general C-type language is
  shown here. (Don't be confused by the double backslash escaping needed in
  awk. One set of escaping is for the string, and the second set of escaping
  is for the regex).

  <\todo>
    TODO: Add =\<less\>\\mode{}\<gtr\> command which will allow us to signify
    that a string is

    \ regex and thus newfangle will quote it for us.
  </todo>

  Submodes are entered by the characters \ <verbatim|"> <verbatim|'>
  <verbatim|{> <verbatim|(> <verbatim|[> <verbatim|/*>

  <\nf-chunk|common-mode-definitions>
    modes[${language}, "", \ "submodes" ]="\\\\\\\\\|\\"\|'\|{\|\\\\(\|\\\\[";
  </nf-chunk||language>

  In the default mode, a comma surrounded by un-important white space is a
  delimiter of language items.

  <\nf-chunk|common-mode-definitions>
    modes[${language}, "", \ "delimiters"]=" *, *";
  </nf-chunk||language>

  and should pass this test:<todo|Why do the tests run in ?(? mode and not ??
  mode>

  <\nf-chunk|test:mode-definitions>
    parse_chunk_args("c-like", "1,2,3", a, "");

    if (a[1] != "1") e++;

    if (a[2] != "2") e++;

    if (a[3] != "3") e++;

    if (length(a) != 3) e++;

    =\<less\>\\chunkref{pca-test.awk:summary}\<gtr\>

    \;

    parse_chunk_args("c-like", "joe, red", a, "");

    if (a[1] != "joe") e++;

    if (a[2] != "red") e++;

    if (length(a) != 2) e++;

    =\<less\>\\chunkref{pca-test.awk:summary}\<gtr\>

    \;

    parse_chunk_args("c-like", "${colour}", a, "");

    if (a[1] != "${colour}") e++;

    if (length(a) != 1) e++;

    =\<less\>\\chunkref{pca-test.awk:summary}\<gtr\>
  </nf-chunk||>

  Nested modes are identified by a backslash, a double or single quote,
  various bracket styles or a <verbatim|/*> comment.

  For each of these sub-modes modes we must also identify at a mode
  terminator, and any sub-modes or delimiters that may be entered<\footnote>
    Because we are using the sub-mode characters as the mode identifier it
    means we can't currently have a mode character dependant on it's context;
    i.e. <verbatim|{> can't behave differently when it is inside
    <verbatim|[>.
  </footnote>.

  <subsection|Backslash>

  The backslash mode has no submodes or delimiters, and is terminated by any
  character. Note that we are not so much interested in evaluating or
  interpolating content as we are in delineating content. It is no matter
  that a double backslash (<verbatim|\\\\>) may represent a single backslash
  while a backslash-newline may represent white space, but it does matter
  that the newline in a backslash newline should not be able to terminate a C
  pre-processor statement; and so the newline will be consumed by the
  backslash however it is to be interpreted.

  <nf-chunk|common-mode-definitions|modes[${language}, "\\\\",
  "terminators"]=".";||>

  <subsection|Strings>

  Common languages support two kinds of strings quoting, double quotes and
  single quotes.

  In a string we have one special mode, which is the backslash. This may
  escape an embedded quote and prevent us thinking that it should terminate
  the string.

  <\nf-chunk|mode:common-string>
    modes[${language}, "\\\\", "terminators"]=".";
  </nf-chunk||language>

  Otherwise, the string will be terminated by the same character that
  commenced it.

  <\nf-chunk|mode:common-string>
    modes[${language}, ${quote}, "terminators"]=${quote};
  </nf-chunk||language>

  In C type languages, certain escape sequences exist in strings. We need to
  define mechanism to enclode any chunks included in this mode using those
  escape sequences. These are expressed in two parts, s meaning search, and r
  meaning replace.

  The first substitution is to replace a backslash with a double backslash.
  We do this first as other substitutions may introduce a backslash which we
  would not then want to escape again here.

  Note: Backslashes need double-escaping in the search pattern but not in the
  replacement string, hence we are replacing a literal <verbatim|\\> with a
  literal <verbatim|\\\\>.

  <\nf-chunk-more>
    escapes[${language}, ${quote}, ++escapes[${language}, ${quote}],
    "s"]="\\\\\\\\";

    escapes[${language}, ${quote}, \ \ escapes[${language}, ${quote}],
    "r"]="\\\\\\\\";
  </nf-chunk-more>

  If the quote character occurs in the text, it should be preceded by a
  backslash, otherwise it would terminate the string unexpectedly.

  <\nf-chunk-more>
    escapes[${language}, ${quote}, ++escapes[${language}, ${quote}],
    "s"]=${quote};

    escapes[${language}, ${quote}, \ \ escapes[${language}, ${quote}],
    "r"]="\\\\" ${quote};
  </nf-chunk-more>

  Any newlines in the string, must be replaced by <verbatim|\\n>.

  <\nf-chunk-more>
    escapes[${language}, ${quote}, ++escapes[${language}, ${quote}],
    "s"]="\\n";

    escapes[${language}, ${quote}, \ \ escapes[${language}, ${quote}],
    "r"]="\\\\n";
  </nf-chunk-more>

  For the common modes, we define this string handling for double and single
  quotes.

  <\nf-chunk|common-mode-definitions>
    =\<less\>\\chunkref{mode:common-string}(${language},
    "\\textbackslash{}"")\<gtr\>

    =\<less\>\\chunkref{mode:common-string}(${language}, "'")\<gtr\>
  </nf-chunk||>

  Working strings should pass this test:

  <\nf-chunk|test:mode-definitions>
    parse_chunk_args("c-like", "say \\"I said, \\\\\\"Hello, how are
    you\\\\\\".\\", for me", a, "");

    if (a[1] != "say \\"I said, \\\\\\"Hello, how are you\\\\\\".\\"") e++;

    if (a[2] != "for me") e++;

    if (length(a) != 2) e++;

    =\<less\>\\chunkref{pca-test.awk:summary}\<gtr\>
  </nf-chunk||>

  <subsection|Parentheses, Braces and Brackets>

  Where quotes are closed by the same character, parentheses, brackets and
  braces are closed by an alternate character.

  <\nf-chunk|mode:common-brackets>
    modes[<nf-arg|language>, <nf-arg|open>, \ "submodes"
    ]="\\\\\\\\\|\\"\|{\|\\\\(\|\\\\[\|'\|/\\\\*";

    modes[<nf-arg|language>, <nf-arg|open>, \ "delimiters"]=" *, *";

    modes[<nf-arg|language>, <nf-arg|open>, \ "terminators"]=<nf-arg|close>;
  </nf-chunk||<tuple|language|open|close>>

  Note that the open is NOT a regex but the close token IS. <todo|When we can
  quote regex we won't have to put the slashes in here>

  <\nf-chunk|common-mode-definitions>
    =\<less\>\\chunkref{mode:common-brackets}(${language}, "{", "}")\<gtr\>

    =\<less\>\\chunkref{mode:common-brackets}(${language}, "[",
    "\\textbackslash{}\\textbackslash{}]")\<gtr\>

    =\<less\>\\chunkref{mode:common-brackets}(${language}, "(",
    "\\textbackslash{}\\textbackslash{})")\<gtr\>
  </nf-chunk||>

  <subsection|Customizing Standard Modes>

  <\nf-chunk|mode:add-submode>
    modes[${language}, ${mode}, "submodes"] = modes[${language}, ${mode},
    "submodes"] "\|" ${submode};
  </nf-chunk||<tuple|language|mode|submode>>

  <\nf-chunk|mode:add-escapes>
    escapes[${language}, ${mode}, ++escapes[${language}, ${mode}],
    "s"]=${search};

    escapes[${language}, ${mode}, \ \ escapes[${language}, ${mode}],
    "r"]=${replace};
  </nf-chunk||<tuple|language|mode|search|replace>>

  \;

  <subsection|Comments>

  We can define <verbatim|/* comment */> style comments and
  <verbatim|//comment> style comments to be added to any language:

  <\nf-chunk|mode:multi-line-comments>
    =\<less\>\\chunkref{mode:add-submode}(${language}, "",
    "/\\textbackslash{}\\textbackslash{}*")\<gtr\>

    modes[${language}, "/*", "terminators"]="\\\\*/";
  </nf-chunk||<tuple|language>>

  <\nf-chunk|mode:single-line-slash-comments>
    =\<less\>\\chunkref{mode:add-submode}(${language}, "", "//")\<gtr\>

    modes[${language}, "//", "terminators"]="\\n";

    =\<less\>\\chunkref{mode:add-escapes}(${language}, "//",
    "\\textbackslash{}n", "\\textbackslash{}n//")\<gtr\>
  </nf-chunk||language>

  We can also define <verbatim|# comment> style comments (as used in awk and
  shell scripts) in a similar manner.

  <todo|I'm having to use # for hash and \textbackslash{} for \ and have
  hacky work-arounds in the parser for now>

  <\nf-chunk|mode:add-hash-comments>
    =\<less\>\\chunkref{mode:add-submode}(${language}, "", "\\#")\<gtr\>

    modes[${language}, "#", "terminators"]="\\n";

    =\<less\>\\chunkref{mode:add-escapes}(${language}, "\\#",
    "\\textbackslash{}n", "\\textbackslash{}n\\#")\<gtr\>
  </nf-chunk||<tuple|language>>

  In C, the <verbatim|#> denotes pre-processor directives which can be
  multi-line

  <\nf-chunk|mode:add-hash-defines>
    =\<less\>\\chunkref{mode:add-submode}(${language}, "", "\\#")\<gtr\>

    modes[${language}, "#", "submodes" ]="\\\\\\\\";

    modes[${language}, "#", "terminators"]="\\n";

    =\<less\>\\chunkref{mode:add-escapes}(${language}, "\\#",
    "\\textbackslash{}n", "\\textbackslash{}\\textbackslash{}\\textbackslash{}\\textbackslash{}\\textbackslash{}n")\<gtr\>
  </nf-chunk||<tuple|language>>

  <\nf-chunk|mode:quote-dollar-escape>
    escapes[${language}, ${quote}, ++escapes[${language}, ${quote}],
    "s"]="\\\\$";

    escapes[${language}, ${quote}, \ \ escapes[${language}, ${quote}],
    "r"]="\\\\$";
  </nf-chunk||<tuple|language|quote>>

  We can add these definitions to various languages

  <\nf-chunk|mode-definitions>
    <nf-ref|common-mode-definitions|<tuple|"c-like">>

    \;

    <nf-ref|common-mode-definitions|<tuple|"c">>

    =\<less\>\\chunkref{mode:multi-line-comments}("c")\<gtr\>

    =\<less\>\\chunkref{mode:single-line-slash-comments}("c")\<gtr\>

    =\<less\>\\chunkref{mode:add-hash-defines}("c")\<gtr\>

    \;

    =\<less\>\\chunkref{common-mode-definitions}("awk")\<gtr\>

    =\<less\>\\chunkref{mode:add-hash-comments}("awk")\<gtr\>

    =\<less\>\\chunkref{mode:add-naked-regex}("awk")\<gtr\>
  </nf-chunk||>

  The awk definitions should allow a comment block like this:

  <nf-chunk|test:comment-quote|# Comment:
  =\<less\>\\chunkref{test:comment-text}\<gtr\>|awk|>

  <\nf-chunk|test:comment-text>
    Now is the time for

    the quick brown fox to bring lemonade

    to the party
  </nf-chunk||>

  to come out like this:

  <\nf-chunk|test:comment-quote:result>
    # Comment: Now is the time for

    #the quick brown fox to bring lemonade

    #to the party
  </nf-chunk||>

  The C definition for such a block should have it come out like this:

  <\nf-chunk|test:comment-quote:C-result>
    # Comment: Now is the time for\\

    the quick brown fox to bring lemonade\\

    to the party
  </nf-chunk||>

  <subsection|Regex>

  This pattern is incomplete, but meant to detect naked regular expressions
  in awk and perl; e.g. <verbatim|/.*$/>, however required capabilities are
  not present.

  Current it only detects regexes anchored with ^ as used in newfangle.

  For full regex support, modes need to be named not after their starting
  character, but some other more fully qualified name.

  <\nf-chunk|mode:add-naked-regex>
    =\<less\>\\chunkref{mode:add-submode}(${language}, "",
    "/\\textbackslash{}\\textbackslash{}\\^")\<gtr\>

    modes[${language}, "/^", "terminators"]="/";
  </nf-chunk||<tuple|language>>

  <subsection|Perl>

  <\nf-chunk|mode-definitions>
    =\<less\>\\chunkref{common-mode-definitions}("perl")\<gtr\>

    =\<less\>\\chunkref{mode:multi-line-comments}("perl")\<gtr\>

    =\<less\>\\chunkref{mode:add-hash-comments}("perl")\<gtr\>
  </nf-chunk||>

  Still need to add add <verbatim|s/>, submode <verbatim|/>, terminate both
  with <verbatim|//>. This is likely to be impossible as perl regexes can
  contain perl.

  <subsection|sh>

  <\nf-chunk|mode-definitions>
    =\<less\>\\chunkref{common-mode-definitions}("sh")\<gtr\>

    #\<less\>\\chunkref{mode:common-string}("sh",
    "\\textbackslash{}"")\<gtr\>

    #\<less\>\\chunkref{mode:common-string}("sh", "'")\<gtr\>

    =\<less\>\\chunkref{mode:add-hash-comments}("sh")\<gtr\>

    =\<less\>\\chunkref{mode:quote-dollar-escape}("sh", "\\"")\<gtr\>
  </nf-chunk||>

  <section|Some tests>

  Also, the parser must return any spare text at the end that has not been
  processed due to a mode terminator being found.

  <\nf-chunk|test:mode-definitions>
    rest = parse_chunk_args("c-like", "1, 2, 3) spare", a, "(");

    if (a[1] != 1) e++;

    if (a[2] != 2) e++;

    if (a[3] != 3) e++;

    if (length(a) != 3) e++;

    if (rest != " spare") e++;

    =\<less\>\\chunkref{pca-test.awk:summary}\<gtr\>
  </nf-chunk||>

  We must also be able to parse the example given earlier.

  <\nf-chunk|test:mode-definitions>
    parse_chunk_args("c-like", "things[x, y], get_other_things(a,
    \\"(all)\\"), 99", a, "(");

    if (a[1] != "things[x, y]") e++;

    if (a[2] != "get_other_things(a, \\"(all)\\")") e++;

    if (a[3] != "99") e++;

    if (length(a) != 3) e++;

    =\<less\>\\chunkref{pca-test.awk:summary}\<gtr\>
  </nf-chunk||>

  <section|A non-recursive mode tracker>

  <subsection|Constructor>

  The mode tracker holds its state in a stack based on a hash. This function,
  when passed an empty hash will intialize it.

  <\nf-chunk|new-mode-tracker()>
    function new_mode_tracker(context, language, mode) {

    \ \ context[""] = 0;

    \ \ context[0, "language"] = language;

    \ \ context[0, "mode"] = mode;

    }
  </nf-chunk||>

  Because awk functions cannot return an array, we must create the array
  first and pass it in, so we have a newfangle macro to do this:

  <\nf-chunk|new-mode-tracker>
    =\<less\>\\chunkref{awk-delete-array}(${context})\<gtr\>

    new_mode_tracker(${context}, ${language}, ${mode});
  </nf-chunk|awk|<tuple|context|language|mode>>

  <subsection|Management>

  And for tracking modes, we dispatch to a mode-tracker action based on the
  current language

  <\nf-chunk|mode_tracker>
    function push_mode_tracker(context, language, mode,

    \ \ # local vars

    \ \ top)

    {

    \ \ if (! ("" in context)) {

    \ \ \ \ =\<less\>\\chunkref{new-mode-tracker}(context, language,
    mode)\<gtr\>

    \ \ } else {

    \ \ \ \ top = context[""];

    \ \ \ \ if (context[top, "language"] == language && mode=="") mode =
    context[top, "mode"];

    \ \ \ \ top++;

    \ \ \ \ context[top, "language"] = language;

    \ \ \ \ context[top, "mode"] = mode;

    \ \ \ \ context[""] = top;

    \ \ }

    }
  </nf-chunk|awk|>

  <\nf-chunk|mode_tracker>
    function dump_mode_tracker(context, \ 

    \ \ c, d)

    {

    \ \ for(c=0; c \<less\>= context[""]; c++) {

    \ \ \ \ printf(" %2d \ \ %s:%s\\n", c, context[c, "language"], context[c,
    "mode"]) \<gtr\> "/dev/stderr";

    \ \ \ \ for(d=1; ( (c, "values", d) in context); d++) {

    \ \ \ \ \ \ printf(" \ \ %2d %s\\n", d, context[c, "values", d]) \<gtr\>
    "/dev/stderr";

    \ \ \ \ }

    \ \ }

    }
  </nf-chunk||>

  <\nf-chunk|mode_tracker>
    function finalize_mode_tracker(context)

    {

    \ \ if ( ("" in context) && context[""] != 0) return 0;

    \ \ return 1;

    }
  </nf-chunk||>

  This implies that any chunk must be syntactically whole; for instance, this
  is fine:

  <\nf-chunk|test:whole-chunk>
    if (1) {

    \ \ =\<less\>\\chunkref{test:say-hello}\<gtr\>

    }
  </nf-chunk||>

  <\nf-chunk|test:say-hello>
    print "hello";
  </nf-chunk||>

  But this is not fine; the chunk <nf-ref|test:hidden-else|> is not properly
  cromulent.

  <\nf-chunk|test:partial-chunk>
    if (1) {

    \ \ =\<less\>\\chunkref{test:hidden-else}\<gtr\>

    }
  </nf-chunk||>

  <\nf-chunk|test:hidden-else>
    \ \ print "I'm fine";

    } else {

    \ \ print "I'm not";
  </nf-chunk||>

  These tests will check for correct behaviour:

  <\nf-chunk|test:cromulence>
    echo Cromulence test

    passtest $NEWFANGLE -Rtest:whole-chunk $TEX_SRC &\<gtr\>/dev/null \|\| (
    echo "Whole chunk failed" && exit 1 )

    failtest $NEWFANGLE -Rtest:partial-chunk $TEX_SRC &\<gtr\>/dev/null \|\|
    ( echo "Partial chunk failed" && exit 1 )
  </nf-chunk||>

  <subsection|Tracker>

  We must avoid recursion as a language construct because we intend to employ
  mode-tracking to track language mode of emitted code, and the code is
  emitted from a function which is itself recursive, so instead we implement
  psuedo-recursion using our own stack based on a hash.

  <\nf-chunk|mode_tracker()>
    function mode_tracker(context, text, values,\ 

    \ \ # optional parameters

    \ \ # local vars

    \ \ mode, submodes, language,

    \ \ cindex, c, a, part, item, name, result, new_values, new_mode,\ 

    \ \ delimiters, terminators)

    {
  </nf-chunk|awk|>

  We could be re-commencing with a valid context, so we need to setup the
  state according to the last context.

  <\nf-chunk|mode_tracker()>
    \ \ cindex = context[""] + 0;

    \ \ mode = context[cindex, "mode"];

    \ \ language = context[cindex, "language" ];
  </nf-chunk||>

  First we construct a single large regex combining the possible sub-modes
  for the current mode along with the terminators for the current mode.

  <\nf-chunk|parse_chunk_args-reset-modes>
    \ \ submodes=modes[language, mode, "submodes"];

    \;

    \ \ if ((language, mode, "delimiters") in modes) {

    \ \ \ \ delimiters = modes[language, mode, "delimiters"];

    \ \ \ \ if (length(submodes)\<gtr\>0) submodes = submodes "\|";

    \ \ \ \ submodes=submodes delimiters;

    \ \ } else delimiters="";

    \ \ if ((language, mode, "terminators") in modes) {

    \ \ \ \ terminators = modes[language, mode, "terminators"];

    \ \ \ \ if (length(submodes)\<gtr\>0) submodes = submodes "\|";

    \ \ \ \ submodes=submodes terminators;

    \ \ } else terminators="";
  </nf-chunk||>

  If we don't find anything to match on --- probably because the language is
  not supported --- then we return the entire text without matching anything.

  <\nf-chunk|parse_chunk_args-reset-modes>
    \ if (! length(submodes)) return text;
  </nf-chunk||>

  <\nf-chunk|mode_tracker()>
    =\<less\>\\chunkref{parse_chunk_args-reset-modes}\<gtr\>
  </nf-chunk||>

  We then iterate the text (until there is none left) looking for sub-modes
  or terminators in the regex.

  <\nf-chunk|mode_tracker()>
    \ \ while((cindex \<gtr\>= 0) && length(text)) {

    \ \ \ \ if (match(text, "(" submodes ")", a)) {
  </nf-chunk||>

  A bug that creeps in regularly during development is bad regexes of zero
  length which result in an infinite loop (as no text is consumed), so I
  catch that right away with this test.

  <\nf-chunk|mode_tracker()>
    \ \ \ \ \ \ if (RLENGTH\<less\>1) {

    \ \ \ \ \ \ \ \ error(sprintf("Internal error, matched zero length
    submode, should be impossible - likely regex computation error\\n" \\

    \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ "Language=%s\\nmode=%s\\nmatch=%s\\n",
    language, mode, submodes));

    \ \ \ \ \ \ }
  </nf-chunk||>

  part is defined as the text up to the sub-mode or terminator, and this is
  appended to item --- which is the current text being gathered. If a mode
  has a delimiter, then item is reset each time a delimiter is found.

  <math|<wide|<with|mode|prog|"><wide*|hello|\<wide-underbrace\>><rsub|item>,
  <wide*|there|\<wide-underbrace\>><rsub|item><with|mode|prog|">|\<wide-overbrace\>><rsup|item>,
  \ <wide|he said.|\<wide-overbrace\>><rsup|item>>

  <\nf-chunk|mode_tracker()>
    \ \ \ \ \ \ part = substr(text, 1, RSTART -1);

    \ \ \ \ \ \ item = item part;
  </nf-chunk||>

  We must now determine what was matched. If it was a terminator, then we
  must restore the previous mode.

  <\nf-chunk|mode_tracker()>
    \ \ \ \ \ \ if (match(a[1], "^" terminators "$")) {

    #printf("%2d EXIT \ MODE [%s] by [%s] [%s]\\n", cindex, mode, a[1], text)
    \<gtr\> "/dev/stderr"

    \ \ \ \ \ \ \ \ context[cindex, "values", ++context[cindex, "values"]] =
    item;

    \ \ \ \ \ \ \ \ delete context[cindex];

    \ \ \ \ \ \ \ \ context[""] = --cindex;

    \ \ \ \ \ \ \ \ if (cindex\<gtr\>=0) {

    \ \ \ \ \ \ \ \ \ \ mode = context[cindex, "mode"];

    \ \ \ \ \ \ \ \ \ \ language = context[cindex, "language"];

    \ \ \ \ \ \ \ \ \ \ =\<less\>\\chunkref{parse_chunk_args-reset-modes}\<gtr\>

    \ \ \ \ \ \ \ \ }

    \ \ \ \ \ \ \ \ item = item a[1];

    \ \ \ \ \ \ \ \ text = substr(text, 1 + length(part) + length(a[1]));

    \ \ \ \ \ \ }
  </nf-chunk||>

  If a delimiter was matched, then we must store the current item in the
  parsed values array, and reset the item.

  <\nf-chunk|mode_tracker()>
    \ \ \ \ \ \ else if (match(a[1], "^" delimiters "$")) {

    \ \ \ \ \ \ \ \ if (cindex==0) {

    \ \ \ \ \ \ \ \ \ \ context[cindex, "values", ++context[cindex,
    "values"]] = item;

    \ \ \ \ \ \ \ \ \ \ item = "";

    \ \ \ \ \ \ \ \ } else {

    \ \ \ \ \ \ \ \ \ \ item = item a[1];

    \ \ \ \ \ \ \ \ }

    \ \ \ \ \ \ \ \ text = substr(text, 1 + length(part) + length(a[1]));

    \ \ \ \ \ \ }
  </nf-chunk||>

  otherwise, if a new submode is detected (all submodes have terminators), we
  must create a nested parse context until we find the terminator for this
  mode.

  <\nf-chunk|mode_tracker()>
    \ else if ((language, a[1], "terminators") in modes) {

    \ \ \ \ \ \ \ \ #check if new_mode is defined

    \ \ \ \ \ \ \ \ item = item a[1];

    #printf("%2d ENTER MODE [%s] in [%s]\\n", cindex, a[1], text) \<gtr\>
    "/dev/stderr"

    \ \ \ \ \ \ \ \ text = substr(text, 1 + length(part) + length(a[1]));

    \ \ \ \ \ \ \ \ context[""] = ++cindex;

    \ \ \ \ \ \ \ \ context[cindex, "mode"] = a[1];

    \ \ \ \ \ \ \ \ context[cindex, "language"] = language;

    \ \ \ \ \ \ \ \ mode = a[1];

    \ \ \ \ \ \ \ \ =\<less\>\\chunkref{parse_chunk_args-reset-modes}\<gtr\>

    \ \ \ \ \ \ } else {

    \ \ \ \ \ \ \ \ error(sprintf("Submode '%s' set unknown mode in text:
    %s\\nLanguage %s Mode %s\\n", a[1], text, language, mode));

    \ \ \ \ \ \ \ \ text = substr(text, 1 + length(part) + length(a[1]));

    \ \ \ \ \ \ }

    \ \ \ \ }
  </nf-chunk||>

  In the final case, we parsed to the end of the string. If the string was
  entire, then we should have no nested mode context, but if the string was
  just a fragment we may have a mode context which must be preserved for the
  next fragment. Todo: Consideration ought to be given if sub-mode strings
  are split over two fragments.

  <\nf-chunk|mode_tracker()>
    else {

    \ \ \ \ \ \ context[cindex, "values", ++context[cindex, "values"]] = item
    text;

    \ \ \ \ \ \ text = "";

    \ \ \ \ \ \ item = "";

    \ \ \ \ }

    \ \ }

    \;

    \ \ context["item"] = item;

    \;

    \ \ if (length(item)) context[cindex, "values", ++context[cindex,
    "values"]] = item;

    \ \ return text;

    }
  </nf-chunk||>

  <subsubsection|One happy chunk>

  All the mode tracker chunks are referred to here:

  <\nf-chunk|mode-tracker>
    =\<less\>\\chunkref{new_mode_tracker()}\<gtr\>

    =\<less\>\\chunkref{mode_tracker()}\<gtr\>
  </nf-chunk||>

  <subsubsection|Tests>

  We can test this function like this:

  <\nf-chunk|pca-test.awk>
    =\<less\>\\chunkref{error()}\<gtr\>

    =\<less\>\\chunkref{mode-tracker}\<gtr\>

    =\<less\>\\chunkref{parse_chunk_args()}\<gtr\>

    BEGIN {

    \ \ SUBSEP=".";

    \ \ =\<less\>\\chunkref{mode-definitions}\<gtr\>

    \;

    \ \ =\<less\>\\chunkref{test:mode-definitions}\<gtr\>

    }
  </nf-chunk|awk|>

  <\nf-chunk|pca-test.awk:summary>
    if (e) {

    \ \ printf "Failed " e

    \ \ for (b in a) {

    \ \ \ \ print "a[" b "] =\<gtr\> " a[b];

    \ \ }

    } else {

    \ \ print "Passed"

    }

    split("", a);

    e=0;
  </nf-chunk|awk|>

  which should give this output:

  <\nf-chunk|pca-test.awk-results>
    a[foo.quux.quirk] =\<gtr\>\ 

    a[foo.quux.a] =\<gtr\> fleeg

    a[foo.bar] =\<gtr\> baz

    a[etc] =\<gtr\>\ 

    a[name] =\<gtr\> freddie
  </nf-chunk||>

  <section|Escaping and Quoting>

  Each nested mode can optionally define a set of transforms to be applied to
  any text that is included from another language.

  This code can perform transforms

  <\nf-chunk|mode_tracker>
    function transform_escape(s, r, text,

    \ \ \ \ # optional

    \ \ \ \ max,\ 

    \ \ \ \ \ \ \ \ # local vars

    \ \ \ \ \ \ \ \ c)

    {

    \ \ for(c=1; c \<less\>= max && (c in s); c++) {

    \ \ \ \ gsub(s[c], r[c], text);

    \ \ }

    \ \ return text;

    }
  </nf-chunk|awk|>

  This function must append from index c onwards, and escape transforms from
  the supplied context, and return c + number of new transforms.

  <\nf-chunk|mode_tracker>
    function mode_escaper(context, s, r, src,

    \ \ c, cp, cpl)

    {

    \ \ \ \ \ \ \ \ for(c = context[""]; c \<gtr\>= 0; c--) {

    \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ if ( (context[c, "language"], context[c,
    "mode"]) in escapes) {

    \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ cpl = escapes[context[c,
    "language"], context[c, "mode"]];

    \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ for (cp = 1; cp \<less\>=
    cpl; cp ++) {

    \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ ++src;

    \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ s[src] =
    escapes[context[c, "language"], context[c, "mode"], cp, "s"];

    \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ r[src] =
    escapes[context[c, "language"], context[c, "mode"], cp, "r"];

    \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ }

    \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ }

    \ \ \ \ \ \ \ \ }

    \ \ \ \ \ \ \ \ return src;

    }

    function dump_escaper(c, s, r, cc) {

    \ \ for(cc=1; cc\<less\>=c; cc++) {

    \ \ \ \ printf("%2d s[%s] r[%s]\\n", cc, s[cc], r[cc]) \<gtr\>
    "/dev/stderr"

    \ \ }

    }
  </nf-chunk|awk|>

  <\nf-chunk|test:escapes>
    echo escapes test

    passtest $NEWFANGLE -Rtest:comment-quote $TEX_SRC &\<gtr\>/dev/null \|\|
    ( echo "Comment-quote failed" && exit 1 )
  </nf-chunk|sh|>

  <chapter|Recognizing Chunks>

  Newfangle recognizes noweb chunks, but as we also want better <LaTeX>
  integration we will recognize any of these:

  <\itemize>
    <item>notangle chunks matching the pattern
    <verbatim|^\<less\>\<less\>.*?\<gtr\>\<gtr\>=>

    <item>chunks beginning with <verbatim|\\begin{lstlistings}>, possibly
    with <verbatim|\\Chunk{...}> on the previous line

    <item>an older form I have used, beginning with
    <verbatim|\\begin{Chunk}[options]> --- also more suitable for plain
    <LaTeX> users<\footnote>
      Is there such a thing as plain <LaTeX>?
    </footnote>.
  </itemize>

  <section|Chunk start>

  The variable chunking is used to signify that we are processing a code
  chunk and not document. In such a state, input lines will be assigned to
  the current chunk; otherwise they are ignored.

  <subsection|lstlistings>

  Our current scheme is to recognize the new lstlisting chunks, but these may
  be preceded by a <verbatim|\\Chunk> command which in <LyX> is a more
  convenient way to pass the chunk name to the
  <verbatim|\\begin{lstlistings}> command, and a more visible way to specify
  other <verbatim|lstset> settings.

  The arguments to the <verbatim|\\Chunk> command are a name, and then a
  comma-seperated list of key-value pairs after the manner of
  <verbatim|\\lstset>. (In fact within the <LaTeX> <verbatim|\\Chunk> macro
  (section <reference|sub:The-chunk-command>) the text <verbatim|name=> is
  prefixed to the argument which is then literally passed to
  <verbatim|\\lstset>).

  <\nf-chunk|recognize-chunk>
    /^\\\\Chunk{/ {

    \ \ if (match($0, "^\\\\\\\\Chunk{ *([^ ,}]*),?(.*)}", line)) {

    \ \ \ \ next_chunk_name = line[1];

    \ \ \ \ get_chunk_args(line[2], next_chunk_args);

    \ \ }

    \ \ next;

    }
  </nf-chunk|awk|>

  We also make a basic attempt to parse the name out of the
  <verbatim|\\lstlistings[name=chunk-name]> text, otherwise we fall back to
  the name found in the previous chunk command. This attempt is very basic
  and doesn't support commas or spaces or square brackets as part of the
  chunkname. We also recognize <verbatim|\\begin{Chunk}> which is convenient
  for some users<\footnote>
    but not yet supported in the <LaTeX> macros
  </footnote>.

  <\nf-chunk|recognize-chunk>
    /^\\\\begin{lstlisting}\|^\\\\begin{Chunk}/ {

    \ \ if (match($0, "}.*[[,] *name= *{? *([^], }]*)", line)) {

    \ \ \ \ new_chunk(line[1]);

    \ \ } else {

    \ \ \ \ new_chunk(next_chunk_name, next_chunk_args);

    \ \ }

    \ \ chunking=1;

    \ \ next;

    }
  </nf-chunk||>

  <subsection|Noweb>

  We recognize notangle style chunks too:

  <\nf-chunk|recognize-chunk>
    /^[\<less\>]\<less\>.*[\<gtr\>]\<gtr\>=/ {

    \ \ if (match($0, "^[\<less\>]\<less\>(.*)[\<gtr\>]\<gtr\>= *$", line)) {

    \ \ \ \ chunking=1;

    \ \ \ \ notangle_mode=1;

    \ \ \ \ new_chunk(line[1]);

    \ \ \ \ next;

    \ \ }

    }
  </nf-chunk|awk|>

  <section|Chunk end>

  Likewise, we need to recognize when a chunk ends.

  <subsection|lstlistings>

  The <verbatim|e> in <verbatim|[e]nd{lislisting}> is surrounded by square
  brackets so that when this document is processed, this chunk doesn't
  terminate early when the lstlistings package recognizes it's own
  end-string!<\footnote>
    This doesn't make sense as the regex is anchored with ^, which this line
    does not begin with!
  </footnote>

  <\nf-chunk|recognize-chunk>
    /^\\\\[e]nd{lstlisting}\|^\\\\[e]nd{Chunk}/ {

    \ \ chunking=0;

    \ \ active_chunk="";

    \ \ next;

    }
  </nf-chunk||>

  <subsection|noweb>

  <\nf-chunk|recognize-chunk>
    /^@ *$/ {

    \ \ chunking=0;

    \ \ active_chunk="";

    }
  </nf-chunk||>

  All other recognizers are only of effect if we are chunking; there's no
  point in looking at lines if they aren't part of a chunk, so we just ignore
  them as efficiently as we can.

  <\nf-chunk|recognize-chunk>
    ! chunking { next; }
  </nf-chunk||>

  <section|Chunk contents>

  Chunk contents are any lines read while <verbatim|chunking> is true. Some
  chunk contents are special in that they refer to other chunks, and will be
  replaced by the contents of these chunks when the file is generated.

  <label|sub:ORS-chunk-text>We add the output record separator <verbatim|ORS>
  to the line now, because we will set <verbatim|ORS> to the empty string
  when we generate the output<\footnote>
    So that we can partial print lines using <verbatim|print> instead of
    <verbatim|printf>. <todo|This does't make sense>
  </footnote>.

  <\nf-chunk|recognize-chunk>
    length(active_chunk) {

    \ \ =\<less\>\\chunkref{process-chunk-tabs}\<gtr\>

    \ \ =\<less\>\\chunkref{process-chunk}\<gtr\>

    }
  </nf-chunk||>

  If a chunk just consisted of plain text, we could handle the chunk like
  this:

  <\nf-chunk|process-chunk-simple>
    chunk_line(active_chunk, $0 ORS);
  </nf-chunk||>

  but in fact a chunk can include references to other chunks. Chunk includes
  are traditionally written as <verbatim|\<less\>\<less\>chunk-name\<gtr\>\<gtr\>>
  but we support other variations, some of which are more suitable for
  particular editing systems.

  However, we also process tabs at this point, a tab at input can be replaced
  by a number of spaces defined by the <verbatim|tabs> variable, set by the
  <verbatim|-T> option. Of course this is poor tab behaviour, we should
  probably have the option to use proper counted tab-stops and process this
  on output.

  <\nf-chunk|process-chunk-tabs>
    if (length(tabs)) {

    \ \ gsub("\\t", tabs);

    }
  </nf-chunk||>

  <subsection|lstlistings><label|sub:lst-listings-includes>

  If <verbatim|\\lstset{escapeinside={=\<less\>}{\<gtr\>}}> is set, then we
  can use <verbatim|=\<less\>\\chunkref{chunk-name}\<gtr\>> in listings. The
  sequence <verbatim|=\<less\>> was chosen because:

  <\enumerate>
    <item>it is a better mnemonic than <verbatim|\<less\>\<less\>chunk-name\<gtr\>\<gtr\>>
    in that the <verbatim|=> sign signifies equivalence or substitutability.

    <item>and because <verbatim|=\<less\>> is not valid in C or any language
    I can think of.

    <item>and also because lstlistings doesn't like <verbatim|\<gtr\>\<gtr\>>
    as an end delimiter for the <em|texcl> escape, so we must make do with a
    single <verbatim|\<gtr\>> which is better complemented by
    <verbatim|=\<less\>> than by <verbatim|\<less\>\<less\>>.
  </enumerate>

  Unfortunately the <verbatim|=\<less\>...\<gtr\>> that we use re-enters a
  <LaTeX> parsing mode in which some characters are special, e.g. <verbatim|#
  \\> and so these cause trouble if used in arguments to
  <verbatim|\\chunkref>. At some point I must fix the <LaTeX> command
  <verbatim|\\chunkref> so that it can accept these literally, but until
  then, when writing chunkref argumemts that need these characters, I must
  use the forms <verbatim|\\textbackslash{}> and <verbatim|\\#>; so I also
  define a hacky chunk <verbatim|delatex> to be used further on whose purpose
  it is to remove these from any arguments parsed by newfangle.

  <\nf-chunk|delatex>
    # FILTHY HACK

    gsub("\\\\\\\\#", "#", ${text});

    gsub("\\\\\\\\textbackslash{}", "\\\\", ${text});

    gsub("\\\\\\\\\\\\^", "^", ${text});
  </nf-chunk||<tuple|text>>

  As each chunk line may contain more than one chunk include, we will split
  out chunk includes in an iterative fashion<\footnote>
    Contrary to our use of split when substituting parameters in chapter
    <reference|Here-we-split>
  </footnote>.

  First, as long as the chunk contains a <verbatim|\\chunkref> command we
  take as much as we can up to the first <verbatim|\\chunkref> command.

  <\nf-chunk|process-chunk>
    chunk = $0;

    indent = 0;

    while(match(chunk,\ 

    \ \ \ \ \ \ \ \ \ \ \ \ "([=]\<less\>\\\\\\\\chunkref{([^}\<gtr\>]*)}(\\\\(.*\\\\)\|)\<gtr\>\|\<less\>\<less\>([a-zA-Z_][-a-zA-Z0-9_]*)\<gtr\>\<gtr\>)",\ 

    \ \ \ \ \ \ \ \ \ \ \ \ line)\\

    ) {

    \ \ chunklet = substr(chunk, 1, RSTART - 1);
  </nf-chunk||>

  We keep track of the indent count, by counting the number of literal
  characters found. We can then preserve this indent on each output line when
  multi-line chunks are expanded.

  We then process this first part literal text, and set the chunk which is
  still to be processed to be the text after the <verbatim|\\chunkref>
  command, which we will process next as we continue around the loop.

  <\nf-chunk|process-chunk>
    \ \ indent += length(chunklet);

    \ \ chunk_line(active_chunk, chunklet);

    \ \ chunk = substr(chunk, RSTART + RLENGTH);
  </nf-chunk||>

  We then consider the type of chunk command we have found, whether it is the
  newfangle style command beginning with <verbatim|=\<less\>> the older
  notangle style beginning with <verbatim|\<less\>\<less\>>.

  Newfangle chunks may have parameters contained within square brackets.
  These will be matched in <verbatim|line[3]> and are considered at this
  stage of processing to be part of the name of the chunk to be included.

  <\nf-chunk|process-chunk>
    \ \ if (substr(line[1], 1, 1) == "=") {

    \ \ \ \ # chunk name up to }

    \ \ \ \ \ \ \ \ =\<less\>\\chunkref{delatex}(line[3])\<gtr\>

    \ \ \ \ chunk_include(active_chunk, line[2] line[3], indent);

    \ \ } else if (substr(line[1], 1, 1) == "\<less\>") {

    \ \ \ \ chunk_include(active_chunk, line[4], indent);

    \ \ } else {

    \ \ \ \ error("Unknown chunk fragment: " line[1]);

    \ \ }
  <|nf-chunk>
    \;

    \;
  </nf-chunk|>

  The loop will continue until there are no more chunkref statements in the
  text, at which point we process the final part of the chunk.

  <\nf-chunk|process-chunk>
    }

    chunk_line(active_chunk, chunk);
  </nf-chunk||>

  <label|lone-newline>We add the newline character as a chunklet on it's own,
  to make it easier to detect new lines and thus manage indentation when
  processing the output.

  <\nf-chunk|process-chunk>
    chunk_line(active_chunk, "\n");
  <|nf-chunk>
    \;
  </nf-chunk|>

  We will also permit a chunk-part number to follow in square brackets, so
  that <verbatim|=\<less\>\\chunkref{chunk-name[1]}\<gtr\>> will refer to the
  first part only. This can make it easy to include a C function prototype in
  a header file, if the first part of the chunk is just the function
  prototype without the trailing semi-colon. The header file would include
  the prototype with the trailing semi-colon, like this:

  <verbatim|=\<less\>\\chunkref{chunk-name[1]}\<gtr\>>

  This is handled in section <reference|sub:Chunk-parts>

  We should perhaps introduce a notion of language specific chunk options; so
  that perhaps we could specify:

  <verbatim|=\<less\>\\chunkref{chunk-name[function-declaration]}>

  which applies a transform <verbatim|function-declaration> to the chunk ---
  which in this case would extract a function prototype from a function.
  <todo|Do it>

  <chapter|Processing Options>

  At the start, first we set the default options.

  <\nf-chunk|default-options>
    debug=0;

    linenos=0;

    notangle_mode=0;

    root="*";

    tabs = "";
  </nf-chunk||>

  Then we use getopt the standard way, and null out ARGV afterwards in the
  normal AWK fashion.

  <\nf-chunk|read-options>
    Optind = 1 \ \ \ # skip ARGV[0]

    while(getopt(ARGC, ARGV, "R:LdT:hr")!=-1) {

    \ \ =\<less\>\\chunkref{handle-options}\<gtr\>

    }

    for (i=1; i\<less\>Optind; i++) { ARGV[i]=""; }
  </nf-chunk||>

  This is how we handle our options:

  <\nf-chunk|handle-options>
    if (Optopt == "R") root = Optarg;

    else if (Optopt == "r") root="";

    else if (Optopt == "L") linenos = 1;

    else if (Optopt == "d") debug = 1;

    else if (Optopt == "T") tabs = indent_string(Optarg+0);

    else if (Optopt == "h") help();

    else if (Optopt == "?") help();
  </nf-chunk||>

  We do all of this at the beginning of the program

  <\nf-chunk|begin>
    BEGIN {

    \ \ =\<less\>\\chunkref{constants}\<gtr\>

    \ \ =\<less\>\\chunkref{mode-definitions}\<gtr\>

    \ \ =\<less\>\\chunkref{default-options}\<gtr\>

    \;

    \ \ =\<less\>\\chunkref{read-options}\<gtr\>

    }
  </nf-chunk||>

  And have a simple help function

  <\nf-chunk|help()>
    function help() {

    \ \ print "Usage:"

    \ \ print " \ newfangle [-L] -R\<less\>rootname\<gtr\> [source.tex ...]"

    \ \ print " \ newfangle -r [source.tex ...]"

    \ \ print " \ If the filename, source.tex is not specified then stdin is
    used"

    \ \ print

    \ \ print "-L causes the C statement: #line \<less\>lineno\<gtr\>
    \\"filename\\"" to be issued"

    \ \ print "-R causes the named root to be written to stdout"

    \ \ print "-r lists all roots in the file (even those used elsewhere)"

    \ \ exit 1;

    }
  </nf-chunk||>

  <chapter|Generating the Output>

  We generate output by calling output_chunk, or listing the chunk names.

  <\nf-chunk|generate-output>
    if (length(root)) output_chunk(root);

    else output_chunk_names();
  </nf-chunk||>

  We also have some other output debugging:

  <\nf-chunk|debug-output>
    if (debug) {

    \ \ print "------ chunk names "

    \ \ output_chunk_names();

    \ \ print "====== chunks"

    \ \ output_chunks();

    \ \ print "++++++ debug"

    \ \ for (a in chunks) {

    \ \ \ \ print a "=" chunks[a];

    \ \ }

    }
  </nf-chunk||>

  We do both of these at the end. We also set <verbatim|ORS=""> because each
  chunklet is not necessarily a complete line, and we already added
  <verbatim|ORS> to each input line in section
  <reference|sub:ORS-chunk-text>.

  <\nf-chunk|end>
    END {

    \ \ =\<less\>\\chunkref{debug-output}\<gtr\>

    \ \ ORS="";

    \ \ =\<less\>\\chunkref{generate-output}\<gtr\>

    }
  </nf-chunk||>

  We write chunk names like this. If we seem to be running in notangle
  compatibility mode, then we enclose the name like this
  <verbatim|\<less\>\<less\>name\<gtr\>\<gtr\>> the same way notangle does:

  <\nf-chunk|output_chunk_names()>
    function output_chunk_names( \ \ c, prefix, suffix)\ 

    {

    \ \ if (notangle_mode) {

    \ \ \ \ prefix="\<less\>\<less\>";

    \ \ \ \ suffix="\<gtr\>\<gtr\>";

    \ \ }

    \ \ for (c in chunk_names) {

    \ \ \ \ print prefix c suffix "\\n";

    \ \ }

    }
  </nf-chunk||>

  This function would write out all chunks

  <\nf-chunk|output_chunks()>
    function output_chunks( \ a)\ 

    {

    \ \ for (a in chunk_names) {

    \ \ \ \ output_chunk(chunk_names[a]);

    \ \ }

    }

    \;

    function output_chunk(chunk) {

    \ \ newline = 1;

    \ \ lineno_needed = linenos;

    \;

    \ \ write_chunk(chunk);

    }

    \;
  </nf-chunk||>

  <section|Assembling the Chunks>

  <verbatim|chunk_path> holds a string consisting of the names of all the
  chunks that resulted in this chunk being output. It should probably also
  contain the source line numbers at which each inclusion also occured.

  We first initialize the mode tracker for this chunk.

  <\nf-chunk|write_chunk()>
    function write_chunk(chunk_name) {

    \ \ =\<less\>\\chunkref{awk-delete-array}(context)\<gtr\>

    \ \ return write_chunk_r(chunk_name, context);

    }

    \;

    function write_chunk_r(chunk_name, context, indent, tail,

    \ \ # optional vars

    \ \ <with|font-shape|italic|chunk-path>, chunk_args,\ 

    \ \ s, r, src, new_src,\ 

    \ \ # local vars

    \ \ chunk_params, part, max_part, part_line, frag, max_frag, text,\ 

    \ \ chunklet, only_part, call_chunk_args, new_context)

    {
  </nf-chunk||>

  <subsection|Chunk Parts><label|sub:Chunk-parts>

  As mentioned in section <reference|sub:lstlistings-includes>, a chunk name
  may contain a part specifier in square brackets, limiting the parts that
  should be emitted.

  <\nf-chunk|write_chunk()>
    \ \ if (match(chunk_name, "^(.*)\\\\[([0-9]*)\\\\]$", chunk_name_parts))
    {

    \ \ \ \ chunk_name = chunk_name_parts[1];

    \ \ \ \ only_part = chunk_name_parts[2];

    \ \ }
  </nf-chunk||>

  We then create a mode tracker

  <\nf-chunk|write_chunk()>
    \ =\<less\>\\chunkref{new-mode-tracker}(context, chunks[chunk_name,
    "language"], "")\<gtr\>
  </nf-chunk||>

  We extract into <verbatim|chunk_params> the names of the parameters that
  this chunk accepts, whose values were (optionally) passed in
  <verbatim|chunk_args>.

  <\nf-chunk|write_chunk()>
    \ split(chunks[chunk_name, "params"], chunk_params, " *; *");
  </nf-chunk||>

  To assemble a chunk, we write out each part.

  <\nf-chunk|write_chunk()>
    \ \ if (! (chunk_name in chunk_names)) {

    \ \ \ \ error(sprintf(_"The root module \<less\>\<less\>%s\<gtr\>\<gtr\>
    was not defined.\\nUsed by: %s",\\

    \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ chunk_name, chunk_path));

    \ \ }

    \;

    \ \ max_part = chunks[chunk_name, "part"];

    \ \ for(part = 1; part \<less\>= max_part; part++) {

    \ \ \ \ if (! only_part \|\| part == only_part) {

    \ \ \ \ \ \ =\<less\>\\chunkref{write-part}\<gtr\>

    \ \ \ \ }

    \ \ }

    \ \ if (! finalize_mode_tracker(context)) {

    \ \ \ \ dump_mode_tracker(context);

    \ \ \ \ error(sprintf(_"Module %s did not close context properly.\\nUsed
    by: %s\\n", chunk_name, chunk_path));

    \ \ }

    }
  </nf-chunk||>

  A part can either be a chunklet of lines, or an include of another chunk.

  Chunks may also have parameters, specified in LaTeX style with braces after
  the chunk name --- looking like this in the document: chunkname{param1,
  param2}. Arguments are passed in square brackets:
  <verbatim|\\chunkref{chunkname}[arg1, arg2]>.

  Before we process each part, we check that the source position hasn't
  changed unexpectedly, so that we can know if we need to output a new
  file-line directive.

  <\nf-chunk|write-part>
    =\<less\>\\chunkref{check-source-jump}\<gtr\>

    \;

    chunklet = chunks[chunk_name, "part", part];

    if (chunks[chunk_name, "part", part, "type"] == part_type_chunk) {

    \ \ =\<less\>\\chunkref{write-included-chunk}\<gtr\>

    } else if (chunklet SUBSEP "line" in chunks) {

    \ \ =\<less\>\\chunkref{write-chunklets}\<gtr\>

    } else {

    \ \ # empty last chunklet

    }
  </nf-chunk||>

  To write an included chunk, we must detect any optional chunk arguments in
  parenthesis. Then we recurse calling <verbatim|write_chunk()>.

  <\nf-chunk|write-included-chunk>
    if (match(chunklet, "^([^\\\\[\\\\(]*)\\\\((.*)\\\\)$", chunklet_parts))
    {

    \ \ chunklet = chunklet_parts[1];

    \ \ parse_chunk_args("c-like", chunklet_parts[2], call_chunk_args, "(");

    \ \ for (c in call_chunk_args) {

    \ \ \ \ call_chunk_args[c] = expand_chunk_args(call_chunk_args[c],
    chunk_params, chunk_args);

    \ \ }

    } else {

    \ \ split("", call_chunk_args);

    }

    # update the transforms arrays

    new_src = mode_escaper(context, s, r, src);

    =\<less\>\\chunkref{awk-delete-array}(new_context)\<gtr\>

    write_chunk_r(chunklet, new_context,

    \ \ \ \ \ \ \ \ \ \ \ \ chunks[chunk_name, "part", part, "indent"]
    indent,

    \ \ \ \ \ \ \ \ \ \ \ \ chunks[chunk_name, "part", part, "tail"],

    \ \ \ \ \ \ \ \ \ \ \ \ chunk_path "\\n \ \ \ \ \ \ \ \ " chunk_name,

    \ \ \ \ \ \ \ \ \ \ \ \ call_chunk_args,

    \ \ \ \ \ \ \ \ \ \ \ \ s, r, new_src);
  </nf-chunk||>

  Before we output a chunklet of lines, we first emit the file and line
  number if we have one, and if it is safe to do so.

  Chunklets are generally broken up by includes, so the start of a chunklet
  is a good place to do this. Then we output each line of the chunklet.

  When it is not safe, such as in the middle of a multi-line macro
  definition, <verbatim|lineno_suppressed> is set to true, and in such a case
  we note that we want to emit the line statement when it is next safe.

  <\nf-chunk|write-chunklets>
    max_frag = chunks[chunklet, "line"];

    for(frag = 1; frag \<less\>= max_frag; frag++) {

    \ \ =\<less\>\\chunkref{write-file-line}\<gtr\>
  </nf-chunk||>

  We then extract the chunklet text and expand any arguments.

  <\nf-chunk|write-chunklets>
    \;

    \ \ text = chunks[chunklet, frag];

    \ 

    \ \ /* check params */

    \ \ text = expand_chunk_args(text, chunk_params, chunk_args);
  </nf-chunk||>

  If the text is a single newline (which we keep separate - see
  <reference|lone-newline>) then we increment the line number. In the case
  where this is the last line of a chunk and it is not a top-level chunk we
  replace the newline with an empty string --- because the chunk that
  included this chunk will have the newline at the end of the line that
  included this chunk.

  We also note by <verbatim|newline = 1> that we have started a new line, so
  that indentation can be managed with the following piece of text.

  <\nf-chunk|write-chunklets>
    \;

    \ if (text == "\\n") {

    \ \ \ \ lineno++;

    \ \ \ \ if (part == max_part && frag == max_frag && length(chunk_path)) {

    \ \ \ \ \ \ text = "";

    \ \ \ \ \ \ break;

    \ \ \ \ } else {

    \ \ \ \ \ \ newline = 1;

    \ \ \ \ }
  </nf-chunk||>

  If this text does not represent a newline, but we see that we are the first
  piece of text on a newline, then we prefix our text with the current
  indent.\ 

  <\note>
    <verbatim|newline> is a global output-state variable, but the
    <verbatim|indent> is not.
  </note>

  <\nf-chunk|write-chunklets>
    \ \ } else if (length(text) \|\| length(tail)) {

    \ \ \ \ if (newline) text = indent text;

    \ \ \ \ newline = 0;

    \ \ }

    \;
  </nf-chunk||>

  Tail will soon no longer be relevant once mode-detection is in place.

  <\nf-chunk|write-chunklets>
    \ \ text = text tail;

    \ \ mode_tracker(context, text);

    \ \ print transform_escape(s, r, text, src);
  </nf-chunk||>

  If a line ends in a backslash --- suggesting continuation --- then we
  supress outputting file-line as it would probably break the continued
  lines.

  <\nf-chunk|write-chunklets>
    \ \ if (linenos) {

    \ \ \ \ lineno_suppressed = substr(lastline, length(lastline)) == "\\\\";

    \ \ }

    }
  </nf-chunk||>

  Of course there is no point in actually outputting the source filename and
  line number (file-line) if they don't say anything new! We only need to
  emit them if they aren't what is expected, or if we we not able to emit one
  when they had changed.

  <\nf-chunk|write-file-line>
    if (newline && lineno_needed && ! lineno_suppressed) {

    \ \ filename = a_filename;

    \ \ lineno = a_lineno;

    \ \ print "#line " lineno " \\"" filename "\\"\\n"

    \ \ lineno_needed = 0;

    }
  </nf-chunk||>

  We check if a new file-line is needed by checking if the source line
  matches what we (or a compiler) would expect.

  <\nf-chunk|check-source-jump>
    if (linenos && (chunk_name SUBSEP "part" SUBSEP part SUBSEP "FILENAME" in
    chunks)) {

    \ \ a_filename = chunks[chunk_name, "part", part, "FILENAME"];

    \ \ a_lineno = chunks[chunk_name, "part", part, "LINENO"];

    \ \ if (a_filename != filename \|\| a_lineno != lineno) {

    \ \ \ \ lineno_needed++;

    \ \ }

    }
  </nf-chunk||>

  <chapter|Storing Chunks>

  Awk has pretty limited data structures, so we will use two main hashes.
  Uninterrupted sequences of a chunk will be stored in chunklets and the
  chunklets used in a chunk will be stored in <verbatim|chunks>.

  <\nf-chunk|constants>
    part_type_chunk=1;

    SUBSEP=",";
  </nf-chunk||>

  The params mentioned are not chunk parameters for parameterized chunks, as
  mentioned in <reference|Chunk Arguments>, but the lstlistings style
  parameters used in the <verbatim|\\Chunk> command<\footnote>
    The <verbatim|params> parameter is used to hold the parameters for
    parameterized chunks
  </footnote>.

  <\nf-chunk|chunk-storage-functions>
    function new_chunk(chunk_name, params,

    \ \ # local vars

    \ \ p, append )

    {

    \ \ # HACK WHILE WE CHANGE TO ( ) for PARAM CHUNKS

    \ \ gsub("\\\\(\\\\)$", "", chunk_name);

    \ \ if (! (chunk_name in chunk_names)) {

    \ \ \ \ if (debug) print "New chunk " chunk_name;

    \ \ \ \ chunk_names[chunk_name];

    \ \ \ \ for (p in params) {

    \ \ \ \ \ \ chunks[chunk_name, p] = params[p];

    \ \ \ \ }

    \ \ \ \ if ("append" in params) {

    \ \ \ \ \ \ append=params["append"];

    \ \ \ \ \ \ if (! (append in chunk_names)) {

    \ \ \ \ \ \ \ \ warning("Chunk " chunk_name " is appended to chunk "
    append " which is not defined yet");

    \ \ \ \ \ \ \ \ new_chunk(append);

    \ \ \ \ \ \ }

    \ \ \ \ \ \ chunk_include(append, chunk_name);

    \ \ \ \ \ \ chunk_line(append, ORS);

    \ \ \ \ }

    \ \ }

    \ \ active_chunk = chunk_name;

    \ \ prime_chunk(chunk_name);

    }
  </nf-chunk||>

  <\nf-chunk|chunk-storage-functions>
    \;

    function prime_chunk(chunk_name)

    {

    \ \ chunks[chunk_name, "part", ++chunks[chunk_name, "part"] ] = \\

    \ \ \ \ \ \ \ \ \ chunk_name SUBSEP "chunklet" SUBSEP ""
    ++chunks[chunk_name, "chunklet"];

    \ \ chunks[chunk_name, "part", chunks[chunk_name, "part"], "FILENAME"] =
    FILENAME;

    \ \ chunks[chunk_name, "part", chunks[chunk_name, "part"], "LINENO"] =
    FNR + 1;

    }

    \;

    function chunk_line(chunk_name, line){

    \ \ chunks[chunk_name, "chunklet", chunks[chunk_name, "chunklet"],

    \ \ \ \ \ \ \ \ \ ++chunks[chunk_name, "chunklet", chunks[chunk_name,
    "chunklet"], "line"] \ ] = line;

    }

    \;
  </nf-chunk||>

  Chunk include represents a <em|chunkref> statement, and stores the
  requirement to include another chunk. The parameter indent represents the
  quanity of literal text characters that preceded this <em|chunkref>
  statement and therefore by how much additional lines of the included chunk
  should be indented.

  <\nf-chunk|chunk-storage-functions>
    function chunk_include(chunk_name, chunk_ref, indent, tail)

    {

    \ \ chunks[chunk_name, "part", ++chunks[chunk_name, "part"] ] =
    chunk_ref;

    \ \ chunks[chunk_name, "part", chunks[chunk_name, "part"], "type" ] =
    part_type_chunk;

    \ \ chunks[chunk_name, "part", chunks[chunk_name, "part"], "indent" ] =
    indent_string(indent);

    \ \ chunks[chunk_name, "part", chunks[chunk_name, "part"], "tail" ] =
    tail;

    \ \ prime_chunk(chunk_name);

    }

    \;
  </nf-chunk||>

  The indent is calculated by indent_string, which may in future convert some
  spaces into tab characters. This function works by generating a printf
  padded format string, like <verbatim|%22s> for an indent of 22, and then
  printing an empty string using that format.

  <\nf-chunk|chunk-storage-functions>
    function indent_string(indent) {

    \ \ return sprintf("%" indent "s", "");

    }
  </nf-chunk||>

  <chapter|getopt><label|cha:getopt>

  I use Arnold Robbins public domain getopt (1993 revision). This is probably
  the same one that is covered in chapter 12 of “Edition 3 of GAWK:
  Effective AWK Programming: A User's Guide for GNU Awk” but as that is
  licensed under the GNU Free Documentation License, Version 1.3, which
  conflicts with the GPL3, I can't use it from there (or it's accompanying
  explanations), so I do my best to explain how it works here.

  The getopt.awk header is:

  <\nf-chunk|getopt.awk-header>
    # getopt.awk --- do C library getopt(3) function in awk

    #

    # Arnold Robbins, arnold@skeeve.com, Public Domain

    #

    # Initial version: March, 1991

    # Revised: May, 1993

    \;
  </nf-chunk||>

  The provided explanation is:

  <\nf-chunk|getopt.awk-notes>
    # External variables:

    # \ \ \ Optind -- index in ARGV of first nonoption argument

    # \ \ \ Optarg -- string value of argument to current option

    # \ \ \ Opterr -- if nonzero, print our own diagnostic

    # \ \ \ Optopt -- current option letter

    \;

    # Returns:

    # \ \ \ -1 \ \ \ \ at end of options

    # \ \ \ ? \ \ \ \ \ for unrecognized option

    # \ \ \ \<less\>c\<gtr\> \ \ \ a character representing the current
    option

    \;

    # Private Data:

    # \ \ \ _opti \ -- index in multi-flag option, e.g., -abc

    \;
  </nf-chunk||>

  The function follows. The final two parameters, <verbatim|thisopt> and
  <verbatim|i> are local variables and not parameters --- as indicated by the
  multiple spaces preceding them. Awk doesn't care, the multiple spaces are a
  convention to help us humans.

  <\nf-chunk|getopt.awk-getopt()>
    function getopt(argc, argv, options, \ \ \ thisopt, i)

    {

    \ \ \ \ if (length(options) == 0) \ \ \ # no options given

    \ \ \ \ \ \ \ \ return -1

    \ \ \ \ if (argv[Optind] == "--") { \ # all done

    \ \ \ \ \ \ \ \ Optind++

    \ \ \ \ \ \ \ \ _opti = 0

    \ \ \ \ \ \ \ \ return -1

    \ \ \ \ } else if (argv[Optind] !~ /^-[^: \\t\\n\\f\\r\\v\\b]/) {

    \ \ \ \ \ \ \ \ _opti = 0

    \ \ \ \ \ \ \ \ return -1

    \ \ \ \ }

    \ \ \ \ if (_opti == 0)

    \ \ \ \ \ \ \ \ _opti = 2

    \ \ \ \ thisopt = substr(argv[Optind], _opti, 1)

    \ \ \ \ Optopt = thisopt

    \ \ \ \ i = index(options, thisopt)

    \ \ \ \ if (i == 0) {

    \ \ \ \ \ \ \ \ if (Opterr)

    \ \ \ \ \ \ \ \ \ \ \ \ printf("%c -- invalid option\\n",

    \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ thisopt)
    \<gtr\> "/dev/stderr"

    \ \ \ \ \ \ \ \ if (_opti \<gtr\>= length(argv[Optind])) {

    \ \ \ \ \ \ \ \ \ \ \ \ Optind++

    \ \ \ \ \ \ \ \ \ \ \ \ _opti = 0

    \ \ \ \ \ \ \ \ } else

    \ \ \ \ \ \ \ \ \ \ \ \ _opti++

    \ \ \ \ \ \ \ \ return "?"

    \ \ \ \ }
  </nf-chunk||>

  At this point, the option has been found and we need to know if it takes
  any arguments.

  <\nf-chunk|getopt.awk-getopt()>
    \ \ \ \ if (substr(options, i + 1, 1) == ":") {

    \ \ \ \ \ \ \ \ # get option argument

    \ \ \ \ \ \ \ \ if (length(substr(argv[Optind], _opti + 1)) \<gtr\> 0)

    \ \ \ \ \ \ \ \ \ \ \ \ Optarg = substr(argv[Optind], _opti + 1)

    \ \ \ \ \ \ \ \ else

    \ \ \ \ \ \ \ \ \ \ \ \ Optarg = argv[++Optind]

    \ \ \ \ \ \ \ \ _opti = 0

    \ \ \ \ } else

    \ \ \ \ \ \ \ \ Optarg = ""

    \ \ \ \ if (_opti == 0 \|\| _opti \<gtr\>= length(argv[Optind])) {

    \ \ \ \ \ \ \ \ Optind++

    \ \ \ \ \ \ \ \ _opti = 0

    \ \ \ \ } else

    \ \ \ \ \ \ \ \ _opti++

    \ \ \ \ return thisopt

    }
  </nf-chunk||>

  A test program is built in, too

  <\nf-chunk|getopt.awk-begin>
    BEGIN {

    \ \ \ \ Opterr = 1 \ \ \ # default is to diagnose

    \ \ \ \ Optind = 1 \ \ \ # skip ARGV[0]

    \ \ \ \ # test program

    \ \ \ \ if (_getopt_test) {

    \ \ \ \ \ \ \ \ while ((_go_c = getopt(ARGC, ARGV, "ab:cd")) != -1)

    \ \ \ \ \ \ \ \ \ \ \ \ printf("c = \<less\>%c\<gtr\>, optarg =
    \<less\>%s\<gtr\>\\n",

    \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ _go_c,
    Optarg)

    \ \ \ \ \ \ \ \ printf("non-option arguments:\\n")

    \ \ \ \ \ \ \ \ for (; Optind \<less\> ARGC; Optind++)

    \ \ \ \ \ \ \ \ \ \ \ \ printf("\\tARGV[%d] = \<less\>%s\<gtr\>\\n",

    \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ Optind,
    ARGV[Optind])

    \ \ \ \ }

    }
  </nf-chunk||>

  The entire getopt.awk is made out of these chunks in order

  <\nf-chunk|getopt.awk>
    =\<less\>\\chunkref{getopt.awk-header}\<gtr\>

    \;

    =\<less\>\\chunkref{getopt.awk-notes}\<gtr\>

    =\<less\>\\chunkref{getopt.awk-getopt()}\<gtr\>

    =\<less\>\\chunkref{getopt.awk-begin}\<gtr\>
  </nf-chunk||>

  Although we only want the header and function:

  <\nf-chunk|getopt>
    # try: locate getopt.awk for the full original file

    # as part of your standard awk installation

    =\<less\>\\chunkref{getopt.awk-header}\<gtr\>

    \;

    =\<less\>\\chunkref{getopt.awk-getopt()}\<gtr\>
  </nf-chunk||>

  <chapter|Newfangle LaTeX source code><label|latex-source>

  <section|newfangle module>

  Here we define a <LyX> <verbatim|.module> file that makes it convenient to
  use <LyX> for writing such literate programs.

  This file <verbatim|./newfangle.module> can be installed in your personal
  <verbatim|.lyx/layouts> folder. You will need to Tools Reconfigure so that
  <LyX> notices it. It adds a new format Chunk, which should precede every
  listing and contain the chunk name.

  <\nf-chunk|./newfangle.module>
    #\\DeclareLyXModule{Newfangle Literate Listings}

    #DescriptionBegin

    # \ Newfangle literate listings allow one to write

    # \ \ literate programs after the fashion of noweb, but without having

    # \ \ to use noweave to generate the documentation. Instead the listings

    # \ \ package is extended in conjunction with the noweb package to
    implement

    # \ \ to code formating directly as latex.

    # \ The newfangle awk script

    #DescriptionEnd

    \;

    =\<less\>\\chunkref{gpl3-copyright.hashed}\<gtr\>

    \;

    Format 11

    \;

    AddToPreamble

    =\<less\>\\chunkref{./newfangle.sty}\<gtr\>

    EndPreamble

    \;

    =\<less\>\\chunkref{chunkstyle}\<gtr\>

    \;

    =\<less\>\\chunkref{chunkref}\<gtr\>
  </nf-chunk|lyx-module|>

  Because <LyX> modules are not yet a language supported by newfangle or
  lstlistings, we resort to this fake awk chunk below in order to have each
  line of the GPL3 license commence with a #

  <\nf-chunk|gpl3-copyright.hashed>
    #=\<less\>\\chunkref{gpl3-copyright}\<gtr\>

    \;
  </nf-chunk|awk|>

  <subsection|The Chunk style>

  The purpose of the <name|chunk> style is to make it easier for <LyX> users
  to provide the name to <verbatim|lstlistings>. Normally this requires
  right-clicking on the listing, choosing settings, advanced, and then typing
  <verbatim|name=chunk-name>. This has the further disadvantage that the name
  (and other options) are not generally visible during document editing.

  The chunk style is defined as a <LaTeX> command, so that all text on the
  same line is passed to the <verbatim|LaTeX> command <verbatim|Chunk>. This
  makes it easy to parse using <verbatim|newfangle>, and easy to pass these
  options on to the listings package. The first word in a chunk section
  should be the chunk name, and will have <verbatim|name=> prepended to it.
  Any other words are accepted arguments to <verbatim|lstset>.

  We set PassThru to 1 because the user is actually entering raw latex.

  <\nf-chunk|chunkstyle>
    Style Chunk

    \ \ LatexType \ \ \ \ \ \ \ \ \ \ \ \ Command

    \ \ LatexName \ \ \ \ \ \ \ \ \ \ \ \ Chunk

    \ \ Margin \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ First_Dynamic

    \ \ LeftMargin \ \ \ \ \ \ \ \ \ \ \ Chunk:xxx

    \ \ LabelSep \ \ \ \ \ \ \ \ \ \ \ \ \ xx

    \ \ LabelType \ \ \ \ \ \ \ \ \ \ \ \ Static

    \ \ LabelString \ \ \ \ \ \ \ \ \ \ "Chunk:"

    \ \ Align \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ Left

    \ \ PassThru \ \ \ \ \ \ \ \ \ \ \ \ \ 1

    \;
  </nf-chunk||>

  To make the label very visible we choose a larger font coloured red.

  <\nf-chunk|chunkstyle>
    \ \ LabelFont

    \ \ \ \ Family \ \ \ \ \ \ \ \ \ \ \ \ \ Sans

    \ \ \ \ Size \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ Large

    \ \ \ \ Series \ \ \ \ \ \ \ \ \ \ \ \ \ Bold

    \ \ \ \ Shape \ \ \ \ \ \ \ \ \ \ \ \ \ \ Italic

    \ \ \ \ Color \ \ \ \ \ \ \ \ \ \ \ \ \ \ red

    \ \ EndFont

    End
  </nf-chunk||>

  <subsection|The chunkref style>

  We also define the Chunkref style which can be used to express cross
  references to chunks.

  <\nf-chunk|chunkref>
    InsetLayout Chunkref

    \ \ LyxType \ \ \ \ \ \ \ \ \ \ \ \ \ \ charstyle

    \ \ LatexType \ \ \ \ \ \ \ \ \ \ \ \ Command

    \ \ LatexName \ \ \ \ \ \ \ \ \ \ \ \ chunkref

    \ \ PassThru \ \ \ \ \ \ \ \ \ \ \ \ \ 1

    \ \ LabelFont \ \ \ \ \ \ \ \ \ \ \ \ 

    \ \ \ \ Shape \ \ \ \ \ \ \ \ \ \ \ \ \ \ Italic

    \ \ \ \ Color \ \ \ \ \ \ \ \ \ \ \ \ \ \ red

    \ \ EndFont

    End
  </nf-chunk||>

  <section|Latex Macros><label|sec:Latex-Macros>

  We require the listings, noweb and xargs packages. As noweb defines it's
  own <verbatim|\\code> environment, we re-define the one that <LyX> logical
  markup module expects here.

  <\nf-chunk|./newfangle.sty>
    \\usepackage{listings}%

    \\usepackage{noweb}%

    \\usepackage{xargs}%

    \\renewcommand{\\code}[1]{\\texttt{#1}}%
  </nf-chunk|tex|>

  We also define a <verbatim|CChunk> macro, for use as:
  <verbatim|\\begin{CChunk}> which will need renaming to
  <verbatim|\\begin{Chunk}> when I can do this without clashing with
  <verbatim|\\Chunk>.

  <\nf-chunk|./newfangle.sty>
    \\lstnewenvironment{Chunk}{\\relax}{\\relax}%
  </nf-chunk||>

  We also define a suitable <verbatim|\\lstset> of parameters that suit the
  literate programming style after the fashion of <name|noweave>.

  <\nf-chunk|./newfangle.sty>
    \\lstset{numbers=left, stepnumber=5, numbersep=5pt,

    \ \ \ \ \ \ \ \ breaklines=false,basicstyle=\\ttfamily,

    \ \ \ \ \ \ \ \ numberstyle=\\tiny, language=C}%
  </nf-chunk||>

  We also define a notangle-like mechanism for escaping to <LaTeX> from the
  listing, and by which we can refer to other listings. We declare the
  <verbatim|=\<less\>...\<gtr\>> sequence to contain <LaTeX> code, and
  include another like this chunk: <verbatim|=\<less\>\\chunkref{chunkname}\<gtr\>>.
  However, because <verbatim|=\<less\>...\<gtr\>> is already defined to
  contain <LaTeX> code for this document --- this is a newfangle document
  after all --- the code fragment below effectively contains the <LaTeX>
  code: <verbatim|}{>. To avoid problems with document generation, I had to
  declare an lstlistings property: <verbatim|escapeinside={}> for this
  listing only; which in <LyX> was done by right-clicking the listings inset,
  choosing settings-\<gtr\>advanced. Therefore <verbatim|=\<less\>> isn't
  interpreted literally here, in a listing when the escape sequence is
  already defined as shown... we need to somehow escape this
  representation...

  <\nf-chunk|./newfangle.sty>
    \\lstset{escapeinside={=\<less\>}{\<gtr\>}}%
  </nf-chunk||>

  Although our macros will contain the <verbatim|@> symbol, they will be
  included in a <verbatim|\\makeatletter> section by <LyX>; however we keep
  the commented out <verbatim|\\makeatletter> as a reminder. The listings
  package likes to centre the titles, but noweb titles are specially
  formatted and must be left aligned. The simplest way to do this turned out
  to be by removing the definition of <verbatim|\\lst@maketitle>. This may
  interact badly if other listings want a regular title or caption. We
  remember the old maketitle in case we need it.

  <\nf-chunk|./newfangle.sty>
    %\\makeatletter

    %somehow re-defining maketitle gives us a left-aligned title

    %which is extactly what our specially formatted title needs!

    \\global\\let\\newfangle@lst@maketitle\\lst@maketitle%

    \\global\\def\\lst@maketitle{}%
  </nf-chunk||>

  <subsection|The chunk command><label|sub:The-chunk-command>

  Our chunk command accepts one argument, and calls <verbatim|\\ltset>.
  Although <verbatim|\\ltset> will note the name, this is erased when the
  next <verbatim|\\lstlisting> starts, so we make a note of this in
  <verbatim|\\lst@chunkname> and restore in in lstlistings Init hook.

  <\nf-chunk|./newfangle.sty>
    \\def\\Chunk#1{%

    \ \ \\lstset{title={\\newfanglecaption},name=#1}%

    \ \ \\global\\edef\\lst@chunkname{\\lst@intname}%

    }%

    \\def\\lst@chunkname{\\empty}%
  </nf-chunk||>

  <subsubsection|Chunk parameters>

  Newfangle permits parameterized chunks, and requires the paramters to be
  specified as listings options. The newfangle script uses this, and although
  we don't do anything with these in the <LaTeX> code right now, we need to
  stop the listings package complaining.

  <\nf-chunk|./newfangle.sty>
    \\lst@Key{params}\\relax{\\def\\newfangle@chunk@params{#1}}%
  </nf-chunk||>

  As it is common to define a chunk which then needs appending to another
  chunk, and annoying to have to declare a single line chunk to manage the
  include, we support an append= option.

  <\nf-chunk|./newfangle.sty>
    \\lst@Key{append}\\relax{\\def\\newfangle@chunk@append{#1}}%
  </nf-chunk||>

  <subsection|The noweb styled caption>

  We define a public macro <verbatim|\\newfanglecaption> which can be set as
  a regular title. By means of <verbatim|\\protect>, It expands to
  <verbatim|\\newfangle@caption> at the appopriate time when the caption is
  emitted.

  <nf-chunk|./newfangle.sty|\\def\\newfanglecaption{\\protect\\newfangle@caption}%||>

  <\big-figure>
    22c <math|\<langle\>>some-chunk 19b<math|\<rangle\>><math|\<equiv\>>+
    \ \ <math|\<vartriangleleft\>>22b 24d<math|\<vartriangleright\>>

    \;

    In this example, the current chunk is 22c, and therefore the third chunk
    on page 22.

    It's name is some-chunk.\ 

    The first chunk with this name (19b) occurs as the second chunk on page
    19.

    The previous chunk (22d) with the same name is the second chunk on page
    22.

    The next chunk (24d) is the fourth chunk on page 24.
  </big-figure|Noweb Heading<label|noweb heading>>

  The general noweb output format compactly identifies the current chunk, and
  references to the first chunk, and the previous and next chunks that have
  the same name.

  This means that we need to keep a counter for each chunk-name, that we use
  to count chunks of the same name.

  <subsection|The chunk counter>

  It would be natural to have a counter for each chunk name, but TeX would
  soon run out of counters<\footnote>
    ...soon did run out of counters and so I had to re-write the LaTeX macros
    to share a counter as described here.
  </footnote>, so we have one counter which we save at the end of a chunk and
  restore at the beginning of a chunk.

  <\nf-chunk|./newfangle.sty>
    \\newcounter{newfangle@chunkcounter}%
  </nf-chunk||>

  We construct the name of this variable to store the counter to be the text
  <verbatim|lst-chunk-> prefixed onto the chunks own name, and store it in
  <verbatim|\\chunkcount>.\ 

  We save the counter like this:

  <nf-chunk|save-counter|\\global\\expandafter\\edef\\csname
  \\chunkcount\\endcsname{\\arabic{newfangle@chunkcounter}}%||>

  and restore the counter like this:

  <nf-chunk|restore-counter|\\setcounter{newfangle@chunkcounter}{\\csname
  \\chunkcount\\endcsname}%||>

  If there does not already exist a variable whose name is stored in
  <verbatim|\\chunkcount>, then we know we are the first chunk with this
  name, and then define a counter.\ 

  Although chunks of the same name share a common counter, they must still be
  distinguished. We use is the internal name of the listing, suffixed by the
  counter value. So the first chunk might be <verbatim|something-1> and the
  second chunk be <verbatim|something-2>, etc.

  We also calculate the name of the previous chunk if we can (before we
  increment the chunk counter). If this is the first chunk of that name, then
  <verbatim|\\prevchunkname> is set to <verbatim|\\relax> which the noweb
  package will interpret as not existing.

  <\nf-chunk|./newfangle.sty>
    \\def\\newfangle@caption{%

    \ \ \\edef\\chunkcount{lst-chunk-\\lst@intname}%

    \ \ \\@ifundefined{\\chunkcount}{%

    \ \ \ \ \\expandafter\\gdef\\csname \\chunkcount\\endcsname{0}%

    \ \ \ \ \\setcounter{newfangle@chunkcounter}{\\csname
    \\chunkcount\\endcsname}%

    \ \ \ \ \\let\\prevchunkname\\relax%

    \ \ }{%

    \ \ \ \ \\setcounter{newfangle@chunkcounter}{\\csname
    \\chunkcount\\endcsname}%

    \ \ \ \ \\edef\\prevchunkname{\\lst@intname-\\arabic{newfangle@chunkcounter}}%

    \ \ }%
  </nf-chunk||>

  After incrementing the chunk counter, we then define the name of this
  chunk, as well as the name of the first chunk.

  <\nf-chunk|./newfangle.sty>
    \ \ \\addtocounter{newfangle@chunkcounter}{1}%

    \ \ \\global\\expandafter\\edef\\csname
    \\chunkcount\\endcsname{\\arabic{newfangle@chunkcounter}}%

    \ \ \\edef\\chunkname{\\lst@intname-\\arabic{newfangle@chunkcounter}}%

    \ \ \\edef\\firstchunkname{\\lst@intname-1}%
  </nf-chunk||>

  We now need to calculate the name of the next chunk. We do this by
  temporarily skipping the counter on by one; however there may not actually
  be another chunk with this name! We detect this by also defining a label
  for each chunk based on the chunkname. If there is a next chunkname then it
  will define a label with that name. As labels are persistent, we can at
  least tell the second time <LaTeX> is run. If we don't find such a defined
  label then we define <verbatim|\\nextchunkname> to <verbatim|\\relax>.

  <\nf-chunk|./newfangle.sty>
    \ \ \\addtocounter{newfangle@chunkcounter}{1}%

    \ \ \\edef\\nextchunkname{\\lst@intname-\\arabic{newfangle@chunkcounter}}%

    \ \ \\@ifundefined{r@label-\\nextchunkname}{\\let\\nextchunkname\\relax}{}%
  </nf-chunk||>

  The noweb package requires that we define a <verbatim|\\sublabel> for every
  chunk, with a unique name, which is then used to print out it's navigation
  hints.

  We also define a regular label for this chunk, as was mentioned above when
  we calculated <verbatim|\\nextchunkname>. This requires <LaTeX> to be run
  at least twice after new chunk sections are added --- but noweb requried
  that anyway.

  <\nf-chunk|./newfangle.sty>
    \ \ \\sublabel{\\chunkname}%

    % define this label for every chunk instance, so we

    % can tell when we are the last chunk of this name

    \ \ \\label{label-\\chunkname}%
  </nf-chunk||>

  We also try and add the chunk to the list of listings, but I'm afraid we
  don't do very well. We want each chunk name listing once, with all of it's
  references.

  <\nf-chunk|./newfangle.sty>
    \ \ \\addcontentsline{lol}{lstlisting}{\\lst@name~[\\protect\\subpageref{\\chunkname}]}%
  </nf-chunk||>

  We then call the noweb output macros in the same way that noweave generates
  them, except that we don't need to call <verbatim|\\nwstartdeflinemarkup>
  or <verbatim|\\nwenddeflinemarkup> <emdash> and if we do, it messes up the
  output somewhat.

  <\nf-chunk|./newfangle.sty>
    \ \ \\nwmargintag{%

    \ \ \ \ {%

    \ \ \ \ \ \ \\nwtagstyle{}%

    \ \ \ \ \ \ \\subpageref{\\chunkname}%

    \ \ \ \ }%

    \ \ }%

    %

    \ \ \\moddef{%

    \ \ \ \ {\\lst@name}%

    \ \ \ \ {%

    \ \ \ \ \ \ \\nwtagstyle{}\\/%

    \ \ \ \ \ \ \\@ifundefined{newfangle@chunk@params}{}{%

    \ \ \ \ \ \ \ \ (\\newfangle@chunk@params)%

    \ \ \ \ \ \ }%

    \ \ \ \ \ \ [\\csname \\chunkcount\\endcsname]~%

    \ \ \ \ \ \ \\subpageref{\\firstchunkname}%

    \ \ \ \ }%

    \ \ \ \ \\@ifundefined{newfangle@chunk@append}{}{%

    \ \ \ \ \\ifx{}\\newfangle@chunk@append{x}\\else%

    \ \ \ \ \ \ \ \ ,~add~to~\\newfangle@chunk@append%

    \ \ \ \ \\fi%

    \ \ \ \ }%

    \\global\\def\\newfangle@chunk@append{}%

    \\lstset{append=x}%

    \ \ }%

    %

    \ \ \\ifx\\relax\\prevchunkname\\endmoddef\\else\\plusendmoddef\\fi%

    % \ \\nwstartdeflinemarkup%

    \ \ \\nwprevnextdefs{\\prevchunkname}{\\nextchunkname}%

    % \ \\nwenddeflinemarkup%

    }%
  </nf-chunk||>

  Originally this was developed as a <verbatim|listings> aspect, in the Init
  hook, but it was found easier to affect the title without using a hook
  <emdash> <verbatim|\\lst@AddToHookExe{PreSet}> is still required to set the
  listings name to the name passed to the <verbatim|\\Chunk> command, though.

  <\nf-chunk|./newfangle.sty>
    %\\lst@BeginAspect{newfangle}

    %\\lst@Key{newfangle}{true}[t]{\\lstKV@SetIf{#1}{true}}

    \\lst@AddToHookExe{PreSet}{\\global\\let\\lst@intname\\lst@chunkname}

    \\lst@AddToHook{Init}{}%\\newfangle@caption}

    %\\lst@EndAspect
  </nf-chunk||>

  <subsection|Cross references>

  We define the <verbatim|\\chunkref> command which makes it easy to generate
  visual references to different code chunks, e.g.

  <block|<tformat|<table|<row|<cell|Macro>|<cell|Appearance>>|<row|<cell|<verbatim|\\chunkref{preamble}>>|<cell|>>|<row|<cell|<verbatim|\\chunkref[3]{preamble}>>|<cell|>>|<row|<cell|<verbatim|\\chunkref{preamble}[arg1,
  arg2]>>|<cell|>>>>>

  Chunkref can also be used within a code chunk to include another code
  chunk. The third optional parameter to chunkref is a comma sepatarated list
  of arguments, which will replace defined parameters in the chunkref.

  <\note>
    Darn it, if I have: <verbatim|=\<less\>\\chunkref{new-mode-tracker}[{chunks[chunk_name,
    "language"]},{mode}]\<gtr\>> the inner braces (inside [ ]) cause _ to
    signify subscript even though we have <verbatim|lst@ReplaceIn>
  </note>

  <\nf-chunk|./newfangle.sty>
    \\def\\chunkref@args#1,{%

    \ \ \\def\\arg{#1}%

    \ \ \\lst@ReplaceIn\\arg\\lst@filenamerpl%

    \ \ \\arg%

    \ \ \\@ifnextchar){\\relax}{, \\chunkref@args}%

    }%

    \\newcommand\\chunkref[2][0]{%

    \ \ \\@ifnextchar({\\chunkref@i{#1}{#2}}{\\chunkref@i{#1}{#2}()}%

    }%

    \\def\\chunkref@i#1#2(#3){%

    \ \ \\def\\zero{0}%

    \ \ \\def\\chunk{#2}%

    \ \ \\def\\chunkno{#1}%

    \ \ \\def\\chunkargs{#3}%

    \ \ \\ifx\\chunkno\\zero%

    \ \ \ \ \\def\\chunkname{#2-1}%

    \ \ \\else%

    \ \ \ \ \\def\\chunkname{#2-\\chunkno}%

    \ \ \\fi%

    \ \ \\let\\lst@arg\\chunk%

    \ \ \\lst@ReplaceIn\\chunk\\lst@filenamerpl%

    \ \ \\LA{%\\moddef{%

    \ \ \ \ {\\chunk}%

    \ \ \ \ {%

    \ \ \ \ \ \ \\nwtagstyle{}\\/%

    \ \ \ \ \ \ \\ifx\\chunkno\\zero%

    \ \ \ \ \ \ \\else%

    \ \ \ \ \ \ [\\chunkno]%

    \ \ \ \ \ \ \\fi%

    \ \ \ \ \ \ \\ifx\\chunkargs\\empty%

    \ \ \ \ \ \ \\else%

    \ \ \ \ \ \ \ \ (\\chunkref@args #3,)%

    \ \ \ \ \ \ \\fi%

    \ \ \ \ \ \ ~\\subpageref{\\chunkname}%

    \ \ \ \ }%

    \ \ }%

    \ \ \\RA%\\endmoddef%

    }%
  </nf-chunk||>

  <subsection|The end>

  <\nf-chunk|./newfangle.sty>
    %

    %\\makeatother
  </nf-chunk||>

  <chapter|Extracting newfangle>

  <section|Extracting from Lyx>

  To extract from <LyX>, you will need to configure <LyX> as explained in
  section <reference|Configuring-the-build>.

  <label|lyx-build-script>And this lyx-build scrap will extract newfangle for
  me.

  <\nf-chunk|lyx-build>
    #! /bin/sh

    set -x

    \;

    =\<less\>\\chunkref{lyx-build-helper}\<gtr\>

    cd $PROJECT_DIR \|\| exit 1

    \;

    /usr/local/bin/newfangle -R./newfangle $TEX_SRC \<gtr\> ./newfangle

    /usr/local/bin/newfangle -R./newfangle.module $TEX_SRC \<gtr\>
    ./newfangle.module

    \;

    =\<less\>\\chunkref{test:helpers}\<gtr\>

    export NEWFANGLE=./newfangle

    export TMP=${TMP:-/tmp}

    =\<less\>\\chunkref{test:run-tests}\<gtr\>

    # Now check that we can extract a newfangle that also passes the tests!

    $NEWFANGLE -R./newfangle $TEX_SRC \<gtr\> ./new-newfangle

    export NEWFANGLE=./new-newfangle

    =\<less\>\\chunkref{test:run-tests}\<gtr\>
  </nf-chunk|sh|>

  <\nf-chunk|test:run-tests>
    # run tests

    $NEWFANGLE -Rpca-test.awk $TEX_SRC \| awk -f - \|\| exit 1

    =\<less\>\\chunkref{test:cromulence}\<gtr\>

    =\<less\>\\chunkref{test:escapes}\<gtr\>

    =\<less\>\\chunkref{test:chunk-params}\<gtr\>
  </nf-chunk|sh|>

  With a lyx-build-helper

  <\nf-chunk|lyx-build-helper>
    PROJECT_DIR="$LYX_r"

    LYX_SRC="$PROJECT_DIR/${LYX_i%.tex}.lyx"

    TEX_DIR="$LYX_p"

    TEX_SRC="$TEX_DIR/$LYX_i"
  </nf-chunk|sh|>

  <section|Extracting documentation>

  <\nf-chunk|./gen-www>
    #python -m elyxer --css lyx.css $LYX_SRC \| \\

    # \ iconv -c -f utf-8 -t ISO-8859-1//TRANSLIT \| \\

    # \ sed 's/UTF-8"\\(.\\)\<gtr\>/ISO-8859-1"\\1\<gtr\>/' \<gtr\>
    www/docs/newfangle.html

    \;

    python -m elyxer --css lyx.css --iso885915 --html --destdirectory
    www/docs/newfangle.e \\

    \ \ \ \ \ \ \ newfangle.lyx \<gtr\> www/docs/newfangle.e/newfangle.html

    \;

    ( mkdir -p www/docs/newfangle && cd www/docs/newfangle && \\

    \ \ lyx -e latex ../../../newfangle.lyx && \\

    \ \ htlatex ../../../newfangle.tex "xhtml,fn-in" && \\

    \ \ sed -i -e 's/\<less\>!--l\\. [0-9][0-9]* *--\<gtr\>//g'
    newfangle.html

    )

    \;

    ( mkdir -p www/docs/literate && cd www/docs/literate && \\

    \ \ lyx -e latex ../../../literate.lyx && \\

    \ \ htlatex ../../../literate.tex "xhtml,fn-in" && \\

    \ \ sed -i -e 's/\<less\>!--l\\. [0-9][0-9]* *--\<gtr\>$//g'
    literate.html

    )
  </nf-chunk||>

  <section|Extracting from the command line>

  First you will need the tex output, then you can extract:

  <\nf-chunk|lyx-build-manual>
    lyx -e latex newfangle.lyx

    newfangle -R./newfangle newfangle.tex \<gtr\> ./newfangle

    newfangle -R./newfangle.module newfangle.tex \<gtr\> ./newfangle.module
  </nf-chunk|sh|>

  <section|Testing>

  <\nf-chunk|test:helpers>
    passtest() {

    \ \ if "$@"

    \ \ then echo "Passed"

    \ \ else echo "Failed"

    \ \ \ \ \ \ \ return 1

    \ \ fi

    }

    \;

    failtest() {

    \ \ if ! "$@"

    \ \ then echo "Passed"

    \ \ else echo "Failed"

    \ \ \ \ \ \ \ return 1

    \ \ fi

    }
  </nf-chunk||>

  <part|Tests>

  <chapter|Chunk Parameters>

  <\nf-chunk|test:chunk-params:sub>
    I see a ${THING},

    a ${THING} of colour ${colour},\ 

    and looking closer =\<less\>\\chunkref{test:chunk-params:sub:sub}(${colour})\<gtr\>
  </nf-chunk||<tuple|THING|colour>>

  <\nf-chunk|test:chunk-params:sub:sub>
    a funny shade of ${colour}
  </nf-chunk||<tuple|colour>>

  <\nf-chunk|test:chunk-params:text>
    What do you see? "=\<less\>\\chunkref{test:chunk-params:sub}(joe,
    red)\<gtr\>"

    Well, fancy!
  </nf-chunk||>

  Should generate output:

  <\nf-chunk|test:chunk-params:result>
    What do you see? "I see a joe,

    \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ a joe of colour red,\ 

    \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ and looking closer a funny shade of
    red"

    Well, fancy!
  </nf-chunk||>

  And this chunk will perform the test:

  <\nf-chunk|test:chunk-params>
    $NEWFANGLE -Rtest:chunk-params:result $TEX_SRC \<gtr\> $TMP/answer \|\|
    exit 1

    $NEWFANGLE -Rtest:chunk-params:text $TEX_SRC \<gtr\> $TMP/result \|\|
    exit 1

    passtest diff $TMP/answer $TMP/result \|\| (echo test:chunk-params:text
    failed ; exit 1)
  </nf-chunk||>

  <chapter|Compile-log-lyx><label|Compile-log-lyx>

  <\nf-chunk|Chunk: ./compile-log-lyx>
    #! /bin/sh

    # can't use gtkdialog -i, cos it uses the "source" command which ubuntu
    sh doesn't have

    \;

    main() {

    \ \ errors="/tmp/compile.log.$$"

    # \ if grep '^[^ ]*:\\( In \\\|[0-9][0-9]*: [^ ]*:\\)' \<gtr\> $errors

    if grep '^[^ ]*(\\([0-9][0-9]*\\)) *: *\\(error\\\|warning\\)' \<gtr\>
    $errors

    \ \ then

    \ \ \ \ sed -i -e 's/^[^ ]*[/\\\\]\\([^/\\\\]*\\)(\\([ 0-9][ 0-9]*\\)) *:
    */\\1:\\2\|\\2\|/' $errors

    \ \ \ \ COMPILE_DIALOG='

    \ \<less\>vbox\<gtr\>

    \ \ \<less\>text\<gtr\>

    \ \ \ \ \<less\>label\<gtr\>Compiler errors:\<less\>/label\<gtr\>

    \ \ \<less\>/text\<gtr\>

    \ \ \<less\>tree exported_column="0"\<gtr\>

    \ \ \ \ \<less\>variable\<gtr\>LINE\<less\>/variable\<gtr\>

    \ \ \ \ \<less\>height\<gtr\>400\<less\>/height\<gtr\>\<less\>width\<gtr\>800\<less\>/width\<gtr\>

    \ \ \ \ \<less\>label\<gtr\>File \| Line \| Message\<less\>/label\<gtr\>

    \ \ \ \ \<less\>action\<gtr\>'". $SELF ; "'lyxgoto
    $LINE\<less\>/action\<gtr\>

    \ \ \ \ \<less\>input\<gtr\>'"cat $errors"'\<less\>/input\<gtr\>

    \ \ \<less\>/tree\<gtr\>

    \ \ \<less\>hbox\<gtr\>

    \ \ \ \<less\>button\<gtr\>\<less\>label\<gtr\>Build\<less\>/label\<gtr\>

    \ \ \ \ \ \<less\>action\<gtr\>lyxclient -c "LYXCMD:build-program"
    &\<less\>/action\<gtr\>

    \ \ \ \<less\>/button\<gtr\>

    \ \ \ \<less\>button ok\<gtr\>\<less\>/button\<gtr\>

    \ \ \<less\>/hbox\<gtr\>

    \ \<less\>/vbox\<gtr\>

    '

    \ \ \ \ export COMPILE_DIALOG

    \ \ \ \ ( gtkdialog --program=COMPILE_DIALOG ; rm $errors ) &

    \ \ else

    \ \ \ \ rm $errors

    \ \ fi

    }

    \;

    lyxgoto() {

    \ \ file="${LINE%:*}"

    \ \ line="${LINE##*:}"

    \ \ extraline=\0cat $file \| head -n $line \| tac \| sed
    '/^\\\\\\\\begin{lstlisting}/q' \| wc -l\0

    \ \ extraline=\0expr $extraline - 1\0

    \ \ lyxclient -c "LYXCMD:command-sequence server-goto-file-row $file
    $line ; char-forward ; repeat $extraline paragraph-down ;
    paragraph-up-select"

    }

    \;

    SELF="$0"

    if test -z "$COMPILE_DIALOG"

    then main "$@"\ 

    fi
  </nf-chunk|sh|>

  \;
</body>

<\initial>
  <\collection>
    <associate|info-flag|short>
    <associate|page-medium|paper>
    <associate|page-screen-height|982016tmpt>
    <associate|page-screen-margin|false>
    <associate|page-screen-width|1686528tmpt>
    <associate|preamble|false>
    <associate|sfactor|5>
  </collection>
</initial>

<\references>
  <\collection>
    <associate||<tuple|?h|?>>
    <associate|*|<tuple|29a|29>>
    <associate|-|<tuple|?a|?>>
    <associate|.|<tuple|?v|?>>
    <associate|./|<tuple|?v|?>>
    <associate|./Makefile.inc|<tuple|23a|23>>
    <associate|./gen-www|<tuple|82a|82>>
    <associate|./n|<tuple|?v|?>>
    <associate|./ne|<tuple|?v|?>>
    <associate|./new|<tuple|?v|?>>
    <associate|./newangle.sty|<tuple|?ag|?>>
    <associate|./newf|<tuple|?v|?>>
    <associate|./newfa|<tuple|?v|?>>
    <associate|./newfan|<tuple|?v|?>>
    <associate|./newfang|<tuple|?v|?>>
    <associate|./newfangl|<tuple|?v|?>>
    <associate|./newfangle|<tuple|36a|36>>
    <associate|./newfangle.module|<tuple|73a|73>>
    <associate|./newfangle.sty|<tuple|79a|79>>
    <associate|/|<tuple|?u|?>>
    <associate|/.|<tuple|?u|?>>
    <associate|/.n|<tuple|?u|?>>
    <associate|/.ne|<tuple|?u|?>>
    <associate|/.new|<tuple|?u|?>>
    <associate|Bootstrap-Using-a-Makefile|<tuple|6.2.1|23>>
    <associate|Chunk Arguments|<tuple|8.2|37>>
    <associate|Chunk: ./compile-log-lyx|<tuple|87a|87>>
    <associate|Chunk: getopt.awk-begin|<tuple|?x|?>>
    <associate|Chunk: test:chunk-params:sub|<tuple|?o|?>>
    <associate|Chunk: test:chunk-params:sub:sub|<tuple|?p|?>>
    <associate|Compile-log-lyx|<tuple|18|87>>
    <associate|Converting-from-Lyx|<tuple|6.2.2|24>>
    <associate|License|<tuple|2|4>>
    <associate|Makefile.inc-targets|<tuple|28c|28>>
    <associate|Makefile.inc-vars|<tuple|28b|28>>
    <associate|a|<tuple|?x|?>>
    <associate|auto-1|<tuple|?|3>>
    <associate|auto-10|<tuple|4|17>>
    <associate|auto-100|<tuple|17|85>>
    <associate|auto-101|<tuple|18|87>>
    <associate|auto-11|<tuple|4.1|17>>
    <associate|auto-12|<tuple|4.2|17>>
    <associate|auto-13|<tuple|4.2.1|17>>
    <associate|auto-14|<tuple|4.2.2|17>>
    <associate|auto-15|<tuple|4.2.3|17>>
    <associate|auto-16|<tuple|4.3|18>>
    <associate|auto-17|<tuple|4.3.1|18>>
    <associate|auto-18|<tuple|4.3.2|18>>
    <associate|auto-19|<tuple|4.4|19>>
    <associate|auto-2|<tuple|2|4>>
    <associate|auto-20|<tuple|4.4.1|19>>
    <associate|auto-21|<tuple|5|21>>
    <associate|auto-22|<tuple|6|23>>
    <associate|auto-23|<tuple|6.1|23>>
    <associate|auto-24|<tuple|6.2|23>>
    <associate|auto-25|<tuple|6.2.1|24>>
    <associate|auto-26|<tuple|6.2.2|24>>
    <associate|auto-27|<tuple|6.3|24>>
    <associate|auto-28|<tuple|6.4|25>>
    <associate|auto-29|<tuple|6.5|27>>
    <associate|auto-3|<tuple|I|9>>
    <associate|auto-30|<tuple|6.5.1|27>>
    <associate|auto-31|<tuple|6.5.1.1|27>>
    <associate|auto-32|<tuple|6.5.2|27>>
    <associate|auto-33|<tuple|6.5.3|28>>
    <associate|auto-34|<tuple|6.6|28>>
    <associate|auto-35|<tuple|6.7|28>>
    <associate|auto-36|<tuple|6.8|29>>
    <associate|auto-37|<tuple|6.8.0.0.1|29>>
    <associate|auto-38|<tuple|II|31>>
    <associate|auto-39|<tuple|7|33>>
    <associate|auto-4|<tuple|1|11>>
    <associate|auto-40|<tuple|7.1|33>>
    <associate|auto-41|<tuple|7.2|34>>
    <associate|auto-42|<tuple|8|35>>
    <associate|auto-43|<tuple|8.1|35>>
    <associate|auto-44|<tuple|8.2|37>>
    <associate|auto-45|<tuple|8.3|38>>
    <associate|auto-46|<tuple|9|41>>
    <associate|auto-47|<tuple|9.1|41>>
    <associate|auto-48|<tuple|9.1.1|41>>
    <associate|auto-49|<tuple|9.1.2|41>>
    <associate|auto-5|<tuple|2|13>>
    <associate|auto-50|<tuple|9.2|42>>
    <associate|auto-51|<tuple|9.2.1|43>>
    <associate|auto-52|<tuple|9.2.2|43>>
    <associate|auto-53|<tuple|9.2.3|44>>
    <associate|auto-54|<tuple|9.2.4|45>>
    <associate|auto-55|<tuple|9.2.5|45>>
    <associate|auto-56|<tuple|9.2.6|46>>
    <associate|auto-57|<tuple|9.2.7|46>>
    <associate|auto-58|<tuple|9.2.8|47>>
    <associate|auto-59|<tuple|9.3|47>>
    <associate|auto-6|<tuple|2.1|13>>
    <associate|auto-60|<tuple|9.4|47>>
    <associate|auto-61|<tuple|9.4.1|47>>
    <associate|auto-62|<tuple|9.4.2|47>>
    <associate|auto-63|<tuple|9.4.3|49>>
    <associate|auto-64|<tuple|9.4.3.1|51>>
    <associate|auto-65|<tuple|9.4.3.2|51>>
    <associate|auto-66|<tuple|9.5|52>>
    <associate|auto-67|<tuple|10|53>>
    <associate|auto-68|<tuple|10.1|53>>
    <associate|auto-69|<tuple|10.1.1|53>>
    <associate|auto-7|<tuple|2.2|13>>
    <associate|auto-70|<tuple|10.1.2|54>>
    <associate|auto-71|<tuple|10.2|54>>
    <associate|auto-72|<tuple|10.2.1|54>>
    <associate|auto-73|<tuple|10.2.2|54>>
    <associate|auto-74|<tuple|10.3|55>>
    <associate|auto-75|<tuple|10.3.1|55>>
    <associate|auto-76|<tuple|11|59>>
    <associate|auto-77|<tuple|12|61>>
    <associate|auto-78|<tuple|12.1|62>>
    <associate|auto-79|<tuple|12.1.1|62>>
    <associate|auto-8|<tuple|2.3|13>>
    <associate|auto-80|<tuple|13|67>>
    <associate|auto-81|<tuple|14|69>>
    <associate|auto-82|<tuple|15|73>>
    <associate|auto-83|<tuple|15.1|73>>
    <associate|auto-84|<tuple|15.1.1|73>>
    <associate|auto-85|<tuple|15.1.2|74>>
    <associate|auto-86|<tuple|15.2|74>>
    <associate|auto-87|<tuple|15.2.1|75>>
    <associate|auto-88|<tuple|15.2.1.1|75>>
    <associate|auto-89|<tuple|15.2.2|76>>
    <associate|auto-9|<tuple|3|15>>
    <associate|auto-90|<tuple|1|76>>
    <associate|auto-91|<tuple|15.2.3|76>>
    <associate|auto-92|<tuple|15.2.4|78>>
    <associate|auto-93|<tuple|15.2.5|79>>
    <associate|auto-94|<tuple|16|81>>
    <associate|auto-95|<tuple|16.1|81>>
    <associate|auto-96|<tuple|16.2|82>>
    <associate|auto-97|<tuple|16.3|82>>
    <associate|auto-98|<tuple|16.4|82>>
    <associate|auto-99|<tuple|III|83>>
    <associate|aw|<tuple|?x|?>>
    <associate|awk|<tuple|?x|?>>
    <associate|awk-|<tuple|?x|?>>
    <associate|awk-d|<tuple|?x|?>>
    <associate|awk-de|<tuple|?x|?>>
    <associate|awk-del|<tuple|?x|?>>
    <associate|awk-dele|<tuple|?x|?>>
    <associate|awk-delet|<tuple|?x|?>>
    <associate|awk-delete|<tuple|?x|?>>
    <associate|awk-delete-|<tuple|?x|?>>
    <associate|awk-delete-a|<tuple|?x|?>>
    <associate|awk-delete-ar|<tuple|?x|?>>
    <associate|awk-delete-arr|<tuple|?x|?>>
    <associate|awk-delete-arra|<tuple|?x|?>>
    <associate|awk-delete-array|<tuple|33d|33>>
    <associate|begin|<tuple|59d|59>>
    <associate|cha:getopt|<tuple|14|69>>
    <associate|check-source-jump|<tuple|65c|65>>
    <associate|chunk-storage-functions|<tuple|68a|68>>
    <associate|chunkref|<tuple|74c|74>>
    <associate|chunkstyle|<tuple|74a|74>>
    <associate|code-label-*-1|<tuple|[* 1]|29>>
    <associate|code-label---1|<tuple|[- 1]|?>>
    <associate|code-label--1|<tuple|[ 1]|?>>
    <associate|code-label-.-1|<tuple|[. 1]|?>>
    <associate|code-label-./-1|<tuple|[./ 1]|?>>
    <associate|code-label-./Makefile.inc-1|<tuple|[./Makefile.inc 1]|23>>
    <associate|code-label-./gen-www-1|<tuple|[./gen-www 1]|82>>
    <associate|code-label-./n-1|<tuple|[./n 1]|?>>
    <associate|code-label-./ne-1|<tuple|[./ne 1]|?>>
    <associate|code-label-./new-1|<tuple|[./new 1]|?>>
    <associate|code-label-./newangle.sty-1|<tuple|[./newangle.sty 1]|?>>
    <associate|code-label-./newf-1|<tuple|[./newf 1]|?>>
    <associate|code-label-./newfa-1|<tuple|[./newfa 1]|?>>
    <associate|code-label-./newfan-1|<tuple|[./newfan 1]|?>>
    <associate|code-label-./newfang-1|<tuple|[./newfang 1]|?>>
    <associate|code-label-./newfangl-1|<tuple|[./newfangl 1]|?>>
    <associate|code-label-./newfangle-1|<tuple|[./newfangle 1]|33>>
    <associate|code-label-./newfangle-2|<tuple|[./newfangle 2]|33>>
    <associate|code-label-./newfangle-3|<tuple|[./newfangle 3]|33>>
    <associate|code-label-./newfangle-4|<tuple|[./newfangle 4]|36>>
    <associate|code-label-./newfangle.module-1|<tuple|[./newfangle.module
    1]|73>>
    <associate|code-label-./newfangle.sty-1|<tuple|[./newfangle.sty 1]|74>>
    <associate|code-label-./newfangle.sty-10|<tuple|[./newfangle.sty 10]|76>>
    <associate|code-label-./newfangle.sty-11|<tuple|[./newfangle.sty 11]|77>>
    <associate|code-label-./newfangle.sty-12|<tuple|[./newfangle.sty 12]|77>>
    <associate|code-label-./newfangle.sty-13|<tuple|[./newfangle.sty 13]|77>>
    <associate|code-label-./newfangle.sty-14|<tuple|[./newfangle.sty 14]|77>>
    <associate|code-label-./newfangle.sty-15|<tuple|[./newfangle.sty 15]|77>>
    <associate|code-label-./newfangle.sty-16|<tuple|[./newfangle.sty 16]|78>>
    <associate|code-label-./newfangle.sty-17|<tuple|[./newfangle.sty 17]|78>>
    <associate|code-label-./newfangle.sty-18|<tuple|[./newfangle.sty 18]|79>>
    <associate|code-label-./newfangle.sty-19|<tuple|[./newfangle.sty 19]|79>>
    <associate|code-label-./newfangle.sty-2|<tuple|[./newfangle.sty 2]|74>>
    <associate|code-label-./newfangle.sty-3|<tuple|[./newfangle.sty 3]|75>>
    <associate|code-label-./newfangle.sty-4|<tuple|[./newfangle.sty 4]|75>>
    <associate|code-label-./newfangle.sty-5|<tuple|[./newfangle.sty 5]|75>>
    <associate|code-label-./newfangle.sty-6|<tuple|[./newfangle.sty 6]|75>>
    <associate|code-label-./newfangle.sty-7|<tuple|[./newfangle.sty 7]|75>>
    <associate|code-label-./newfangle.sty-8|<tuple|[./newfangle.sty 8]|76>>
    <associate|code-label-./newfangle.sty-9|<tuple|[./newfangle.sty 9]|76>>
    <associate|code-label-/-1|<tuple|[/ 1]|?>>
    <associate|code-label-/.-1|<tuple|[/. 1]|?>>
    <associate|code-label-/.n-1|<tuple|[/.n 1]|?>>
    <associate|code-label-/.ne-1|<tuple|[/.ne 1]|?>>
    <associate|code-label-/.new-1|<tuple|[/.new 1]|?>>
    <associate|code-label-Chunk: ./compile-log-lyx-1|<tuple|[Chunk:
    ./compile-log-lyx 1]|87>>
    <associate|code-label-Chunk: getopt.awk-begin-1|<tuple|[Chunk:
    getopt.awk-begin 1]|?>>
    <associate|code-label-Chunk: test:chunk-params:sub-1|<tuple|[Chunk:
    test:chunk-params:sub 1]|?>>
    <associate|code-label-Chunk: test:chunk-params:sub:sub-1|<tuple|[Chunk:
    test:chunk-params:sub:sub 1]|?>>
    <associate|code-label-Makefile.inc-targets-1|<tuple|[Makefile.inc-targets
    1]|24>>
    <associate|code-label-Makefile.inc-targets-10|<tuple|[Makefile.inc-targets
    10]|28>>
    <associate|code-label-Makefile.inc-targets-11|<tuple|[Makefile.inc-targets
    11]|28>>
    <associate|code-label-Makefile.inc-targets-12|<tuple|[Makefile.inc-targets
    12]|28>>
    <associate|code-label-Makefile.inc-targets-2|<tuple|[Makefile.inc-targets
    2]|24>>
    <associate|code-label-Makefile.inc-targets-3|<tuple|[Makefile.inc-targets
    3]|25>>
    <associate|code-label-Makefile.inc-targets-4|<tuple|[Makefile.inc-targets
    4]|25>>
    <associate|code-label-Makefile.inc-targets-5|<tuple|[Makefile.inc-targets
    5]|26>>
    <associate|code-label-Makefile.inc-targets-6|<tuple|[Makefile.inc-targets
    6]|26>>
    <associate|code-label-Makefile.inc-targets-7|<tuple|[Makefile.inc-targets
    7]|27>>
    <associate|code-label-Makefile.inc-targets-8|<tuple|[Makefile.inc-targets
    8]|27>>
    <associate|code-label-Makefile.inc-targets-9|<tuple|[Makefile.inc-targets
    9]|27>>
    <associate|code-label-Makefile.inc-vars-1|<tuple|[Makefile.inc-vars
    1]|23>>
    <associate|code-label-Makefile.inc-vars-10|<tuple|[Makefile.inc-vars
    10]|26>>
    <associate|code-label-Makefile.inc-vars-11|<tuple|[Makefile.inc-vars
    11]|26>>
    <associate|code-label-Makefile.inc-vars-12|<tuple|[Makefile.inc-vars
    12]|27>>
    <associate|code-label-Makefile.inc-vars-13|<tuple|[Makefile.inc-vars
    13]|27>>
    <associate|code-label-Makefile.inc-vars-14|<tuple|[Makefile.inc-vars
    14]|27>>
    <associate|code-label-Makefile.inc-vars-15|<tuple|[Makefile.inc-vars
    15]|28>>
    <associate|code-label-Makefile.inc-vars-2|<tuple|[Makefile.inc-vars
    2]|24>>
    <associate|code-label-Makefile.inc-vars-3|<tuple|[Makefile.inc-vars
    3]|24>>
    <associate|code-label-Makefile.inc-vars-4|<tuple|[Makefile.inc-vars
    4]|25>>
    <associate|code-label-Makefile.inc-vars-5|<tuple|[Makefile.inc-vars
    5]|25>>
    <associate|code-label-Makefile.inc-vars-6|<tuple|[Makefile.inc-vars
    6]|25>>
    <associate|code-label-Makefile.inc-vars-7|<tuple|[Makefile.inc-vars
    7]|26>>
    <associate|code-label-Makefile.inc-vars-8|<tuple|[Makefile.inc-vars
    8]|26>>
    <associate|code-label-Makefile.inc-vars-9|<tuple|[Makefile.inc-vars
    9]|26>>
    <associate|code-label-a-1|<tuple|[a 1]|?>>
    <associate|code-label-aw-1|<tuple|[aw 1]|?>>
    <associate|code-label-awk--1|<tuple|[awk- 1]|?>>
    <associate|code-label-awk-1|<tuple|[awk 1]|?>>
    <associate|code-label-awk-d-1|<tuple|[awk-d 1]|?>>
    <associate|code-label-awk-de-1|<tuple|[awk-de 1]|?>>
    <associate|code-label-awk-del-1|<tuple|[awk-del 1]|?>>
    <associate|code-label-awk-dele-1|<tuple|[awk-dele 1]|?>>
    <associate|code-label-awk-delet-1|<tuple|[awk-delet 1]|?>>
    <associate|code-label-awk-delete--1|<tuple|[awk-delete- 1]|?>>
    <associate|code-label-awk-delete-1|<tuple|[awk-delete 1]|?>>
    <associate|code-label-awk-delete-a-1|<tuple|[awk-delete-a 1]|?>>
    <associate|code-label-awk-delete-ar-1|<tuple|[awk-delete-ar 1]|?>>
    <associate|code-label-awk-delete-arr-1|<tuple|[awk-delete-arr 1]|?>>
    <associate|code-label-awk-delete-arra-1|<tuple|[awk-delete-arra 1]|?>>
    <associate|code-label-awk-delete-array-1|<tuple|[awk-delete-array 1]|33>>
    <associate|code-label-begin-1|<tuple|[begin 1]|59>>
    <associate|code-label-check-source-jump-1|<tuple|[check-source-jump
    1]|65>>
    <associate|code-label-chunk-storage-functions-1|<tuple|[chunk-storage-functions
    1]|67>>
    <associate|code-label-chunk-storage-functions-2|<tuple|[chunk-storage-functions
    2]|67>>
    <associate|code-label-chunk-storage-functions-3|<tuple|[chunk-storage-functions
    3]|68>>
    <associate|code-label-chunk-storage-functions-4|<tuple|[chunk-storage-functions
    4]|68>>
    <associate|code-label-chunkref-1|<tuple|[chunkref 1]|74>>
    <associate|code-label-chunkstyle-1|<tuple|[chunkstyle 1]|74>>
    <associate|code-label-chunkstyle-2|<tuple|[chunkstyle 2]|74>>
    <associate|code-label-common-mode-definitions-1|<tuple|[common-mode-definitions
    1]|43>>
    <associate|code-label-common-mode-definitions-2|<tuple|[common-mode-definitions
    2]|43>>
    <associate|code-label-common-mode-definitions-3|<tuple|[common-mode-definitions
    3]|43>>
    <associate|code-label-common-mode-definitions-4|<tuple|[common-mode-definitions
    4]|44>>
    <associate|code-label-common-mode-definitions-5|<tuple|[common-mode-definitions
    5]|45>>
    <associate|code-label-constants-1|<tuple|[constants 1]|67>>
    <associate|code-label-d--1|<tuple|[d- 1]|?>>
    <associate|code-label-d-1|<tuple|[d 1]|?>>
    <associate|code-label-de-1|<tuple|[de 1]|?>>
    <associate|code-label-debug-output-1|<tuple|[debug-output 1]|61>>
    <associate|code-label-default-options-1|<tuple|[default-options 1]|59>>
    <associate|code-label-delatex-1|<tuple|[delatex 1]|56>>
    <associate|code-label-deu-1|<tuple|[deu 1]|?>>
    <associate|code-label-deum-1|<tuple|[deum 1]|?>>
    <associate|code-label-deump-1|<tuple|[deump 1]|?>>
    <associate|code-label-do--1|<tuple|[do- 1]|?>>
    <associate|code-label-doc--1|<tuple|[doc- 1]|?>>
    <associate|code-label-docu--1|<tuple|[docu- 1]|?>>
    <associate|code-label-docum--1|<tuple|[docum- 1]|?>>
    <associate|code-label-docume--1|<tuple|[docume- 1]|?>>
    <associate|code-label-documen--1|<tuple|[documen- 1]|?>>
    <associate|code-label-document--1|<tuple|[document- 1]|?>>
    <associate|code-label-document-p-1|<tuple|[document-p 1]|?>>
    <associate|code-label-document-pr-1|<tuple|[document-pr 1]|?>>
    <associate|code-label-document-pre-1|<tuple|[document-pre 1]|?>>
    <associate|code-label-document-prea-1|<tuple|[document-prea 1]|?>>
    <associate|code-label-document-pream-1|<tuple|[document-pream 1]|?>>
    <associate|code-label-document-preamb-1|<tuple|[document-preamb 1]|?>>
    <associate|code-label-document-preambl-1|<tuple|[document-preambl 1]|?>>
    <associate|code-label-document-preamble-1|<tuple|[document-preamble
    1]|19>>
    <associate|code-label-du-1|<tuple|[du 1]|?>>
    <associate|code-label-dum-1|<tuple|[dum 1]|?>>
    <associate|code-label-dump--1|<tuple|[dump- 1]|?>>
    <associate|code-label-dump-1|<tuple|[dump 1]|?>>
    <associate|code-label-dump-a-1|<tuple|[dump-a 1]|?>>
    <associate|code-label-dump-ar-1|<tuple|[dump-ar 1]|?>>
    <associate|code-label-dump-arr-1|<tuple|[dump-arr 1]|?>>
    <associate|code-label-dump-arra-1|<tuple|[dump-arra 1]|?>>
    <associate|code-label-dump-array-1|<tuple|[dump-array 1]|33>>
    <associate|code-label-e-1|<tuple|[e 1]|?>>
    <associate|code-label-end-1|<tuple|[end 1]|61>>
    <associate|code-label-er-1|<tuple|[er 1]|?>>
    <associate|code-label-err-1|<tuple|[err 1]|?>>
    <associate|code-label-erro-1|<tuple|[erro 1]|?>>
    <associate|code-label-error()-1|<tuple|[error() 1]|34>>
    <associate|code-label-error()-2|<tuple|[error() 2]|34>>
    <associate|code-label-error(-1|<tuple|[error( 1]|?>>
    <associate|code-label-error-1|<tuple|[error 1]|?>>
    <associate|code-label-example-makefile-1|<tuple|[example-makefile 1]|42>>
    <associate|code-label-example-perl,-1|<tuple|[example-perl, 1]|?>>
    <associate|code-label-example-perl,language=perl-1|<tuple|[example-perl,language=perl
    1]|?>>
    <associate|code-label-example-perl-1|<tuple|[example-perl 1]|41>>
    <associate|code-label-example-sh-1|<tuple|[example-sh 1]|41>>
    <associate|code-label-expand_chunk_args()-1|<tuple|[expand_chunk_args()
    1]|38>>
    <associate|code-label-g--1|<tuple|[g- 1]|?>>
    <associate|code-label-g-1|<tuple|[g 1]|?>>
    <associate|code-label-gca-test.awk-1|<tuple|[gca-test.awk 1]|37>>
    <associate|code-label-gca-test.awk-results-1|<tuple|[gca-test.awk-results
    1]|37>>
    <associate|code-label-ge-1|<tuple|[ge 1]|?>>
    <associate|code-label-generate-output-1|<tuple|[generate-output 1]|61>>
    <associate|code-label-get-1|<tuple|[get 1]|?>>
    <associate|code-label-get_-1|<tuple|[get_ 1]|?>>
    <associate|code-label-get_c-1|<tuple|[get_c 1]|?>>
    <associate|code-label-get_ch-1|<tuple|[get_ch 1]|?>>
    <associate|code-label-get_chu-1|<tuple|[get_chu 1]|?>>
    <associate|code-label-get_chun-1|<tuple|[get_chun 1]|?>>
    <associate|code-label-get_chunk+-1|<tuple|[get_chunk+ 1]|?>>
    <associate|code-label-get_chunk-1|<tuple|[get_chunk 1]|?>>
    <associate|code-label-get_chunk_-1|<tuple|[get_chunk_ 1]|?>>
    <associate|code-label-get_chunk_a-1|<tuple|[get_chunk_a 1]|?>>
    <associate|code-label-get_chunk_ar-1|<tuple|[get_chunk_ar 1]|?>>
    <associate|code-label-get_chunk_arg-1|<tuple|[get_chunk_arg 1]|?>>
    <associate|code-label-get_chunk_args()-1|<tuple|[get_chunk_args() 1]|36>>
    <associate|code-label-get_chunk_args()-2|<tuple|[get_chunk_args() 2]|36>>
    <associate|code-label-get_chunk_args(-1|<tuple|[get_chunk_args( 1]|?>>
    <associate|code-label-get_chunk_args-1|<tuple|[get_chunk_args 1]|?>>
    <associate|code-label-getopt-1|<tuple|[getopt 1]|71>>
    <associate|code-label-getopt.awk-1|<tuple|[getopt.awk 1]|71>>
    <associate|code-label-getopt.awk-begin-1|<tuple|[getopt.awk-begin 1]|71>>
    <associate|code-label-getopt.awk-getopt()-1|<tuple|[getopt.awk-getopt()
    1]|70>>
    <associate|code-label-getopt.awk-getopt()-2|<tuple|[getopt.awk-getopt()
    2]|71>>
    <associate|code-label-getopt.awk-header-1|<tuple|[getopt.awk-header
    1]|70>>
    <associate|code-label-getopt.awk-notes-1|<tuple|[getopt.awk-notes 1]|70>>
    <associate|code-label-gp--1|<tuple|[gp- 1]|?>>
    <associate|code-label-gpl--1|<tuple|[gpl- 1]|?>>
    <associate|code-label-gpl3--1|<tuple|[gpl3- 1]|?>>
    <associate|code-label-gpl3-c-1|<tuple|[gpl3-c 1]|?>>
    <associate|code-label-gpl3-co-1|<tuple|[gpl3-co 1]|?>>
    <associate|code-label-gpl3-cop-1|<tuple|[gpl3-cop 1]|?>>
    <associate|code-label-gpl3-copy-1|<tuple|[gpl3-copy 1]|?>>
    <associate|code-label-gpl3-copyr-1|<tuple|[gpl3-copyr 1]|?>>
    <associate|code-label-gpl3-copyri-1|<tuple|[gpl3-copyri 1]|?>>
    <associate|code-label-gpl3-copyrig-1|<tuple|[gpl3-copyrig 1]|?>>
    <associate|code-label-gpl3-copyrigh-1|<tuple|[gpl3-copyrigh 1]|?>>
    <associate|code-label-gpl3-copyright-1|<tuple|[gpl3-copyright 1]|4>>
    <associate|code-label-gpl3-copyright-2|<tuple|[gpl3-copyright 2]|?>>
    <associate|code-label-gpl3-copyright.hashed-1|<tuple|[gpl3-copyright.hashed
    1]|73>>
    <associate|code-label-handle-options-1|<tuple|[handle-options 1]|59>>
    <associate|code-label-help()-1|<tuple|[help() 1]|59>>
    <associate|code-label-l-1|<tuple|[l 1]|?>>
    <associate|code-label-ly-1|<tuple|[ly 1]|?>>
    <associate|code-label-lyx--1|<tuple|[lyx- 1]|?>>
    <associate|code-label-lyx-1|<tuple|[lyx 1]|?>>
    <associate|code-label-lyx-b-1|<tuple|[lyx-b 1]|?>>
    <associate|code-label-lyx-bu-1|<tuple|[lyx-bu 1]|?>>
    <associate|code-label-lyx-bui-1|<tuple|[lyx-bui 1]|?>>
    <associate|code-label-lyx-buil-1|<tuple|[lyx-buil 1]|?>>
    <associate|code-label-lyx-build--1|<tuple|[lyx-build- 1]|?>>
    <associate|code-label-lyx-build-1|<tuple|[lyx-build 1]|20>>
    <associate|code-label-lyx-build-2|<tuple|[lyx-build 2]|81>>
    <associate|code-label-lyx-build-3|<tuple|[lyx-build 3]|?>>
    <associate|code-label-lyx-build-h-1|<tuple|[lyx-build-h 1]|?>>
    <associate|code-label-lyx-build-he-1|<tuple|[lyx-build-he 1]|?>>
    <associate|code-label-lyx-build-hel-1|<tuple|[lyx-build-hel 1]|?>>
    <associate|code-label-lyx-build-help-1|<tuple|[lyx-build-help 1]|?>>
    <associate|code-label-lyx-build-helpe-1|<tuple|[lyx-build-helpe 1]|?>>
    <associate|code-label-lyx-build-helper-1|<tuple|[lyx-build-helper 1]|19>>
    <associate|code-label-lyx-build-helper-2|<tuple|[lyx-build-helper 2]|81>>
    <associate|code-label-lyx-build-helper-3|<tuple|[lyx-build-helper 3]|?>>
    <associate|code-label-lyx-build-manual-1|<tuple|[lyx-build-manual 1]|82>>
    <associate|code-label-lyx-build=-1|<tuple|[lyx-build= 1]|?>>
    <associate|code-label-makefile-glue-1|<tuple|[makefile-glue 1]|29>>
    <associate|code-label-makefile-glue-2|<tuple|[makefile-glue 2]|30>>
    <associate|code-label-makefile-glue-3|<tuple|[makefile-glue 3]|30>>
    <associate|code-label-makefile-glue-4|<tuple|[makefile-glue 4]|30>>
    <associate|code-label-mode-definitions-1|<tuple|[mode-definitions 1]|46>>
    <associate|code-label-mode-definitions-2|<tuple|[mode-definitions 2]|46>>
    <associate|code-label-mode-definitions-3|<tuple|[mode-definitions 3]|47>>
    <associate|code-label-mode-tracker-1|<tuple|[mode-tracker 1]|51>>
    <associate|code-label-mode:add-escapes-1|<tuple|[mode:add-escapes 1]|45>>
    <associate|code-label-mode:add-hash-comments-1|<tuple|[mode:add-hash-comments
    1]|45>>
    <associate|code-label-mode:add-hash-defines-1|<tuple|[mode:add-hash-defines
    1]|45>>
    <associate|code-label-mode:add-naked-regex-1|<tuple|[mode:add-naked-regex
    1]|46>>
    <associate|code-label-mode:add-submode-1|<tuple|[mode:add-submode 1]|45>>
    <associate|code-label-mode:common-brackets-1|<tuple|[mode:common-brackets
    1]|44>>
    <associate|code-label-mode:common-string-1|<tuple|[mode:common-string
    1]|44>>
    <associate|code-label-mode:common-string-2|<tuple|[mode:common-string
    2]|44>>
    <associate|code-label-mode:common-string-3|<tuple|[mode:common-string
    3]|44>>
    <associate|code-label-mode:common-string-4|<tuple|[mode:common-string
    4]|44>>
    <associate|code-label-mode:common-string-5|<tuple|[mode:common-string
    5]|44>>
    <associate|code-label-mode:multi-line-comments-1|<tuple|[mode:multi-line-comments
    1]|45>>
    <associate|code-label-mode:quote-dollar-escape-1|<tuple|[mode:quote-dollar-escape
    1]|45>>
    <associate|code-label-mode:single-line-slash-comments-1|<tuple|[mode:single-line-slash-comments
    1]|45>>
    <associate|code-label-mode_tracker()-1|<tuple|[mode_tracker() 1]|49>>
    <associate|code-label-mode_tracker()-10|<tuple|[mode_tracker() 10]|51>>
    <associate|code-label-mode_tracker()-2|<tuple|[mode_tracker() 2]|49>>
    <associate|code-label-mode_tracker()-3|<tuple|[mode_tracker() 3]|49>>
    <associate|code-label-mode_tracker()-4|<tuple|[mode_tracker() 4]|49>>
    <associate|code-label-mode_tracker()-5|<tuple|[mode_tracker() 5]|49>>
    <associate|code-label-mode_tracker()-6|<tuple|[mode_tracker() 6]|50>>
    <associate|code-label-mode_tracker()-7|<tuple|[mode_tracker() 7]|50>>
    <associate|code-label-mode_tracker()-8|<tuple|[mode_tracker() 8]|50>>
    <associate|code-label-mode_tracker()-9|<tuple|[mode_tracker() 9]|50>>
    <associate|code-label-mode_tracker(-1|<tuple|[mode_tracker( 1]|?>>
    <associate|code-label-mode_tracker-1|<tuple|[mode_tracker 1]|48>>
    <associate|code-label-mode_tracker-2|<tuple|[mode_tracker 2]|48>>
    <associate|code-label-mode_tracker-3|<tuple|[mode_tracker 3]|48>>
    <associate|code-label-mode_tracker-4|<tuple|[mode_tracker 4]|52>>
    <associate|code-label-mode_tracker-5|<tuple|[mode_tracker 5]|52>>
    <associate|code-label-new-mode-tracker()-1|<tuple|[new-mode-tracker()
    1]|47>>
    <associate|code-label-new-mode-tracker-1|<tuple|[new-mode-tracker 1]|47>>
    <associate|code-label-new_mode_tracker-1|<tuple|[new_mode_tracker 1]|?>>
    <associate|code-label-output_chunk_names()-1|<tuple|[output_chunk_names()
    1]|61>>
    <associate|code-label-output_chunks()-1|<tuple|[output_chunks() 1]|62>>
    <associate|code-label-p-1|<tuple|[p 1]|?>>
    <associate|code-label-pa-1|<tuple|[pa 1]|?>>
    <associate|code-label-par-1|<tuple|[par 1]|?>>
    <associate|code-label-pars-1|<tuple|[pars 1]|?>>
    <associate|code-label-parse--1|<tuple|[parse- 1]|?>>
    <associate|code-label-parse-1|<tuple|[parse 1]|?>>
    <associate|code-label-parse-c-1|<tuple|[parse-c 1]|?>>
    <associate|code-label-parse-ch-1|<tuple|[parse-ch 1]|?>>
    <associate|code-label-parse-chu-1|<tuple|[parse-chu 1]|?>>
    <associate|code-label-parse-chun-1|<tuple|[parse-chun 1]|?>>
    <associate|code-label-parse-chunk--1|<tuple|[parse-chunk- 1]|?>>
    <associate|code-label-parse-chunk-1|<tuple|[parse-chunk 1]|?>>
    <associate|code-label-parse-chunk-a-1|<tuple|[parse-chunk-a 1]|?>>
    <associate|code-label-parse-chunk-ar-1|<tuple|[parse-chunk-ar 1]|?>>
    <associate|code-label-parse-chunk-arg-1|<tuple|[parse-chunk-arg 1]|?>>
    <associate|code-label-parse-chunk-args-1|<tuple|[parse-chunk-args 1]|36>>
    <associate|code-label-parse-chunk-args-2|<tuple|[parse-chunk-args 2]|37>>
    <associate|code-label-parse-chunk=-1|<tuple|[parse-chunk= 1]|?>>
    <associate|code-label-parse_chunk_args-1|<tuple|[parse_chunk_args 1]|38>>
    <associate|code-label-parse_chunk_args-reset-modes-1|<tuple|[parse_chunk_args-reset-modes
    1]|49>>
    <associate|code-label-parse_chunk_args-reset-modes-2|<tuple|[parse_chunk_args-reset-modes
    2]|49>>
    <associate|code-label-pca-test.awk-1|<tuple|[pca-test.awk 1]|51>>
    <associate|code-label-pca-test.awk-results-1|<tuple|[pca-test.awk-results
    1]|51>>
    <associate|code-label-pca-test.awk:summary-1|<tuple|[pca-test.awk:summary
    1]|51>>
    <associate|code-label-process-chunk-1|<tuple|[process-chunk 1]|56>>
    <associate|code-label-process-chunk-2|<tuple|[process-chunk 2]|56>>
    <associate|code-label-process-chunk-3|<tuple|[process-chunk 3]|56>>
    <associate|code-label-process-chunk-4|<tuple|[process-chunk 4]|56>>
    <associate|code-label-process-chunk-5|<tuple|[process-chunk 5]|57>>
    <associate|code-label-process-chunk-simple-1|<tuple|[process-chunk-simple
    1]|55>>
    <associate|code-label-process-chunk-tabs-1|<tuple|[process-chunk-tabs
    1]|55>>
    <associate|code-label-read-options-1|<tuple|[read-options 1]|59>>
    <associate|code-label-recognize-chunk-1|<tuple|[recognize-chunk 1]|53>>
    <associate|code-label-recognize-chunk-2|<tuple|[recognize-chunk 2]|54>>
    <associate|code-label-recognize-chunk-3|<tuple|[recognize-chunk 3]|54>>
    <associate|code-label-recognize-chunk-4|<tuple|[recognize-chunk 4]|54>>
    <associate|code-label-recognize-chunk-5|<tuple|[recognize-chunk 5]|54>>
    <associate|code-label-recognize-chunk-6|<tuple|[recognize-chunk 6]|55>>
    <associate|code-label-recognize-chunk-7|<tuple|[recognize-chunk 7]|55>>
    <associate|code-label-restore-counter-1|<tuple|[restore-counter 1]|76>>
    <associate|code-label-save-counter-1|<tuple|[save-counter 1]|76>>
    <associate|code-label-substitute-chunk-arg-1|<tuple|[substitute-chunk-arg
    1]|39>>
    <associate|code-label-substitute-chunk-args-1|<tuple|[substitute-chunk-args
    1]|39>>
    <associate|code-label-substitute-chunk-args-2|<tuple|[substitute-chunk-args
    2]|39>>
    <associate|code-label-substitute-chunk-args-3|<tuple|[substitute-chunk-args
    3]|39>>
    <associate|code-label-substitute-chunk-args-4|<tuple|[substitute-chunk-args
    4]|?>>
    <associate|code-label-t-1|<tuple|[t 1]|?>>
    <associate|code-label-te-1|<tuple|[te 1]|?>>
    <associate|code-label-tes-1|<tuple|[tes 1]|?>>
    <associate|code-label-test-1|<tuple|[test 1]|?>>
    <associate|code-label-test:-1|<tuple|[test: 1]|?>>
    <associate|code-label-test:chunk-params-1|<tuple|[test:chunk-params
    1]|85>>
    <associate|code-label-test:chunk-params:result-1|<tuple|[test:chunk-params:result
    1]|85>>
    <associate|code-label-test:chunk-params:sub-1|<tuple|[test:chunk-params:sub
    1]|85>>
    <associate|code-label-test:chunk-params:sub:sub-1|<tuple|[test:chunk-params:sub:sub
    1]|85>>
    <associate|code-label-test:chunk-params:text-1|<tuple|[test:chunk-params:text
    1]|85>>
    <associate|code-label-test:comment-quote-1|<tuple|[test:comment-quote
    1]|46>>
    <associate|code-label-test:comment-quote:C-result-1|<tuple|[test:comment-quote:C-result
    1]|46>>
    <associate|code-label-test:comment-quote:result-1|<tuple|[test:comment-quote:result
    1]|46>>
    <associate|code-label-test:comment-text-1|<tuple|[test:comment-text
    1]|46>>
    <associate|code-label-test:cromulence-1|<tuple|[test:cromulence 1]|48>>
    <associate|code-label-test:escapes-1|<tuple|[test:escapes 1]|52>>
    <associate|code-label-test:helpers-1|<tuple|[test:helpers 1]|82>>
    <associate|code-label-test:hidden-else-1|<tuple|[test:hidden-else 1]|48>>
    <associate|code-label-test:mode-definitions-1|<tuple|[test:mode-definitions
    1]|43>>
    <associate|code-label-test:mode-definitions-2|<tuple|[test:mode-definitions
    2]|44>>
    <associate|code-label-test:mode-definitions-3|<tuple|[test:mode-definitions
    3]|47>>
    <associate|code-label-test:mode-definitions-4|<tuple|[test:mode-definitions
    4]|47>>
    <associate|code-label-test:p-1|<tuple|[test:p 1]|?>>
    <associate|code-label-test:pa-1|<tuple|[test:pa 1]|?>>
    <associate|code-label-test:par-1|<tuple|[test:par 1]|?>>
    <associate|code-label-test:part-1|<tuple|[test:part 1]|?>>
    <associate|code-label-test:parti-1|<tuple|[test:parti 1]|?>>
    <associate|code-label-test:partia-1|<tuple|[test:partia 1]|?>>
    <associate|code-label-test:partial--1|<tuple|[test:partial- 1]|?>>
    <associate|code-label-test:partial-1|<tuple|[test:partial 1]|?>>
    <associate|code-label-test:partial-c-1|<tuple|[test:partial-c 1]|?>>
    <associate|code-label-test:partial-ch-1|<tuple|[test:partial-ch 1]|?>>
    <associate|code-label-test:partial-chu-1|<tuple|[test:partial-chu 1]|?>>
    <associate|code-label-test:partial-chun-1|<tuple|[test:partial-chun
    1]|?>>
    <associate|code-label-test:partial-chunk-1|<tuple|[test:partial-chunk
    1]|48>>
    <associate|code-label-test:run-tests-1|<tuple|[test:run-tests 1]|81>>
    <associate|code-label-test:say-hello-1|<tuple|[test:say-hello 1]|48>>
    <associate|code-label-test:whole-chunk-1|<tuple|[test:whole-chunk 1]|48>>
    <associate|code-label-testwhole-chunk-1|<tuple|[testwhole-chunk 1]|?>>
    <associate|code-label-teswhole-chunk-1|<tuple|[teswhole-chunk 1]|?>>
    <associate|code-label-tewhole-chunk-1|<tuple|[tewhole-chunk 1]|?>>
    <associate|code-label-twhole-chunk-1|<tuple|[twhole-chunk 1]|?>>
    <associate|code-label-whole-chunk-1|<tuple|[whole-chunk 1]|?>>
    <associate|code-label-write-chunklets-1|<tuple|[write-chunklets 1]|64>>
    <associate|code-label-write-chunklets-2|<tuple|[write-chunklets 2]|64>>
    <associate|code-label-write-chunklets-3|<tuple|[write-chunklets 3]|64>>
    <associate|code-label-write-chunklets-4|<tuple|[write-chunklets 4]|64>>
    <associate|code-label-write-chunklets-5|<tuple|[write-chunklets 5]|64>>
    <associate|code-label-write-chunklets-6|<tuple|[write-chunklets 6]|65>>
    <associate|code-label-write-file-line-1|<tuple|[write-file-line 1]|65>>
    <associate|code-label-write-included-chunk-1|<tuple|[write-included-chunk
    1]|63>>
    <associate|code-label-write-part-1|<tuple|[write-part 1]|63>>
    <associate|code-label-write_chunk()-1|<tuple|[write_chunk() 1]|62>>
    <associate|code-label-write_chunk()-2|<tuple|[write_chunk() 2]|62>>
    <associate|code-label-write_chunk()-3|<tuple|[write_chunk() 3]|62>>
    <associate|code-label-write_chunk()-4|<tuple|[write_chunk() 4]|63>>
    <associate|code-label-write_chunk()-5|<tuple|[write_chunk() 5]|63>>
    <associate|code-label-wrote_chunk()-1|<tuple|[wrote_chunk() 1]|?>>
    <associate|code-label-wrte_chunk()-1|<tuple|[wrte_chunk() 1]|?>>
    <associate|code-ref-*-1|<tuple|29a|29>>
    <associate|code-ref---1|<tuple|?a|?>>
    <associate|code-ref--1|<tuple|?h|?>>
    <associate|code-ref-.-1|<tuple|?v|?>>
    <associate|code-ref-./-1|<tuple|?v|?>>
    <associate|code-ref-./Makefile.inc-1|<tuple|23a|23>>
    <associate|code-ref-./gen-www-1|<tuple|82a|82>>
    <associate|code-ref-./n-1|<tuple|?v|?>>
    <associate|code-ref-./ne-1|<tuple|?v|?>>
    <associate|code-ref-./new-1|<tuple|?v|?>>
    <associate|code-ref-./newangle.sty-1|<tuple|?ag|?>>
    <associate|code-ref-./newf-1|<tuple|?v|?>>
    <associate|code-ref-./newfa-1|<tuple|?v|?>>
    <associate|code-ref-./newfan-1|<tuple|?v|?>>
    <associate|code-ref-./newfang-1|<tuple|?v|?>>
    <associate|code-ref-./newfangl-1|<tuple|?v|?>>
    <associate|code-ref-./newfangle-1|<tuple|33a|33>>
    <associate|code-ref-./newfangle-2|<tuple|33b|33>>
    <associate|code-ref-./newfangle-3|<tuple|33c|33>>
    <associate|code-ref-./newfangle-4|<tuple|36a|36>>
    <associate|code-ref-./newfangle.module-1|<tuple|73a|73>>
    <associate|code-ref-./newfangle.sty-1|<tuple|74d|74>>
    <associate|code-ref-./newfangle.sty-10|<tuple|76c|76>>
    <associate|code-ref-./newfangle.sty-11|<tuple|77a|77>>
    <associate|code-ref-./newfangle.sty-12|<tuple|77b|77>>
    <associate|code-ref-./newfangle.sty-13|<tuple|77c|77>>
    <associate|code-ref-./newfangle.sty-14|<tuple|77d|77>>
    <associate|code-ref-./newfangle.sty-15|<tuple|77e|77>>
    <associate|code-ref-./newfangle.sty-16|<tuple|78a|78>>
    <associate|code-ref-./newfangle.sty-17|<tuple|78b|78>>
    <associate|code-ref-./newfangle.sty-18|<tuple|79a|79>>
    <associate|code-ref-./newfangle.sty-19|<tuple|79b|79>>
    <associate|code-ref-./newfangle.sty-2|<tuple|74e|74>>
    <associate|code-ref-./newfangle.sty-3|<tuple|75a|75>>
    <associate|code-ref-./newfangle.sty-4|<tuple|75b|75>>
    <associate|code-ref-./newfangle.sty-5|<tuple|75c|75>>
    <associate|code-ref-./newfangle.sty-6|<tuple|75d|75>>
    <associate|code-ref-./newfangle.sty-7|<tuple|75e|75>>
    <associate|code-ref-./newfangle.sty-8|<tuple|76a|76>>
    <associate|code-ref-./newfangle.sty-9|<tuple|76b|76>>
    <associate|code-ref-/-1|<tuple|?u|?>>
    <associate|code-ref-/.-1|<tuple|?u|?>>
    <associate|code-ref-/.n-1|<tuple|?u|?>>
    <associate|code-ref-/.ne-1|<tuple|?u|?>>
    <associate|code-ref-/.new-1|<tuple|?u|?>>
    <associate|code-ref-Chunk: ./compile-log-lyx-1|<tuple|87a|87>>
    <associate|code-ref-Chunk: getopt.awk-begin-1|<tuple|?x|?>>
    <associate|code-ref-Chunk: test:chunk-params:sub-1|<tuple|?o|?>>
    <associate|code-ref-Chunk: test:chunk-params:sub:sub-1|<tuple|?p|?>>
    <associate|code-ref-Makefile.inc-targets-1|<tuple|24b|24>>
    <associate|code-ref-Makefile.inc-targets-10|<tuple|28a|28>>
    <associate|code-ref-Makefile.inc-targets-11|<tuple|28c|28>>
    <associate|code-ref-Makefile.inc-targets-12|<tuple|28d|28>>
    <associate|code-ref-Makefile.inc-targets-2|<tuple|24d|24>>
    <associate|code-ref-Makefile.inc-targets-3|<tuple|25c|25>>
    <associate|code-ref-Makefile.inc-targets-4|<tuple|25e|25>>
    <associate|code-ref-Makefile.inc-targets-5|<tuple|26a|26>>
    <associate|code-ref-Makefile.inc-targets-6|<tuple|26b|26>>
    <associate|code-ref-Makefile.inc-targets-7|<tuple|27b|27>>
    <associate|code-ref-Makefile.inc-targets-8|<tuple|27c|27>>
    <associate|code-ref-Makefile.inc-targets-9|<tuple|27e|27>>
    <associate|code-ref-Makefile.inc-vars-1|<tuple|23b|23>>
    <associate|code-ref-Makefile.inc-vars-10|<tuple|26f|26>>
    <associate|code-ref-Makefile.inc-vars-11|<tuple|26g|26>>
    <associate|code-ref-Makefile.inc-vars-12|<tuple|27a|27>>
    <associate|code-ref-Makefile.inc-vars-13|<tuple|27d|27>>
    <associate|code-ref-Makefile.inc-vars-14|<tuple|27f|27>>
    <associate|code-ref-Makefile.inc-vars-15|<tuple|28b|28>>
    <associate|code-ref-Makefile.inc-vars-2|<tuple|24a|24>>
    <associate|code-ref-Makefile.inc-vars-3|<tuple|24c|24>>
    <associate|code-ref-Makefile.inc-vars-4|<tuple|25a|25>>
    <associate|code-ref-Makefile.inc-vars-5|<tuple|25b|25>>
    <associate|code-ref-Makefile.inc-vars-6|<tuple|25d|25>>
    <associate|code-ref-Makefile.inc-vars-7|<tuple|26c|26>>
    <associate|code-ref-Makefile.inc-vars-8|<tuple|26d|26>>
    <associate|code-ref-Makefile.inc-vars-9|<tuple|26e|26>>
    <associate|code-ref-a-1|<tuple|?x|?>>
    <associate|code-ref-aw-1|<tuple|?x|?>>
    <associate|code-ref-awk--1|<tuple|?x|?>>
    <associate|code-ref-awk-1|<tuple|?x|?>>
    <associate|code-ref-awk-d-1|<tuple|?x|?>>
    <associate|code-ref-awk-de-1|<tuple|?x|?>>
    <associate|code-ref-awk-del-1|<tuple|?x|?>>
    <associate|code-ref-awk-dele-1|<tuple|?x|?>>
    <associate|code-ref-awk-delet-1|<tuple|?x|?>>
    <associate|code-ref-awk-delete--1|<tuple|?x|?>>
    <associate|code-ref-awk-delete-1|<tuple|?x|?>>
    <associate|code-ref-awk-delete-a-1|<tuple|?x|?>>
    <associate|code-ref-awk-delete-ar-1|<tuple|?x|?>>
    <associate|code-ref-awk-delete-arr-1|<tuple|?x|?>>
    <associate|code-ref-awk-delete-arra-1|<tuple|?x|?>>
    <associate|code-ref-awk-delete-array-1|<tuple|33d|33>>
    <associate|code-ref-begin-1|<tuple|59d|59>>
    <associate|code-ref-check-source-jump-1|<tuple|65c|65>>
    <associate|code-ref-chunk-storage-functions-1|<tuple|67b|67>>
    <associate|code-ref-chunk-storage-functions-2|<tuple|67c|67>>
    <associate|code-ref-chunk-storage-functions-3|<tuple|68a|68>>
    <associate|code-ref-chunk-storage-functions-4|<tuple|68b|68>>
    <associate|code-ref-chunkref-1|<tuple|74c|74>>
    <associate|code-ref-chunkstyle-1|<tuple|74a|74>>
    <associate|code-ref-chunkstyle-2|<tuple|74b|74>>
    <associate|code-ref-common-mode-definitions-1|<tuple|43a|43>>
    <associate|code-ref-common-mode-definitions-2|<tuple|43b|43>>
    <associate|code-ref-common-mode-definitions-3|<tuple|43d|43>>
    <associate|code-ref-common-mode-definitions-4|<tuple|44f|44>>
    <associate|code-ref-common-mode-definitions-5|<tuple|45a|45>>
    <associate|code-ref-constants-1|<tuple|67a|67>>
    <associate|code-ref-d--1|<tuple|?a|?>>
    <associate|code-ref-d-1|<tuple|?y|?>>
    <associate|code-ref-de-1|<tuple|?y|?>>
    <associate|code-ref-debug-output-1|<tuple|61b|61>>
    <associate|code-ref-default-options-1|<tuple|59a|59>>
    <associate|code-ref-delatex-1|<tuple|56a|56>>
    <associate|code-ref-deu-1|<tuple|?y|?>>
    <associate|code-ref-deum-1|<tuple|?y|?>>
    <associate|code-ref-deump-1|<tuple|?y|?>>
    <associate|code-ref-do--1|<tuple|?a|?>>
    <associate|code-ref-doc--1|<tuple|?a|?>>
    <associate|code-ref-docu--1|<tuple|?a|?>>
    <associate|code-ref-docum--1|<tuple|?a|?>>
    <associate|code-ref-docume--1|<tuple|?a|?>>
    <associate|code-ref-documen--1|<tuple|?a|?>>
    <associate|code-ref-document--1|<tuple|?a|?>>
    <associate|code-ref-document-p-1|<tuple|?a|?>>
    <associate|code-ref-document-pr-1|<tuple|?a|?>>
    <associate|code-ref-document-pre-1|<tuple|?a|?>>
    <associate|code-ref-document-prea-1|<tuple|?a|?>>
    <associate|code-ref-document-pream-1|<tuple|?a|?>>
    <associate|code-ref-document-preamb-1|<tuple|?a|?>>
    <associate|code-ref-document-preambl-1|<tuple|?a|?>>
    <associate|code-ref-document-preamble-1|<tuple|19a|19>>
    <associate|code-ref-du-1|<tuple|?y|?>>
    <associate|code-ref-dum-1|<tuple|?y|?>>
    <associate|code-ref-dump--1|<tuple|?y|?>>
    <associate|code-ref-dump-1|<tuple|?y|?>>
    <associate|code-ref-dump-a-1|<tuple|?y|?>>
    <associate|code-ref-dump-ar-1|<tuple|?y|?>>
    <associate|code-ref-dump-arr-1|<tuple|?y|?>>
    <associate|code-ref-dump-arra-1|<tuple|?y|?>>
    <associate|code-ref-dump-array-1|<tuple|33e|33>>
    <associate|code-ref-e-1|<tuple|?z|?>>
    <associate|code-ref-end-1|<tuple|61c|61>>
    <associate|code-ref-er-1|<tuple|?z|?>>
    <associate|code-ref-err-1|<tuple|?z|?>>
    <associate|code-ref-erro-1|<tuple|?z|?>>
    <associate|code-ref-error()-1|<tuple|34a|34>>
    <associate|code-ref-error()-2|<tuple|34b|34>>
    <associate|code-ref-error(-1|<tuple|?z|?>>
    <associate|code-ref-error-1|<tuple|?z|?>>
    <associate|code-ref-example-makefile-1|<tuple|42a|42>>
    <associate|code-ref-example-perl,-1|<tuple|?a|?>>
    <associate|code-ref-example-perl,language=perl-1|<tuple|?a|?>>
    <associate|code-ref-example-perl-1|<tuple|41a|41>>
    <associate|code-ref-example-sh-1|<tuple|41b|41>>
    <associate|code-ref-expand_chunk_args()-1|<tuple|38b|38>>
    <associate|code-ref-g--1|<tuple|?a|?>>
    <associate|code-ref-g-1|<tuple|?c|?>>
    <associate|code-ref-gca-test.awk-1|<tuple|37b|37>>
    <associate|code-ref-gca-test.awk-results-1|<tuple|37c|37>>
    <associate|code-ref-ge-1|<tuple|?c|?>>
    <associate|code-ref-generate-output-1|<tuple|61a|61>>
    <associate|code-ref-get-1|<tuple|?c|?>>
    <associate|code-ref-get_-1|<tuple|?c|?>>
    <associate|code-ref-get_c-1|<tuple|?c|?>>
    <associate|code-ref-get_ch-1|<tuple|?c|?>>
    <associate|code-ref-get_chu-1|<tuple|?c|?>>
    <associate|code-ref-get_chun-1|<tuple|?c|?>>
    <associate|code-ref-get_chunk+-1|<tuple|?c|?>>
    <associate|code-ref-get_chunk-1|<tuple|?c|?>>
    <associate|code-ref-get_chunk_-1|<tuple|?c|?>>
    <associate|code-ref-get_chunk_a-1|<tuple|?c|?>>
    <associate|code-ref-get_chunk_ar-1|<tuple|?c|?>>
    <associate|code-ref-get_chunk_arg-1|<tuple|?c|?>>
    <associate|code-ref-get_chunk_args()-1|<tuple|36b|36>>
    <associate|code-ref-get_chunk_args()-2|<tuple|36c|36>>
    <associate|code-ref-get_chunk_args(-1|<tuple|?c|?>>
    <associate|code-ref-get_chunk_args-1|<tuple|?c|?>>
    <associate|code-ref-getopt-1|<tuple|71d|71>>
    <associate|code-ref-getopt.awk-1|<tuple|71c|71>>
    <associate|code-ref-getopt.awk-begin-1|<tuple|71b|71>>
    <associate|code-ref-getopt.awk-getopt()-1|<tuple|70c|70>>
    <associate|code-ref-getopt.awk-getopt()-2|<tuple|71a|71>>
    <associate|code-ref-getopt.awk-header-1|<tuple|70a|70>>
    <associate|code-ref-getopt.awk-notes-1|<tuple|70b|70>>
    <associate|code-ref-gp--1|<tuple|?a|?>>
    <associate|code-ref-gpl--1|<tuple|?a|?>>
    <associate|code-ref-gpl3--1|<tuple|?a|?>>
    <associate|code-ref-gpl3-c-1|<tuple|?a|?>>
    <associate|code-ref-gpl3-co-1|<tuple|?a|?>>
    <associate|code-ref-gpl3-cop-1|<tuple|?a|?>>
    <associate|code-ref-gpl3-copy-1|<tuple|?a|?>>
    <associate|code-ref-gpl3-copyr-1|<tuple|?a|?>>
    <associate|code-ref-gpl3-copyri-1|<tuple|?a|?>>
    <associate|code-ref-gpl3-copyrig-1|<tuple|?a|?>>
    <associate|code-ref-gpl3-copyrigh-1|<tuple|?a|?>>
    <associate|code-ref-gpl3-copyright-1|<tuple|4a|4>>
    <associate|code-ref-gpl3-copyright-2|<tuple|?a|?>>
    <associate|code-ref-gpl3-copyright.hashed-1|<tuple|73b|73>>
    <associate|code-ref-handle-options-1|<tuple|59c|59>>
    <associate|code-ref-help()-1|<tuple|59e|59>>
    <associate|code-ref-l-1|<tuple|?c|?>>
    <associate|code-ref-ly-1|<tuple|?c|?>>
    <associate|code-ref-lyx--1|<tuple|?c|?>>
    <associate|code-ref-lyx-1|<tuple|?c|?>>
    <associate|code-ref-lyx-b-1|<tuple|?c|?>>
    <associate|code-ref-lyx-bu-1|<tuple|?c|?>>
    <associate|code-ref-lyx-bui-1|<tuple|?c|?>>
    <associate|code-ref-lyx-buil-1|<tuple|?c|?>>
    <associate|code-ref-lyx-build--1|<tuple|?c|?>>
    <associate|code-ref-lyx-build-1|<tuple|20a|20>>
    <associate|code-ref-lyx-build-2|<tuple|81a|81>>
    <associate|code-ref-lyx-build-3|<tuple|?a|?>>
    <associate|code-ref-lyx-build-h-1|<tuple|?c|?>>
    <associate|code-ref-lyx-build-he-1|<tuple|?c|?>>
    <associate|code-ref-lyx-build-hel-1|<tuple|?c|?>>
    <associate|code-ref-lyx-build-help-1|<tuple|?c|?>>
    <associate|code-ref-lyx-build-helpe-1|<tuple|?c|?>>
    <associate|code-ref-lyx-build-helper-1|<tuple|19b|19>>
    <associate|code-ref-lyx-build-helper-2|<tuple|81c|81>>
    <associate|code-ref-lyx-build-helper-3|<tuple|?a|?>>
    <associate|code-ref-lyx-build-manual-1|<tuple|82b|82>>
    <associate|code-ref-lyx-build=-1|<tuple|?c|?>>
    <associate|code-ref-makefile-glue-1|<tuple|29b|29>>
    <associate|code-ref-makefile-glue-2|<tuple|30a|30>>
    <associate|code-ref-makefile-glue-3|<tuple|30b|30>>
    <associate|code-ref-makefile-glue-4|<tuple|30c|30>>
    <associate|code-ref-mode-definitions-1|<tuple|46a|46>>
    <associate|code-ref-mode-definitions-2|<tuple|46g|46>>
    <associate|code-ref-mode-definitions-3|<tuple|47a|47>>
    <associate|code-ref-mode-tracker-1|<tuple|51b|51>>
    <associate|code-ref-mode:add-escapes-1|<tuple|45c|45>>
    <associate|code-ref-mode:add-hash-comments-1|<tuple|45f|45>>
    <associate|code-ref-mode:add-hash-defines-1|<tuple|45g|45>>
    <associate|code-ref-mode:add-naked-regex-1|<tuple|46f|46>>
    <associate|code-ref-mode:add-submode-1|<tuple|45b|45>>
    <associate|code-ref-mode:common-brackets-1|<tuple|44h|44>>
    <associate|code-ref-mode:common-string-1|<tuple|44a|44>>
    <associate|code-ref-mode:common-string-2|<tuple|44b|44>>
    <associate|code-ref-mode:common-string-3|<tuple|44c|44>>
    <associate|code-ref-mode:common-string-4|<tuple|44d|44>>
    <associate|code-ref-mode:common-string-5|<tuple|44e|44>>
    <associate|code-ref-mode:multi-line-comments-1|<tuple|45d|45>>
    <associate|code-ref-mode:quote-dollar-escape-1|<tuple|45h|45>>
    <associate|code-ref-mode:single-line-slash-comments-1|<tuple|45e|45>>
    <associate|code-ref-mode_tracker()-1|<tuple|49a|49>>
    <associate|code-ref-mode_tracker()-10|<tuple|51a|51>>
    <associate|code-ref-mode_tracker()-2|<tuple|49b|49>>
    <associate|code-ref-mode_tracker()-3|<tuple|49e|49>>
    <associate|code-ref-mode_tracker()-4|<tuple|49f|49>>
    <associate|code-ref-mode_tracker()-5|<tuple|49g|49>>
    <associate|code-ref-mode_tracker()-6|<tuple|50a|50>>
    <associate|code-ref-mode_tracker()-7|<tuple|50b|50>>
    <associate|code-ref-mode_tracker()-8|<tuple|50c|50>>
    <associate|code-ref-mode_tracker()-9|<tuple|50d|50>>
    <associate|code-ref-mode_tracker(-1|<tuple|?a|?>>
    <associate|code-ref-mode_tracker-1|<tuple|48a|48>>
    <associate|code-ref-mode_tracker-2|<tuple|48b|48>>
    <associate|code-ref-mode_tracker-3|<tuple|48c|48>>
    <associate|code-ref-mode_tracker-4|<tuple|52a|52>>
    <associate|code-ref-mode_tracker-5|<tuple|52b|52>>
    <associate|code-ref-new-mode-tracker()-1|<tuple|47d|47>>
    <associate|code-ref-new-mode-tracker-1|<tuple|47e|47>>
    <associate|code-ref-new_mode_tracker-1|<tuple|?a|?>>
    <associate|code-ref-output_chunk_names()-1|<tuple|61d|61>>
    <associate|code-ref-output_chunks()-1|<tuple|62a|62>>
    <associate|code-ref-p-1|<tuple|?e|?>>
    <associate|code-ref-pa-1|<tuple|?e|?>>
    <associate|code-ref-par-1|<tuple|?e|?>>
    <associate|code-ref-pars-1|<tuple|?e|?>>
    <associate|code-ref-parse--1|<tuple|?e|?>>
    <associate|code-ref-parse-1|<tuple|?e|?>>
    <associate|code-ref-parse-c-1|<tuple|?e|?>>
    <associate|code-ref-parse-ch-1|<tuple|?e|?>>
    <associate|code-ref-parse-chu-1|<tuple|?e|?>>
    <associate|code-ref-parse-chun-1|<tuple|?e|?>>
    <associate|code-ref-parse-chunk--1|<tuple|?e|?>>
    <associate|code-ref-parse-chunk-1|<tuple|?e|?>>
    <associate|code-ref-parse-chunk-a-1|<tuple|?e|?>>
    <associate|code-ref-parse-chunk-ar-1|<tuple|?e|?>>
    <associate|code-ref-parse-chunk-arg-1|<tuple|?e|?>>
    <associate|code-ref-parse-chunk-args-1|<tuple|36d|36>>
    <associate|code-ref-parse-chunk-args-2|<tuple|37a|37>>
    <associate|code-ref-parse-chunk=-1|<tuple|?e|?>>
    <associate|code-ref-parse_chunk_args-1|<tuple|38a|38>>
    <associate|code-ref-parse_chunk_args-reset-modes-1|<tuple|49c|49>>
    <associate|code-ref-parse_chunk_args-reset-modes-2|<tuple|49d|49>>
    <associate|code-ref-pca-test.awk-1|<tuple|51c|51>>
    <associate|code-ref-pca-test.awk-results-1|<tuple|51e|51>>
    <associate|code-ref-pca-test.awk:summary-1|<tuple|51d|51>>
    <associate|code-ref-process-chunk-1|<tuple|56b|56>>
    <associate|code-ref-process-chunk-2|<tuple|56c|56>>
    <associate|code-ref-process-chunk-3|<tuple|56d|56>>
    <associate|code-ref-process-chunk-4|<tuple|56e|56>>
    <associate|code-ref-process-chunk-5|<tuple|57a|57>>
    <associate|code-ref-process-chunk-simple-1|<tuple|55c|55>>
    <associate|code-ref-process-chunk-tabs-1|<tuple|55d|55>>
    <associate|code-ref-read-options-1|<tuple|59b|59>>
    <associate|code-ref-recognize-chunk-1|<tuple|53a|53>>
    <associate|code-ref-recognize-chunk-2|<tuple|54a|54>>
    <associate|code-ref-recognize-chunk-3|<tuple|54b|54>>
    <associate|code-ref-recognize-chunk-4|<tuple|54c|54>>
    <associate|code-ref-recognize-chunk-5|<tuple|54d|54>>
    <associate|code-ref-recognize-chunk-6|<tuple|55a|55>>
    <associate|code-ref-recognize-chunk-7|<tuple|55b|55>>
    <associate|code-ref-restore-counter-1|<tuple|76e|76>>
    <associate|code-ref-save-counter-1|<tuple|76d|76>>
    <associate|code-ref-substitute-chunk-arg-1|<tuple|39d|39>>
    <associate|code-ref-substitute-chunk-args-1|<tuple|39a|39>>
    <associate|code-ref-substitute-chunk-args-2|<tuple|39b|39>>
    <associate|code-ref-substitute-chunk-args-3|<tuple|39c|39>>
    <associate|code-ref-substitute-chunk-args-4|<tuple|?a|?>>
    <associate|code-ref-t-1|<tuple|?h|?>>
    <associate|code-ref-te-1|<tuple|?h|?>>
    <associate|code-ref-tes-1|<tuple|?h|?>>
    <associate|code-ref-test-1|<tuple|?h|?>>
    <associate|code-ref-test:-1|<tuple|?h|?>>
    <associate|code-ref-test:chunk-params-1|<tuple|85e|85>>
    <associate|code-ref-test:chunk-params:result-1|<tuple|85d|85>>
    <associate|code-ref-test:chunk-params:sub-1|<tuple|85a|85>>
    <associate|code-ref-test:chunk-params:sub:sub-1|<tuple|85b|85>>
    <associate|code-ref-test:chunk-params:text-1|<tuple|85c|85>>
    <associate|code-ref-test:comment-quote-1|<tuple|46b|46>>
    <associate|code-ref-test:comment-quote:C-result-1|<tuple|46e|46>>
    <associate|code-ref-test:comment-quote:result-1|<tuple|46d|46>>
    <associate|code-ref-test:comment-text-1|<tuple|46c|46>>
    <associate|code-ref-test:cromulence-1|<tuple|48h|48>>
    <associate|code-ref-test:escapes-1|<tuple|52c|52>>
    <associate|code-ref-test:helpers-1|<tuple|82c|82>>
    <associate|code-ref-test:hidden-else-1|<tuple|48g|48>>
    <associate|code-ref-test:mode-definitions-1|<tuple|43c|43>>
    <associate|code-ref-test:mode-definitions-2|<tuple|44g|44>>
    <associate|code-ref-test:mode-definitions-3|<tuple|47b|47>>
    <associate|code-ref-test:mode-definitions-4|<tuple|47c|47>>
    <associate|code-ref-test:p-1|<tuple|?h|?>>
    <associate|code-ref-test:pa-1|<tuple|?h|?>>
    <associate|code-ref-test:par-1|<tuple|?h|?>>
    <associate|code-ref-test:part-1|<tuple|?h|?>>
    <associate|code-ref-test:parti-1|<tuple|?h|?>>
    <associate|code-ref-test:partia-1|<tuple|?h|?>>
    <associate|code-ref-test:partial--1|<tuple|?h|?>>
    <associate|code-ref-test:partial-1|<tuple|?h|?>>
    <associate|code-ref-test:partial-c-1|<tuple|?h|?>>
    <associate|code-ref-test:partial-ch-1|<tuple|?h|?>>
    <associate|code-ref-test:partial-chu-1|<tuple|?h|?>>
    <associate|code-ref-test:partial-chun-1|<tuple|?h|?>>
    <associate|code-ref-test:partial-chunk-1|<tuple|48f|48>>
    <associate|code-ref-test:run-tests-1|<tuple|81b|81>>
    <associate|code-ref-test:say-hello-1|<tuple|48e|48>>
    <associate|code-ref-test:whole-chunk-1|<tuple|48d|48>>
    <associate|code-ref-testwhole-chunk-1|<tuple|?f|?>>
    <associate|code-ref-teswhole-chunk-1|<tuple|?f|?>>
    <associate|code-ref-tewhole-chunk-1|<tuple|?f|?>>
    <associate|code-ref-twhole-chunk-1|<tuple|?f|?>>
    <associate|code-ref-whole-chunk-1|<tuple|?f|?>>
    <associate|code-ref-write-chunklets-1|<tuple|64a|64>>
    <associate|code-ref-write-chunklets-2|<tuple|64b|64>>
    <associate|code-ref-write-chunklets-3|<tuple|64c|64>>
    <associate|code-ref-write-chunklets-4|<tuple|64d|64>>
    <associate|code-ref-write-chunklets-5|<tuple|64e|64>>
    <associate|code-ref-write-chunklets-6|<tuple|65a|65>>
    <associate|code-ref-write-file-line-1|<tuple|65b|65>>
    <associate|code-ref-write-included-chunk-1|<tuple|63d|63>>
    <associate|code-ref-write-part-1|<tuple|63c|63>>
    <associate|code-ref-write_chunk()-1|<tuple|62b|62>>
    <associate|code-ref-write_chunk()-2|<tuple|62c|62>>
    <associate|code-ref-write_chunk()-3|<tuple|62d|62>>
    <associate|code-ref-write_chunk()-4|<tuple|63a|63>>
    <associate|code-ref-write_chunk()-5|<tuple|63b|63>>
    <associate|code-ref-wrote_chunk()-1|<tuple|?d|?>>
    <associate|code-ref-wrte_chunk()-1|<tuple|?d|?>>
    <associate|common-mode-definitions|<tuple|45a|45>>
    <associate|constants|<tuple|67a|67>>
    <associate|d|<tuple|?y|?>>
    <associate|d-|<tuple|?a|?>>
    <associate|de|<tuple|?y|?>>
    <associate|debug-output|<tuple|61b|61>>
    <associate|default-options|<tuple|59a|59>>
    <associate|delatex|<tuple|56a|56>>
    <associate|deu|<tuple|?y|?>>
    <associate|deum|<tuple|?y|?>>
    <associate|deump|<tuple|?y|?>>
    <associate|do-|<tuple|?a|?>>
    <associate|doc-|<tuple|?a|?>>
    <associate|docu-|<tuple|?a|?>>
    <associate|docum-|<tuple|?a|?>>
    <associate|docume-|<tuple|?a|?>>
    <associate|documen-|<tuple|?a|?>>
    <associate|document-|<tuple|?a|?>>
    <associate|document-p|<tuple|?a|?>>
    <associate|document-pr|<tuple|?a|?>>
    <associate|document-pre|<tuple|?a|?>>
    <associate|document-prea|<tuple|?a|?>>
    <associate|document-pream|<tuple|?a|?>>
    <associate|document-preamb|<tuple|?a|?>>
    <associate|document-preambl|<tuple|?a|?>>
    <associate|document-preamble|<tuple|19a|19>>
    <associate|du|<tuple|?y|?>>
    <associate|dum|<tuple|?y|?>>
    <associate|dump|<tuple|?y|?>>
    <associate|dump-|<tuple|?y|?>>
    <associate|dump-a|<tuple|?y|?>>
    <associate|dump-ar|<tuple|?y|?>>
    <associate|dump-arr|<tuple|?y|?>>
    <associate|dump-arra|<tuple|?y|?>>
    <associate|dump-array|<tuple|33e|33>>
    <associate|e|<tuple|?z|?>>
    <associate|end|<tuple|61c|61>>
    <associate|er|<tuple|?z|?>>
    <associate|err|<tuple|?z|?>>
    <associate|erro|<tuple|?z|?>>
    <associate|error|<tuple|?z|?>>
    <associate|error(|<tuple|?z|?>>
    <associate|error()|<tuple|34a|34>>
    <associate|example-makefile|<tuple|42a|42>>
    <associate|example-perl|<tuple|41a|41>>
    <associate|example-perl,|<tuple|?a|?>>
    <associate|example-perl,language=perl|<tuple|?a|?>>
    <associate|example-sh|<tuple|41b|41>>
    <associate|expand_chunk_args()|<tuple|38b|38>>
    <associate|footnote-1|<tuple|1|76>>
    <associate|footnote-2|<tuple|2|53>>
    <associate|footnote-3|<tuple|3|54>>
    <associate|footnote-4|<tuple|4|55>>
    <associate|footnote-5|<tuple|5|56>>
    <associate|footnote-6|<tuple|6|30>>
    <associate|footnr-1|<tuple|1|76>>
    <associate|footnr-2|<tuple|2|53>>
    <associate|footnr-3|<tuple|3|54>>
    <associate|footnr-4|<tuple|4|55>>
    <associate|footnr-5|<tuple|5|56>>
    <associate|footnr-6|<tuple|6|29>>
    <associate|g|<tuple|?c|?>>
    <associate|g-|<tuple|?a|?>>
    <associate|gca-test.awk|<tuple|37b|37>>
    <associate|gca-test.awk-results|<tuple|37c|37>>
    <associate|ge|<tuple|?c|?>>
    <associate|generate-output|<tuple|61a|61>>
    <associate|get|<tuple|?c|?>>
    <associate|get_|<tuple|?c|?>>
    <associate|get_c|<tuple|?c|?>>
    <associate|get_ch|<tuple|?c|?>>
    <associate|get_chu|<tuple|?c|?>>
    <associate|get_chun|<tuple|?c|?>>
    <associate|get_chunk|<tuple|?c|?>>
    <associate|get_chunk+|<tuple|?c|?>>
    <associate|get_chunk_|<tuple|?c|?>>
    <associate|get_chunk_a|<tuple|?c|?>>
    <associate|get_chunk_ar|<tuple|?c|?>>
    <associate|get_chunk_arg|<tuple|?c|?>>
    <associate|get_chunk_args|<tuple|?c|?>>
    <associate|get_chunk_args(|<tuple|?c|?>>
    <associate|get_chunk_args()|<tuple|36b|36>>
    <associate|getopt|<tuple|71d|71>>
    <associate|getopt.awk|<tuple|71c|71>>
    <associate|getopt.awk-begin|<tuple|71b|71>>
    <associate|getopt.awk-getopt()|<tuple|71a|71>>
    <associate|getopt.awk-header|<tuple|70a|70>>
    <associate|getopt.awk-notes|<tuple|70b|70>>
    <associate|gp-|<tuple|?a|?>>
    <associate|gpl-|<tuple|?a|?>>
    <associate|gpl3-|<tuple|?a|?>>
    <associate|gpl3-c|<tuple|?a|?>>
    <associate|gpl3-co|<tuple|?a|?>>
    <associate|gpl3-cop|<tuple|?a|?>>
    <associate|gpl3-copy|<tuple|?a|?>>
    <associate|gpl3-copyr|<tuple|?a|?>>
    <associate|gpl3-copyri|<tuple|?a|?>>
    <associate|gpl3-copyrig|<tuple|?a|?>>
    <associate|gpl3-copyrigh|<tuple|?a|?>>
    <associate|gpl3-copyright|<tuple|4a|4>>
    <associate|gpl3-copyright.hashed|<tuple|73b|73>>
    <associate|handle-options|<tuple|59c|59>>
    <associate|help()|<tuple|59e|59>>
    <associate|l|<tuple|?c|?>>
    <associate|latex-source|<tuple|15|73>>
    <associate|lone-newline|<tuple|5|56>>
    <associate|ly|<tuple|?c|?>>
    <associate|lyx|<tuple|?c|?>>
    <associate|lyx-|<tuple|?c|?>>
    <associate|lyx-b|<tuple|?c|?>>
    <associate|lyx-bu|<tuple|?c|?>>
    <associate|lyx-bui|<tuple|?c|?>>
    <associate|lyx-buil|<tuple|?c|?>>
    <associate|lyx-build|<tuple|81a|81>>
    <associate|lyx-build-|<tuple|?c|?>>
    <associate|lyx-build-h|<tuple|?c|?>>
    <associate|lyx-build-he|<tuple|?c|?>>
    <associate|lyx-build-hel|<tuple|?c|?>>
    <associate|lyx-build-help|<tuple|?c|?>>
    <associate|lyx-build-helpe|<tuple|?c|?>>
    <associate|lyx-build-helper|<tuple|81c|81>>
    <associate|lyx-build-manual|<tuple|82b|82>>
    <associate|lyx-build-script|<tuple|16.1|81>>
    <associate|lyx-build=|<tuple|?c|?>>
    <associate|makefile-glue|<tuple|30a|30>>
    <associate|makefile.inc|<tuple|6|23>>
    <associate|mode-definitions|<tuple|47a|47>>
    <associate|mode-tracker|<tuple|51b|51>>
    <associate|mode:add-escapes|<tuple|45c|45>>
    <associate|mode:add-hash-comments|<tuple|45f|45>>
    <associate|mode:add-hash-defines|<tuple|45g|45>>
    <associate|mode:add-naked-regex|<tuple|46f|46>>
    <associate|mode:add-submode|<tuple|45b|45>>
    <associate|mode:common-brackets|<tuple|44h|44>>
    <associate|mode:common-string|<tuple|44a|44>>
    <associate|mode:multi-line-comments|<tuple|45d|45>>
    <associate|mode:quote-dollar-escape|<tuple|45h|45>>
    <associate|mode:single-line-slash-comments|<tuple|45e|45>>
    <associate|mode_tracker|<tuple|52a|52>>
    <associate|mode_tracker(|<tuple|?a|?>>
    <associate|mode_tracker()|<tuple|51a|51>>
    <associate|modes|<tuple|9|41>>
    <associate|new-mode-tracker|<tuple|47e|47>>
    <associate|new-mode-tracker()|<tuple|47d|47>>
    <associate|new_mode_tracker|<tuple|?a|?>>
    <associate|noweb heading|<tuple|1|76>>
    <associate|output_chunk_names()|<tuple|61d|61>>
    <associate|output_chunks()|<tuple|62a|62>>
    <associate|p|<tuple|?e|?>>
    <associate|pa|<tuple|?e|?>>
    <associate|par|<tuple|?e|?>>
    <associate|pars|<tuple|?e|?>>
    <associate|parse|<tuple|?e|?>>
    <associate|parse-|<tuple|?e|?>>
    <associate|parse-c|<tuple|?e|?>>
    <associate|parse-ch|<tuple|?e|?>>
    <associate|parse-chu|<tuple|?e|?>>
    <associate|parse-chun|<tuple|?e|?>>
    <associate|parse-chunk|<tuple|?e|?>>
    <associate|parse-chunk-|<tuple|?e|?>>
    <associate|parse-chunk-a|<tuple|?e|?>>
    <associate|parse-chunk-ar|<tuple|?e|?>>
    <associate|parse-chunk-arg|<tuple|?e|?>>
    <associate|parse-chunk-args|<tuple|37a|37>>
    <associate|parse-chunk=|<tuple|?e|?>>
    <associate|parse_chunk_args|<tuple|38a|38>>
    <associate|parse_chunk_args-reset-modes|<tuple|49c|49>>
    <associate|pca-test.awk|<tuple|51c|51>>
    <associate|pca-test.awk-results|<tuple|51e|51>>
    <associate|pca-test.awk:summary|<tuple|51d|51>>
    <associate|process-chunk|<tuple|57a|57>>
    <associate|process-chunk-simple|<tuple|55c|55>>
    <associate|process-chunk-tabs|<tuple|55d|55>>
    <associate|read-options|<tuple|59b|59>>
    <associate|recognize-chunk|<tuple|55a|55>>
    <associate|restore-counter|<tuple|76e|76>>
    <associate|save-counter|<tuple|76d|76>>
    <associate|sec:Latex-Macros|<tuple|15.2|74>>
    <associate|sub:Chunk-parts|<tuple|12.1.1|62>>
    <associate|sub:ORS-chunk-text|<tuple|10.3|55>>
    <associate|sub:The-chunk-command|<tuple|15.2.1|75>>
    <associate|sub:lst-listings-includes|<tuple|10.3.1|55>>
    <associate|substitute-chunk-arg|<tuple|39d|39>>
    <associate|substitute-chunk-args|<tuple|39a|39>>
    <associate|t|<tuple|?h|?>>
    <associate|te|<tuple|?h|?>>
    <associate|tes|<tuple|?h|?>>
    <associate|test|<tuple|?h|?>>
    <associate|test:|<tuple|?h|?>>
    <associate|test:chunk-params|<tuple|85e|85>>
    <associate|test:chunk-params:result|<tuple|85d|85>>
    <associate|test:chunk-params:sub|<tuple|85a|85>>
    <associate|test:chunk-params:sub:sub|<tuple|85b|85>>
    <associate|test:chunk-params:text|<tuple|85c|85>>
    <associate|test:comment-quote|<tuple|46b|46>>
    <associate|test:comment-quote:C-result|<tuple|46e|46>>
    <associate|test:comment-quote:result|<tuple|46d|46>>
    <associate|test:comment-text|<tuple|46c|46>>
    <associate|test:cromulence|<tuple|48h|48>>
    <associate|test:escapes|<tuple|52c|52>>
    <associate|test:helpers|<tuple|82c|82>>
    <associate|test:hidden-else|<tuple|48g|48>>
    <associate|test:mode-definitions|<tuple|47b|47>>
    <associate|test:p|<tuple|?h|?>>
    <associate|test:pa|<tuple|?h|?>>
    <associate|test:par|<tuple|?h|?>>
    <associate|test:part|<tuple|?h|?>>
    <associate|test:parti|<tuple|?h|?>>
    <associate|test:partia|<tuple|?h|?>>
    <associate|test:partial|<tuple|?h|?>>
    <associate|test:partial-|<tuple|?h|?>>
    <associate|test:partial-c|<tuple|?h|?>>
    <associate|test:partial-ch|<tuple|?h|?>>
    <associate|test:partial-chu|<tuple|?h|?>>
    <associate|test:partial-chun|<tuple|?h|?>>
    <associate|test:partial-chunk|<tuple|48f|48>>
    <associate|test:run-tests|<tuple|81b|81>>
    <associate|test:say-hello|<tuple|48e|48>>
    <associate|test:whole-chunk|<tuple|48d|48>>
    <associate|testwhole-chunk|<tuple|?f|?>>
    <associate|teswhole-chunk|<tuple|?f|?>>
    <associate|tewhole-chunk|<tuple|?f|?>>
    <associate|twhole-chunk|<tuple|?f|?>>
    <associate|whole-chunk|<tuple|?f|?>>
    <associate|write-chunklets|<tuple|65a|65>>
    <associate|write-file-line|<tuple|65b|65>>
    <associate|write-included-chunk|<tuple|63d|63>>
    <associate|write-part|<tuple|63c|63>>
    <associate|write_chunk()|<tuple|63a|63>>
    <associate|wrote_chunk()|<tuple|?d|?>>
    <associate|wrte_chunk()|<tuple|?d|?>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|figure>
      <tuple|normal|Noweb Heading<label|noweb heading>|<pageref|auto-90>>
    </associate>
    <\associate|toc>
      Introduction <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1>

      <new-page*>License <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>

      <vspace*|2fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|font-size|<quote|1.19>|I<space|2spc>Using
      Newfangle> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|1fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction
      to Literate Programming> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Running
      Newfangle> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      2.1<space|2spc>Listing roots <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>

      2.2<space|2spc>Extracting roots <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>

      2.3<space|2spc>Formatting the document
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Using
      Newfangle with L<rsup|<space|-0.8spc><move|A|0fn|-0.1fn>><space|-0.2spc>T<rsub|<space|-0.4spc><move|<resize|<with|math-level|<quote|0>|E>||||0.5fn|>|0fn|-0.1fn>><space|-0.4spc>X>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Using
      Newfangle with L<space|-0.1667em><move|Y|0fn|-0.25em><space|-0.125em>X>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10><vspace|0.5fn>

      4.1<space|2spc>Installing the L<space|-0.1667em><move|Y|0fn|-0.25em><space|-0.125em>X
      module <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11>

      4.2<space|2spc>Obtaining a decent mono font
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-12>

      <with|par-left|<quote|1.5fn>|4.2.1<space|2spc>txfonts
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-13>>

      <with|par-left|<quote|1.5fn>|4.2.2<space|2spc>ams pmb
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-14>>

      <with|par-left|<quote|1.5fn>|4.2.3<space|2spc>Luximono
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-15>>

      4.3<space|2spc>Formatting your Lyx document
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-16>

      <with|par-left|<quote|1.5fn>|4.3.1<space|2spc>Customising the listing
      appearance <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-17>>

      <with|par-left|<quote|1.5fn>|4.3.2<space|2spc>Global customisations
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-18>>

      4.4<space|2spc>Configuring the build script
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-19>

      <with|par-left|<quote|1.5fn>|4.4.1<space|2spc>...
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-20>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Using
      Newfangle with T<rsub|<space|-0.4spc><move|<resize|<with|math-level|<quote|0>|E>||||0.5fn|>|0fn|-0.1fn>><space|-0.4spc>X<rsub|<space|-0.4spc><move|<resize|M<space|-0.2spc>A<space|-0.4spc>CS||||0.5fn|>|0fn|-0.1fn>>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-21><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6<space|2spc>Newfangle
      with Makefiles> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-22><vspace|0.5fn>

      6.1<space|2spc>A word about makefiles formats
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-23>

      6.2<space|2spc>Extracting Sources <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-24>

      <with|par-left|<quote|1.5fn>|6.2.1<space|2spc>Converting from
      L<space|-0.1667em><move|Y|0fn|-0.25em><space|-0.125em>X to
      L<rsup|<space|-0.8spc><move|A|0fn|-0.1fn>><space|-0.2spc>T<rsub|<space|-0.4spc><move|<resize|<with|math-level|<quote|0>|E>||||0.5fn|>|0fn|-0.1fn>><space|-0.4spc>X
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-25>>

      <with|par-left|<quote|1.5fn>|6.2.2<space|2spc>Converting from
      T<rsub|<space|-0.4spc><move|<resize|<with|math-level|<quote|0>|E>||||0.5fn|>|0fn|-0.1fn>><space|-0.4spc>X<rsub|<space|-0.4spc><move|<resize|M<space|-0.2spc>A<space|-0.4spc>CS||||0.5fn|>|0fn|-0.1fn>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-26>>

      6.3<space|2spc>Extracting Program Source
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-27>

      6.4<space|2spc>Extracting Source Files
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-28>

      6.5<space|2spc>Extracting Documentation
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-29>

      <with|par-left|<quote|1.5fn>|6.5.1<space|2spc>Formatting
      T<rsub|<space|-0.4spc><move|<resize|<with|math-level|<quote|0>|E>||||0.5fn|>|0fn|-0.1fn>><space|-0.4spc>X
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-30>>

      <with|par-left|<quote|3fn>|6.5.1.1<space|2spc>Running pdflatex
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-31>>

      <with|par-left|<quote|1.5fn>|6.5.2<space|2spc>Formatting
      T<rsub|<space|-0.4spc><move|<resize|<with|math-level|<quote|0>|E>||||0.5fn|>|0fn|-0.1fn>><space|-0.4spc>X<rsub|<space|-0.4spc><move|<resize|M<space|-0.2spc>A<space|-0.4spc>CS||||0.5fn|>|0fn|-0.1fn>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-32>>

      <with|par-left|<quote|1.5fn>|6.5.3<space|2spc>Building the
      Documentation as a Whole <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-33>>

      6.6<space|2spc>Other helpers <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-34>

      6.7<space|2spc>Boot-strapping the extraction
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-35>

      6.8<space|2spc>Incorporating Makefile.inc into existing projects
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-36>

      <with|par-left|<quote|6fn>|Example <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-37><vspace|0.15fn>>

      <vspace*|2fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|font-size|<quote|1.19>|II<space|2spc>Source
      Code> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-38><vspace|1fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|7<space|2spc>Newfangle
      awk source code> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-39><vspace|0.5fn>

      7.1<space|2spc>AWK tricks <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-40>

      7.2<space|2spc>Catching errors <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-41>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|8<space|2spc>L<rsup|<space|-0.8spc><move|A|0fn|-0.1fn>><space|-0.2spc>T<rsub|<space|-0.4spc><move|<resize|<with|math-level|<quote|0>|E>||||0.5fn|>|0fn|-0.1fn>><space|-0.4spc>X
      and lstlistings> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-42><vspace|0.5fn>

      8.1<space|2spc>Additional lstlstings parameters
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-43>

      8.2<space|2spc>Parsing chunk arguments
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-44>

      8.3<space|2spc>Expanding parameters in the text
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-45>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|9<space|2spc>Language
      Modes & Quoting> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-46><vspace|0.5fn>

      9.1<space|2spc>Modes <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-47>

      <with|par-left|<quote|1.5fn>|9.1.1<space|2spc>Modes to keep code
      together <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-48>>

      <with|par-left|<quote|1.5fn>|9.1.2<space|2spc>Modes affect included
      chunks <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-49>>

      9.2<space|2spc>Language Mode Definitions
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-50>

      <with|par-left|<quote|1.5fn>|9.2.1<space|2spc>Backslash
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-51>>

      <with|par-left|<quote|1.5fn>|9.2.2<space|2spc>Strings
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-52>>

      <with|par-left|<quote|1.5fn>|9.2.3<space|2spc>Parentheses, Braces and
      Brackets <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-53>>

      <with|par-left|<quote|1.5fn>|9.2.4<space|2spc>Customizing Standard
      Modes <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-54>>

      <with|par-left|<quote|1.5fn>|9.2.5<space|2spc>Comments
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-55>>

      <with|par-left|<quote|1.5fn>|9.2.6<space|2spc>Regex
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-56>>

      <with|par-left|<quote|1.5fn>|9.2.7<space|2spc>Perl
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-57>>

      <with|par-left|<quote|1.5fn>|9.2.8<space|2spc>sh
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-58>>

      9.3<space|2spc>Some tests <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-59>

      9.4<space|2spc>A non-recursive mode tracker
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-60>

      <with|par-left|<quote|1.5fn>|9.4.1<space|2spc>Constructor
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-61>>

      <with|par-left|<quote|1.5fn>|9.4.2<space|2spc>Management
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-62>>

      <with|par-left|<quote|1.5fn>|9.4.3<space|2spc>Tracker
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-63>>

      <with|par-left|<quote|3fn>|9.4.3.1<space|2spc>One happy chunk
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-64>>

      <with|par-left|<quote|3fn>|9.4.3.2<space|2spc>Tests
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-65>>

      9.5<space|2spc>Escaping and Quoting
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-66>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|10<space|2spc>Recognizing
      Chunks> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-67><vspace|0.5fn>

      10.1<space|2spc>Chunk start <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-68>

      <with|par-left|<quote|1.5fn>|10.1.1<space|2spc>lstlistings
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-69>>

      <with|par-left|<quote|1.5fn>|10.1.2<space|2spc>Noweb
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-70>>

      10.2<space|2spc>Chunk end <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-71>

      <with|par-left|<quote|1.5fn>|10.2.1<space|2spc>lstlistings
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-72>>

      <with|par-left|<quote|1.5fn>|10.2.2<space|2spc>noweb
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-73>>

      10.3<space|2spc>Chunk contents <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-74>

      <with|par-left|<quote|1.5fn>|10.3.1<space|2spc>lstlistings
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-75>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|11<space|2spc>Processing
      Options> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-76><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|12<space|2spc>Generating
      the Output> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-77><vspace|0.5fn>

      12.1<space|2spc>Assembling the Chunks
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-78>

      <with|par-left|<quote|1.5fn>|12.1.1<space|2spc>Chunk Parts
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-79>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|13<space|2spc>Storing
      Chunks> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-80><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|14<space|2spc>getopt>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-81><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|15<space|2spc>Newfangle
      LaTeX source code> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-82><vspace|0.5fn>

      15.1<space|2spc>newfangle module <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-83>

      <with|par-left|<quote|1.5fn>|15.1.1<space|2spc>The Chunk style
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-84>>

      <with|par-left|<quote|1.5fn>|15.1.2<space|2spc>The chunkref style
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-85>>

      15.2<space|2spc>Latex Macros <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-86>

      <with|par-left|<quote|1.5fn>|15.2.1<space|2spc>The chunk command
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-87>>

      <with|par-left|<quote|3fn>|15.2.1.1<space|2spc>Chunk parameters
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-88>>

      <with|par-left|<quote|1.5fn>|15.2.2<space|2spc>The noweb styled caption
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-89>>

      <with|par-left|<quote|1.5fn>|15.2.3<space|2spc>The chunk counter
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-91>>

      <with|par-left|<quote|1.5fn>|15.2.4<space|2spc>Cross references
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-92>>

      <with|par-left|<quote|1.5fn>|15.2.5<space|2spc>The end
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-93>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|16<space|2spc>Extracting
      newfangle> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-94><vspace|0.5fn>

      16.1<space|2spc>Extracting from Lyx
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-95>

      16.2<space|2spc>Extracting documentation
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-96>

      16.3<space|2spc>Extracting from the command line
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-97>

      16.4<space|2spc>Testing <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-98>

      <vspace*|2fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|font-size|<quote|1.19>|III<space|2spc>Tests>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-99><vspace|1fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|17<space|2spc>Chunk
      Parameters> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-100><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|18<space|2spc>Compile-log-lyx>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-101><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>