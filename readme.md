# bookscanner

This is a script I'm working on to automate processing of diy-bookscanner'd books.

#### usage

Put your images into `odd` and `even` folders, if you used a two camera DIY scanner they should already be separate. 

Modify `makebook.rb` to suit your needs, you can find out your crop offset and size using GIMP. 

Change resize to suit the resolution of your cameras, this pretty much directly determines the size of your PDF, too large and your PDF can be huge (gigabytes), too small and you will lose detail.

Once you are ready, simply run it with `ruby makebook.rb`. You do have ruby installed... right?
