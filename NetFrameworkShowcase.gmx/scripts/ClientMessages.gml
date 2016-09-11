   var buffer = argument0 , buffer_size = argument1 , msgid = argument2;
   
   switch( msgid ) {
      case Msg_Disconnected:
         game_end();
      break;
      case Msg_GameStart:
         Spawn = buffer_read( buffer , buffer_u8 );
         GameStart = true;
      break;
      case Msg_GameEnd:
         GameEnd = true;
         Winner = true;
      break;
      case Msg_Move:
         with( ObjUser ) {
            
            if ( player == false ) {
               moving = buffer_read( buffer , buffer_u8 );
               pdir = buffer_read( buffer , buffer_u16 );
               x = buffer_read( buffer , buffer_u16 );
               y = buffer_read( buffer , buffer_u16 );
            }
         }
      break;
      case Msg_Shoot:
         var dir = buffer_read( buffer , buffer_u16 );
         with( ObjUser ) {
            
            if ( player == false ) {
               
               with( instance_create( x + 16 , y + 16 , ObjBullet ) ) {
                  damagefrom = other.id;
                  image_angle = dir;
                  image_blend = other.image_blend;
                  spd = 12;
               }
            }
         }
      break;
   }
