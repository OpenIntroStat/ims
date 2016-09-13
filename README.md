
OpenIntro Statistics, Second Edition is available at http://www.openintro.org under a Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported license (CC BY-NC-SA):

http://creativecommons.org/licenses/by-nc-sa/3.0/

This file describes guidelines when the textbook's source files are modified and/or shared. The CC BY-NC-SA license guidelines supercede any guidelines put forth in this file; follow the CC BY-NC-SA license if there is any discrepency between that license and these guidelines.

1. Communication obligation. Any derivative work must communicate that it is licensed under a CC BY-NC-SA license, and it also must include the following link (a copy of this file) so authors making further derivatives may understand the attribution guidelines put forth by the original authors:

http://www.openintro.org/perm/stat2nd_v1.txt

Additional attribution (e.g. citing the original work) may be necessary depending on how the source materials are used. See the CC BY-NC-SA licese for additional details.

2. Figure attribution. Some photographs from OpenIntro Statistics are owned by other creators who made the images available under a Creative Commons license. If you use a photograph, please check in the textbook whether the figure is a work of another party. If you use any such images, provide appropriate attribution to the original photographer (e.g. see OpenIntro Statistics for what we believe to be appropriate attribution in these instances).

3. Derivative title. No derivative may include "OpenIntro" in the title, unless it is included in text of the form "Derivative of OpenIntro", e.g. one might add a subtitle that includes "Derivative of OpenIntro Statistics, Second Edition".

There is one exception to this guideline. If the original textbook PDF is used to make paper copies the textbook and no modifications (changes or additions) are made, then the title should be "OpenIntro Statistics" with a clear designation that it is the Second Edition. However, it should also be clearly noted that it is not an official copy of the textbook; this communicates that the authors have not endorsed the print product. Use of the OpenIntro logo is also strictly prohibited (the logo is not licensed for use).

4. Defining commercial. Some may be unclear what is meant by "NonCommercial". The authors may provide examples, presently or in the future, that exemplify what it views as noncommercial at the following URL:

http://www.openintro.org/rights.php

Examples, if any, listed on this page may not correspond to the interpretation of contibuting authors. Any such examples on this webpage are not intended to modify the CC license, only help alleviate concerns for specific use.

5. Below are other suggested guidelines for attribution.

- The first two pages of any derivative work should be the title page and the copyright page. We encourage contributors to use the following two files provided in the textbook's source: file, extraTeX > preamble > title, copyright.

- We advise that contributing authors' names be listed in chronological order corresponding to their contribution. We also encourage contributing authors to provide a brief description of their contribution.

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
