![btree_depth_3_graceful][btree_depth_3_graceful]

![73_symmetric_star][73_symmetric_star]

![4v_all][4v_all]
![5v_all][5v_all]

[btree_depth_3_graceful]: ./graph_images/btree_depth_3_graceful.png
[73_symmetric_star]: ./graph_images/73_symmetric_star.png
[4v_all]: ./graph_images/4v_all.png
[5v_all]: ./graph_images/5v_all.png


### Symmetric Star labeling

Example:

```ruby
star = SymmetricStarLabeling.new(6, 9)
star.print_vlabels
star.print_elabels(:blue)

puts "#{3}th branch, #{4}th vertex is #{star.vlabel(3, 4)}."

#=> all vertex labelings
54	45	36	27	18	9
1	 10	19	28	37	46
53	44	35	26	17	8
2	 11	20	29	38	47
52	43	34	25	16	7
3	 12	21	30	39	48
51	42	33	24	15	6
4	 13	22	31	40	49
50	41	32	23	14	5

#=> all edge labelings colored in terminal blue
54	45	36	27	18	9
53	35	17	1     19	37
52	34	16	2	 20	38
51	33	15	3	 21	39
50	32	14	4	 22	40
49	31	13	5	 23	41
48	30	12	6	 24	42
47	29	11	7	 25	43
46	28	10	8	 26	44

# 3th branch, 4th vertex is 20.
```
