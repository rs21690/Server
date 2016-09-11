   //call by: intersect_rct(x,y,x1,y1,x2,y2);
   var x1 , y1 , x2 , y2 , x3 , y3;
   x1 = argument0; y1 = argument1; x2 = argument2;
   y2 = argument3; x3 = argument4; y3 = argument5;
   return ( x1 >= x2 && x1 <= x3 && y1 >= y2 && y1 <= y3 );
