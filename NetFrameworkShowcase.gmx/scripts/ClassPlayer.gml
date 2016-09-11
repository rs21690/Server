   var enemy = noone;
   
   with( ObjUser ) {
      if ( player == false ) {
         enemy = id;
      }
   }
   
   edir = rotdest( edir , point_direction( x + 16 , y + 16 , enemy.x , enemy.y ) , 16 );
   pdir = fixrot( rotdest( pdir , point_direction( x + 16 , y + 16 , mouse_x , mouse_y ) , 16 ) );
   run = 2 + ( 2 * mouse_check_button( mb_right ) ) * ( breath == true );
   breath = ( timer_retrieve( 0 , 0 , 0 ) >= 120 );
   keyh = ( keyboard_check( vk_right ) - keyboard_check( vk_left ) );
   keyv = ( keyboard_check( vk_down ) - keyboard_check( vk_up ) );
   moving = check_keys_or( vk_left , vk_right , vk_up , vk_down );
   x += ( ( keyh ) * place_free( x + ( run * keyh ) , y ) ) * run;
   y += ( ( keyv ) * place_free( x , y + ( run * keyv ) ) ) * run;
   view_xview = x + 16 + lengthdir_x( 150 , pdir ) - ( view_wview / 2 );
   view_yview = y + 16 + lengthdir_y( 150 , pdir ) - ( view_hview / 2 );
   
   buffer_seek( Client_Buf , buffer_seek_start , 0 );
   buffer_write( Client_Buf , buffer_u8 , Msg_Move );
   buffer_write( Client_Buf , buffer_u8 , moving );
   buffer_write( Client_Buf , buffer_u16 , pdir );
   buffer_write( Client_Buf , buffer_u16 , x );
   buffer_write( Client_Buf , buffer_u16 , y );
   network_send_packet( Client_Tcp , Client_Buf , buffer_tell( Client_Buf ) );
   
   if ( hp <= 0 ) {
      buffer_seek( Client_Buf , buffer_seek_start , 0 );
      buffer_write( Client_Buf , buffer_u8 , Msg_GameEnd );
      network_send_packet( Client_Tcp , Client_Buf , buffer_tell( Client_Buf ) );
      GameStart = false;
      GameEnd = true;
   }
   
   if ( mouse_check_button( mb_left ) && shoot == false ) {
      shoot = true;
   }
   
   timer_retrieve( 0 , 1 , 1 );
   
   if ( timer_retrieve( 0 , 0 , 0 ) <= -30 && mouse_check_button( mb_right ) ) {
      timer_change( 0 , 210 );
   }
   
   can_ping += ( can_ping <= 0 && mouse_check_button_pressed( mb_middle ) && enemy.moving == false ) * 120;
   can_ping -= ( can_ping > 0 ) * 0.25;
   
   with( ObjUser ) {
      
      if ( other.id != id ) {
         
         if ( other.can_ping >= 60 && moving == false ) {
            other.pinged = true;
         } else {
            other.pinged = false;
         }
      }
   }
   
   switch( gun ) {
      case 0:
         GunAutomatic();
      break;
      case 1:
         GunThreeRound();
      break;
   }
