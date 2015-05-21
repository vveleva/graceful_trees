# Cheatsheet: GraphViz

```ruby

digraph :G do
  node[
    color: :tomato,
    style: :filled,
    shape: :egg]
  edge[color: :gray, arrowhead: :vee]

  output png: "graph_name.png"
```

#### node attributes

|name| default| value|
|:--------:|:--------:|:----------:|
|color | black | node shape color|
|comment | | any string (format-dependent)
|distortion | 0.0 | node distortion for shape=polygon
|fillcolor | lightgrey/black | node fill color
|fixedsize | false | label text has no affect on node size
|fontcolor | black | type face color
|fontname | Times-Roman | font family
|fontsize | 14 point | size of label
|group | | name of nodes group
|height | .5 | height in inches
|label | node name | any string
|layer | overlay | range all, id or id:id
|orientation | 0.0 | node rotation angle
|peripheries | shape-dependent | number of node boundaries
|regular | false | force polygon to be regular
|shape | ellipse | node shape; see Section 2.1 and Appendix E
|shapefile | | external EPSF or SVG custom shape file
|sides | 4 | number of sides for shape=polygon
|skew | 0.0 | skewing of node for shape=polygon
|style | | graphics options, e.g. bold, dotted, filled
|URL | | URL associated with node (format-dependent)
|width | .75 | width in inches
|z | 0.0 | z coordinate for VRML output

### edge attributes

|name| default| value|
|:--------:|:--------:|:----------:|
|arrowhead | normal | style of arrowhead at head end
|arrowsize | 1.0 | scaling factor for arrowheads
|arrowtail | normal | style of arrowhead at tail end
|color | black | edge stroke color
|comment | | any string (format-dependent)
|constraint | true | use edge to affect node ranking
|decorate | | if set, draws a line connecting labels with their edges
|dir | forward | forward, back, both, or none
|fontcolor | black | type face color
|fontname | Times-Roman | font family
|fontsize | 14 point | size of label
|headlabel | | label placed near head of edge
|headport | | n,ne,e,se,s,sw,w,nw
|headURL | | URL attached to head label if output format is ismap
|label | | edge label
|labelangle | -25.0 | angle in degrees which head or tail label is rotated off edge
|labeldistance | 1.0 | scaling factor for distance of head or tail label from node
|labelfloat | false | lessen constraints on edge label placement
|labelfontcolor | black | type face color for head and tail labels
|labelfontname | Times-Roman | font family for head and tail labels
|labelfontsize | 14 point | size for head and tail labels
|layer | overlay | range all, id or id:id
|lhead | | name of cluster to use as head of edge
|ltail | | name of cluster to use as tail of edge
|minlen | 1 | minimum rank distance between head and tail
|samehead | | tag for head node; edge heads with the same tag are merged onto the same port
|sametail | | tag for tail node; edge tails with the same tag are merged onto the same port
|style | | graphics options, e.g. bold, dotted, filled
|taillabel | | label placed near tail of edge
|tailport | | n,ne,e,se,s,sw,w,nw
|tailURL | | URL attached to tail label if output format is ismap
|weight | 1 | integer cost of stretching an edge


### graph attributes

|name | default | value|
|:-----|:------|
|bgcolor| |background color for drawing, plus initial fill color|
|center| false| center drawing on page|
|clusterrank| local| may be global or none|
|color |black |for clusters, outline color, and fill color if fillcolor not defined|
|comment ||any string (format-dependent)|
|compound |false| allow edges between clusters|
|concentrate |false| enables edge concentrators|
|fillcolor |black| cluster fill color|
|fontcolor |black| type face color|
|fontname |Times-Roman| font family|
|fontpath ||list of directories to search for fonts|
|fontsize |14 point| size of label|
|label ||any string|
|labeljust |centered| ”l” and ”r” for left- and right-justified cluster labels, respectively|
|labelloc |top |”t” and ”b” for top- and bottom-justified cluster labels, respectively|
|layers ||id:id:id...|
|margin |.5| margin included in page, inches|
|mclimit |1.0| scale factor for mincross iterations|
|nodesep |.25| separation between nodes, in inches|
|nslimit| | if set to f, bounds network simplex iterations by (f)(number of nodes) when setting x-coordinates|
|nslimit1 if set to f, bounds network simplex iterations by (f)(number of nodes) when ranking nodes|
|ordering ||if out out edge order is preserved|
|orientation| portrait| if rotate is not used and the value is landscape, use landscape orientation
|page ||unit of pagination, e.g. "8.5,11"
|pagedir |BL| traversal order of pages
|quantum ||if quantum ¿ 0.0, node label dimensions will be rounded to integral multiples of quantum
|rank|| same, min, max, source or sink
|rankdir |TB| LR (left to right) or TB (top to bottom)
|ranksep |.75| separation between ranks, in inches.
|ratio ||approximate aspect ratio desired, fill or auto
|remincross|| if true and there are multiple clusters, re-run crossing minimization
|rotate|| If 90, set orientation to landscape
|samplepoints |8| number of points used to represent ellipses and circles on output
|searchsize |30| maximum edges with negative cut values to check when looking for a
|minimum ||one during network simplex
|size ||maximum drawing size, in inches
|style ||graphics options, e.g. filled for clusters
|URL ||URL associated with graph (format-dependent)
