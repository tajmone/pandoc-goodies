/*
\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
GitHub HTML5 Pandoc Template: Inject CSS v1.0 (2017-11-21)
(c) Tristano Ajmone, 2017. MIT License (MIT).
https://github.com/tajmone/pandoc-goodies
//////////////////////////////////////////////////////////////////////////////

This script will:

1. Load the given template source file, which contains a placeholder string
   indicating where to inject the CSS contents;
2. Load the contents of the given CSS file in memory;
3. Replace the placeholder string with the CSS contents (inject them);
4. Save the final result to the given destination file.

*/

templateFile  = "GitHub_source.html5" // Template with CSS-injection placeholder
cssFile       = "GitHub.min.css"      // CSS source to inject into placeholder
outFile       = "../GitHub.html5"     // Final template output file
placeHolder   = "{{CSS-INJECT}}"      // Placeholder string for CSS-injection

var fs = require('fs')
// ------------------------------------------------------------------------------
//                               Load CSS Into Var                               
// ------------------------------------------------------------------------------
try {  
    var CSS = fs.readFileSync(cssFile, 'utf8');
} catch(e) {
    console.log('Error:', e.stack);
    process.exit(1);
}
// ------------------------------------------------------------------------------
//                             Load Template Into Var                            
// ------------------------------------------------------------------------------
try {  
    var Template = fs.readFileSync(templateFile, 'utf8');
} catch(e) {
    console.log('Error:', e.stack);
    process.exit(1);
}
// ------------------------------------------------------------------------------
//                            Inject CSS Into Template                           
// ------------------------------------------------------------------------------
Template = Template.replace(placeHolder, CSS);
// var result = Template.replace(placeHolder, CSS);

try {  
    fs.writeFileSync(outFile, Template, 'utf8');
} catch(e) {
    console.log('Error:', e.stack);
    process.exit(1);
}



