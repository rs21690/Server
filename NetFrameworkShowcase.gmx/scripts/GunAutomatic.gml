   //Automatic Rifle
   if ( shoot == true ) {
      timer_retrieve( 1 , 1 , 0 );
   }
   
   if ( timer_retrieve( 1 , 0 , 0 ) >= 30 ) {
      
      with( instance_create( x + 16 , y + 16 , ObjBullet ) ) {
         damagefrom = other.id;
         image_blend = other.image_blend;
         image_angle = other.pdir;
         spd = 12;
      }
      
      buffer_seek( Client_Buf , buffer_seek_start , 0 );
      buffer_write( Client_Buf , buffer_u8 , Msg_Shoot );
      buffer_write( Client_Buf , buffer_u16 , pdir );
      network_send_packet( Client_Tcp , Client_Buf , buffer_tell( Client_Buf ) );
      
      shoot = false;
      timer_change( 1 , 0 );
   }
