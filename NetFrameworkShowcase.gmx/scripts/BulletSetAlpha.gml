   if ( damagefrom.player == true ) {
      alpha = 0;
   } else {
      alpha = 1;
   }
   
   var inst = noone;
   
   with( ObjUser ) {
      if ( other.damagefrom != id && player == true ) {
         inst = id;
      }
   }
   
   if ( inst != noone ) {
      
      if ( !collision_line( x , y , inst.x , inst.y , ObjSolid , true , false )
      && intersect_triangle( inst.x , inst.y , inst.x + lengthdir_x( 1500 , inst.pdir + 50 ) , inst.y + lengthdir_y( 1500 , inst.pdir + 50 ) ,
      inst.x + lengthdir_x( 1500 , inst.pdir - 50 ) , inst.y + lengthdir_y( 1500 , inst.pdir - 50 ) , id , 0 , 0 ) ) {
         alpha = 0;
      }
   }
