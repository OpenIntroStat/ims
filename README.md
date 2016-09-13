
OpenIntro Statistics, Second Edition is available at http://www.openintro.org under a Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported license (CC BY-NC-SA). See [LICENSE](LICENSE.md) for more information.

- - -


Project Organization
--------------------

- Each chapter's content is in one of the eight chapter folders that start with "ch_". Within each folder, there is a "figures" folder and a "TeX" folder. The TeX folder contains the text files that are used to typeset the chapters in the textbook.
- In many cases, R code is supplied with figures to regenerate the figure. It will often be necessary to install the "openintro" R package that is available from GitHub (https://github.com/OpenIntroOrg) if you would like to regenerate a figure. Other packages may also occasionally be required.
- Exercise figures may be found in [chapter folder] > figures > eoce > [exercise figure folders]. "EOCE" means end-of-chapter exercises.
- The extraTeX folder contains files for the front and back matter of the textbook and also the style files. Note that use of any style files, like all other files here, is under the Creative Commons license cited in the LICENSE file.

- - -

Typesetting the Textbook
------------------------

The textbook may be typeset using the main.tex file. This file pulls in all of the necessary TeX files and figures. For a final typesetting event, typeset in the following order

- LaTeX 3 times.
- MakeIndex once.
- BibTeX once.
- LaTeX once.
- MakeIndex once.
- LaTeX once.

This isn't important for casual browsing, but it is important for a "final" version. The repetitive typesetting is to account for when typesetting changes references slightly, since typesetting the first few times can move content from one page to the next, e.g. as a \ref{...} gets filled in.

- - -

Learning LaTeX
--------------

If you are not familiar with LaTeX but would like to learn how to use it, check out

http://scc.stat.ucla.edu/mini-courses/materials-from-past-mini-courses/spring-2010-mini-course-materials/

Two of the authors of these guides are the same people involved with OpenIntro. For a more authoritative review, the book "Guide to LaTeX" is an excellent resource.
