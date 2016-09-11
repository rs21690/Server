   with( ObjUser ) {
      
      if ( player == true && other.player == false ) {
         
         if ( !collision_line( other.x , other.y , x + 16 , y + 16 , ObjSolid , true , false )
         && intersect_triangle( x , y , x + lengthdir_x( 1500 , pdir + 50 ) , y + lengthdir_y( 1500 , pdir + 50 ) ,
         x + lengthdir_x( 1500 , pdir - 50 ) , y + lengthdir_y( 1500 , pdir - 50 ) , other.id , 16 , 16 ) ) {
            
            if ( other.image_alpha < 1 ) {
               other.image_alpha += 0.1;
            }
         } else {
            
            if ( other.image_alpha > 0 ) {
               other.image_alpha -= 0.1;
            }
         }
      }
   }
