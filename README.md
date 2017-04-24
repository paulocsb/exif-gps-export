# README

Utility in Ruby that reads all the images in the attached directory, extracts their EXIF GPS data (longitude and latitude), and then writes the name of the image and the coordinates for each image to a CSV/HTML file.

## Dependencies
- [Exif](https://github.com/tonytonyjan/exif)

## Run
Export to csv format
```
$ ruby app.rb
```
change format csv or html
```
$ ruby app.rb --format=csv|html
```

## Test
---------------
```
$ rspec
```