   //call by: intersect_tri(x,y,x1,y1,x2,y2,x3,y3);
   var x1 , y1 , x2 = argument0;
   var y2 = argument1 , x3 = argument2 , y3 = argument3;
   var x4 = argument4 , y4 = argument5;
   var ox = argument7 , oy = argument8;
   var o = instance_number( argument6 );
   var a; a[ o ] = 0;
   var b; b[ o ] = 0;
   var c; c[ o ] = 0;
   var r = 0;
   var i = 0;
   
   with( argument6 ) {
      var o = instance_find( argument6 , i );
      var x1 = x + ox , y1 = y + oy;
      a[ i ] = ( x2 - x1 ) * ( y3 - y1 ) - ( x3 - x1 ) * ( y2 - y1 );
      b[ i ] = ( x3 - x1 ) * ( y4 - y1 ) - ( x4 - x1 ) * ( y3 - y1 );
      c[ i ] = ( x4 - x1 ) * ( y2 - y1 ) - ( x2 - x1 ) * ( y4 - y1 );
      r += ( sign( a[ i ] ) == sign( b[ i ] ) && sign( b[ i ] ) == sign( c[ i ] ) )
      i += 1;
   }
   
   return ( r );
