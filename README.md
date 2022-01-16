# processings
For Processing experiements

- processing3: for Processing 3 projects
- processing4: for Processing 4 projects

## Exporting gifs
- add this line to the end of the `draw` method: `saveFrame("frame" + frameCount + ".png");`
- gifski command (windows): `../../../.\gifski --fps {frame_rate} -o {gif_name}.gif *.png --quality 100`

### Gifski usage
`USAGE: gifski.exe <FILE>... --fast-forward <x> --fps <num> --output <a.gif> --quality <1-100>`