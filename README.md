
### Repository Guide

The repository holds both the course materials and function as the course website. The website is bare bones on purpose since it will be updated many times during the course, and I felt simpler translates to less errors. The folder structure is as follows:

1.  **\_Graphics**: Contains all graphics used in any of the lectures and labs.

2.  **\_HeadersEtc**: Contains the css stylesheet used for the labs as well as the html script to make the lab answer button work. The files inside the folder `SESYNCBayes` provide the logo, authors, course title, and lecture beamer template. I centralized these files to make it easier to change these values for future course iterations. The file `hideOutput.js` provides the answer button functionality.

3.  **\_Lectures**: Contains all the lecture `.Rmd`, `.lyx`, or `.tex` files, each in its own subfolder.

4.  **\_Labs**: Contains all the lab `.Rmd` files, each in its own subfolder.

5.  **\_Packages**: Contains all data frames used in the course in the form of the package `SESYNCBayes`.

6.  **content**: Contains all the pdf or html lab and lecture files knitted with markdown or rendered with lyx and LaTeX.

7.  **docs**: Contains the live website and should not be altered, except by rebuilding the website (see below).

------------------------------------------------------------------------

### Buttons for labs

Buttons are, well, just great. Students love them! Here is how you add one to your markdown files. After the yaml, add the line to run the `hideOutput.js` script:

``` perl
<script src="../../_HeadersEtc/hideOutput.js"></script>
```

Then to actually use a button do:

``` perl
<button class="button" onclick="toggle_visibility('myDIV1');">Answers</button>
<div id="myDIV1", style="display:none">
# some stuff here that gets displayed when you run the button, usually a code chunk.
</div>
```

Don't forget to update the id for each subsequent button you add to a document. I usually do `myDIV1`, `myDIV2`, etc.

------------------------------------------------------------------------

### How to update the course package

Here is a very quick and easy way to alter the `SESYNCBayes` R package.

1.  Make a new R project and select the `_Packages` directory and `R package` for the type of project.

2.  Update whatever you need to in the existing datasets in the `SESYNCBayes` folder. If you are adding a new data frame, then add the `.rda` file to the `data` folder, make a `.Rd` file in the `man` folder and `.R` file in the `R` folder. For these last two, make a copy of one of the exsting files as a template and modify it as necessary.

3.  Open the `DESCRIPTION` file in the `SESYNCBayes` folder and update the version number to avoid confusion.

4.  In the environment pane, click the `More` icon under `Build`, then `Build Source Package`.

5.  Copy the zipped file to the `content/package` directory.

6.  Update the version number in `Logistics.Rmd`.

7.  Rebuild the website (see below).

8.  Make your commits as normal, but remember the R project file won't be commited since it is in the `.gitignore`. This is ok. If you make a new change to the website you do not need to make a new R project, just open the existing one.

------------------------------------------------------------------------

### How to update the course website

Here is a very quick and easy way to update the `SESYNCBayes` R package.
