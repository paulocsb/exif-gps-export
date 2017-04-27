# README

Utility in Ruby that reads all the images in the attached directory, extracts their EXIF GPS data (longitude and latitude), and then writes the name of the image and the coordinates for each image to a CSV/HTML file.

## Dependencies
- [Exif](https://github.com/tonytonyjan/exif)

## Instalation
```
$ bundle install
```
## Run
Export to csv format (default)
```
$ ruby app.rb
```
### Options
Choose the output format: csv or html
```
$ ruby app.rb --format=csv|html
```
Especify the directory that contains the images:
```
$ ruby app.rb --directory=custom_directory
```

## Test
```
$ rspec
```