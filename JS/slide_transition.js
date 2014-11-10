current_slide = null;

slide_transition = function(slidenumber) {
    console.log("transition " + current_slide + " -> " + slidenumber);

    if(slidenumber == current_slide) return;
    current_slide = slidenumber;


    if(slidenumber==35) {
        console.log("entered D3 slide")

        d3.select("p#dotenter").transition()
                               .style("opacity", 1)
                               .delay(20000)
                               .duration(5000)
                               .ease("linear");

  }
}
