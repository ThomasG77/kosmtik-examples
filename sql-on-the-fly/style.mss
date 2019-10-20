Map {
  background-color: #b8dee6;
}

#countries {
  ::outline {
    line-color: #85c5d3;
    line-width: 2;
    line-join: round;
  }
  polygon-fill: #fff;
}

#sql {
  ::poly {
    ['mapnik::geometry_type'=polygon] {
      polygon-fill:steelblue;
      line-color:darkblue;     
    }
  }
  ::line {
    ['mapnik::geometry_type'=linestring] {
     line-color:orange;
    }
  }
  ::point {
    ['mapnik::geometry_type'=point] {
       //marker-width:[persons]/300000;
       marker-allow-overlap:true;
       //marker-opacity:.5;
    }
  }
}



















