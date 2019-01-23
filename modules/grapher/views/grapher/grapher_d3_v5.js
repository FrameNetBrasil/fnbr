<script type="text/javascript">

var grapher = {
    isMaster: {{$data->isMaster|noescape}},
    currentyEntity: null,
    relationEntry: {{$data->relationEntry|noescape}},
    relationData: [],
    relations: [],
    onDblClick: function(node) {
        console.log(node);
        this.show(node.id, true);
    },
    clickLink: function(link) {
        this.showLink(link);
    }
};

var i = 0;
for (relation in grapher.relationEntry) {
    grapher.relationData[i] = grapher.relationEntry[relation];
    grapher.relations[i] = grapher.relationEntry[relation]['id'];
    i++;
}

grapher.graph = function (element) {

    var $element = $('#' + element);
    var w = $element.innerWidth() - 10;
    var h = $element.innerHeight() - 10;

    var type = {
        cxn: {symbol: d3.symbolCircle, size:260},
        frame: {symbol: d3.symbolSquare, size:260},
        fe: {symbol: d3.symbolCircle, size:80},
        ce: {symbol: d3.symbolCircle, size:80},
        st: {symbol: d3.symbolTriangle, size:100},
        cp: {symbol: d3.symbolTriangle, size:100}
    };
    
    var svg = this.svg = d3.select($element[0]).append("svg")
            .attr("width", w)
            .attr("height", h);

    // elements for data join
    var link = svg.append("g")
        .selectAll("line");
    var node = svg.append("g")
        .selectAll("g");
    //var text = svg.append("g")
    //    .selectAll("text");

    this.nodes = [],
    this.links = [];

    var simulation = d3.forceSimulation()
        .force("link", d3.forceLink().id(d => d.id))
        .force("charge", d3.forceManyBody().strength(function(d) { return -500;}))
        .force("center", d3.forceCenter(w / 2, h / 2));

    // Per-type markers, as they don't inherit styles.
    svg.append("defs").selectAll("marker")
        .data(grapher.relations)
        .enter().append("marker")
        .attr("id", function(d) { return d; })
        .attr("viewBox", "0 -5 10 10")
        .attr("refX", 18)
        .attr("refY", 0)
        .attr("markerWidth", 6)
        .attr("markerHeight", 6)
        .attr("orient", "auto")
        .append("path")
        .attr("class", function(d) { return d; })
        .attr("d", "M0,-3L8,0L0,3");

    this.clearLink = function () {
        var i = 0;
        while (i < this.links.length) {
            this.links.splice(i,1);
        }
    }

    this.clearNode = function () {
        var i = 0;
        while (i < this.nodes.length) {
            this.nodes.splice(i,1);
        }
    }

    this.clear = function() {
        this.clearLink();
        this.clearNode();
        this.update();
    }

    this.addNode = function (node) {
        node.size = type[node.type].size;
        node.symbol = type[node.type].symbol;
        this.nodes.push(node);
    }

    this.addLink = function (link) {
        var sourceNode = this.findNode(link.source.id);
        if (sourceNode === undefined) {
            this.addNode(link.source);
        } else {
            link.source = sourceNode;
        }
        var targetNode = this.findNode(link.target.id);
        if (targetNode === undefined) {
            this.addNode(link.target);
        } else {
            link.target = targetNode;
        }
        var existsLink = this.findLink(link);
        if (!existsLink) {
            this.links.push(link);
        }
    }

    this.findNode = function (id) {
        for (var i = 0; i < this.nodes.length; i++) {
            if (this.nodes[i].id === id) {
                return this.nodes[i]
            }
        }
    }


    this.findLink = function (link) {
        for (var i = 0; i < this.links.length; i++) {
            var l = this.links[i];
            if ((l.source.id === link.source.id) && (l.target.id === link.target.id) && (l.type === link.type)) {
                return true;
            }
        }
        return false;
    }

    function dblclick() {
        grapher.onDblClick(d3.select(this).data()[0]);
    }

    function clickLink() {
        grapher.clickLink(d3.select(this).data()[0]);
    }

    var dragstarted = function (d) {
        //if (!d3.event.active) simulation.alphaTarget(0.3).restart();
        d.fx = d.x;
        d.fy = d.y;
        //d3.select(this).classed("fixed", d.fixed = true);
    }

    var dragged = function (d) {
            d.fx = d3.event.x;
            d.fy = d3.event.y;
        }

    var dragended = function (d) {
            //if (!d3.event.active) simulation.alphaTarget(0);
//            d.fx = null;
//            d.fy = null;
    }
/*
    function dragstarted(d) {
        d3.select(this).classed("fixed", d.fixed = true);
    }
*/
//	follow v4 general update pattern
    this.update = function () {

        // Update link set based on current state
        // DATA JOIN
        link = link.data(this.links);

        // EXIT
        // Remove old links
        link.exit().remove();

        // ENTER
        // Create new links as needed.
        link = link
            .enter().append("line")
            .attr("class", function (d) {
                return "link " + d.type;
            })
            .attr("marker-end", function (d) {
                return (d.type == 'rel_elementof' ? "" : "url(#" + d.type + ")");
            })
            .on("mouseover", function (d) {
                d3.select(this).attr("class", "link " + d.type + ' linkOver');
            })
            .on("mouseout", function (d) {
                d3.select(this).attr("class", "link " + d.type);
            })
            .on("dblclick", clickLink)
            .merge(link);

        // DATA JOIN
        node = node.data(this.nodes);

        // EXIT
        node.exit().remove();

        // ENTER
        node = node
            .enter().append('g')

        var symbol = node
            .append('path')
            .attr("d", d3.symbol()
                .size(function(d) {return d.size;})
                .type(function(d) {return d.symbol;})
            )
            .attr("class", function (d) {
                var cssClass = 'node ' +  ((d.id == grapher.currentEntity) ? " nodeSelected" : " nodeNormal") + ' entity_' + d.type;
                return cssClass;
            })
            .on("dblclick", dblclick)
            .call(d3.drag()
                .on("start", dragstarted)
                .on("drag", dragged)
                .on("end", dragended)
            )
            .merge(node);

        var text = node
            .append("text")
            .text(function(d) {
                return d.name;
            })
            .attr('x', 8)
            .attr('y', 4);

        /*
        text = text.data(this.nodes);
        text.exit().remove();
        text = text
            .enter().append("text")
            .attr("x", 8)
            .attr("y", ".31em")
            .attr("class", function (d) {
                return "text";
            })
            .text(function (d) {
                return d.name;
            });
        */

        //	Set nodes, links, and alpha target for simulation
        simulation
             .nodes(this.nodes);

        simulation
            .force("link")
            .links(this.links);

        simulation.alphaTarget(0.3).restart();

        simulation.on("tick", () => {
            link
            .attr("x1", function(d) { return d.source.x; })
            .attr("y1", function(d) { return d.source.y; })
            .attr("x2", function(d) { return d.target.x; })
            .attr("y2", function(d) { return d.target.y; });

            node
                .attr("transform", function(d) {
                    return "translate(" + d.x + "," + d.y + ")";
                });

            //text
            //    .attr("transform", function(d) {
            //        return "translate(" + d.x + "," + d.y + ")";
            //    });
        });
/*
        svg.selectAll("g").remove();

        var link = svg.append("g")
            .selectAll("line")
            .data(links)
            .enter().append("line")
            .attr("class", function (d) {
                return "link " + d.type;
            })
            .attr("marker-end", function (d) {
                return (d.type == 'rel_elementof' ? "" : "url(#" + d.type + ")");
            })
            .on("mouseover", function (d) {
                d3.select(this).attr("class", "link " + d.type + ' linkOver');
            })
            .on("mouseout", function (d) {
                d3.select(this).attr("class", "link " + d.type);
            })
            .on("dblclick", clickLink);

        var node = svg.append("g")
            .selectAll("path")
            .data(nodes)
            .enter().append('path')
            .attr("d", d3.symbol()
                 .size(function(d) {return d.size;})
                 .type(function(d) {return d.symbol;})
            )
            .attr("class", function (d) {
                 var cssClass = ((d.id == grapher.currentEntity) ? " nodeSelected" : " nodeNormal") + ' entity_' + d.type;
                 return cssClass;
            })
            .on("click", function (d) { d.fixed = true })
            .on("dblclick", dblclick)
            .call(d3.drag()
                .on("start", dragstarted)
                .on("drag", dragged)
                .on("end", dragended));

        var text = svg.append("g")
            .selectAll("text")
            .data(nodes)
            .enter().append("text")
            .attr("x", 8)
            .attr("y", ".31em")
            .text(function (d) {
                return d.name;
            });
*/


        //layout.start(10,15,20);


    }

    // Make it all go
    //update();
}

</script>

