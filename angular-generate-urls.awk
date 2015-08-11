### angular-generate-urls.awk --- Generate an URL list for creating a sitemap.

### Copyright (C) 2015 António P. P. Almeida <appa@perusio.net>

### Author: António P. P. Almeida <appa@perusio.net>

### Permission is hereby granted, free of charge, to any person obtaining a
### copy of this software and associated documentation files (the "Software"),
### to deal in the Software without restriction, including without limitation
### the rights to use, copy, modify, merge, publish, distribute, sublicense,
### and/or sell copies of the Software, and to permit persons to whom the
### Software is furnished to do so, subject to the following conditions:

### The above copyright notice and this permission notice shall be included in
### all copies or substantial portions of the Software.

### Except as contained in this notice, the name(s) of the above copyright
### holders shall not be used in advertising or otherwise to promote the sale,
### use or other dealings in this Software without prior written authorization.

### THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
### IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
### FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
### THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
### LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
### FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
### DEALINGS IN THE SOFTWARE.

### Example:
### awk -v frequency="daily" -v priority=0.7 -f angular-generate-urls.awk routes.js

## Parse the routes.
/^[[:space:]+]+url:/ {
    ## Remove the quotes.
    gsub(/["',]/, "", $2)
    ## Print the URL and the frequency and priority if given.
    printf("%s%s%s%s\n",
           domain,
           $2 != "/" ? $2 : "",
           frequency ? sprintf(" changefreq=%s", frequency) : "",
           priority ? sprintf(" priority=%.1f", priority) : "")
}
