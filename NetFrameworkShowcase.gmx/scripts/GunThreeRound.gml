   //Three Round Burst Shot
   if ( shoot == true ) {
      timer_retrieve( 1 , 1 , 0 );
   }
   
   switch( timer_retrieve( 1 , 0 , 0 ) ) {
      case 35:
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
      break;
      case 40:
         with( instance_create( x + 16 , y + 16 , ObjBullet ) ) {
            damagefrom = other.id;
            image_blend = other.image_blend;
            image_angle = other.pdir + 5
            spd = 12;
         }
         
         buffer_seek( Client_Buf , buffer_seek_start , 0 );
         buffer_write( Client_Buf , buffer_u8 , Msg_Shoot );
         buffer_write( Client_Buf , buffer_u16 , pdir + 5 );
         network_send_packet( Client_Tcp , Client_Buf , buffer_tell( Client_Buf ) );
      break;
      case 45:
         with( instance_create( x + 16 , y + 16 , ObjBullet ) ) {
            damagefrom = other.id;
            image_blend = other.image_blend;
            image_angle = other.pdir - 5;
            spd = 12;
         }
         
         buffer_seek( Client_Buf , buffer_seek_start , 0 );
         buffer_write( Client_Buf , buffer_u8 , Msg_Shoot );
         buffer_write( Client_Buf , buffer_u16 , pdir - 5 );
         network_send_packet( Client_Tcp , Client_Buf , buffer_tell( Client_Buf ) );
      break;
   }
   
   if ( timer_retrieve( 1 , 0 , 0 ) >= 75 ) {
      shoot = false;
      timer_change( 1 , 0 );
   }
