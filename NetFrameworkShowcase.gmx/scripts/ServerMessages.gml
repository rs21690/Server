   var socket = argument0 , buffer = argument1;
   var buffer_size = argument2 , msgid = argument3;
   
   switch( msgid ) {
      case Msg_GameEnd:
         Ready = 0;
         GameStarted = false;
         
         var clientid = 0;
         repeat( ds_list_size( Server_Sck ) ) {
            othersocket = ds_list_find_value( Server_Sck , clientid );
            
            if ( othersocket != socket ) {
               buffer_seek( Server_Buf , buffer_seek_start , 0 );
               buffer_write( Server_Buf , buffer_u8 , Msg_GameEnd );
               network_send_packet( othersocket , Server_Buf , buffer_tell( buffer ) );
            }
            
            clientid += 1;
         }
      break;
      case Msg_Ready:
         Ready += 1;
      break;
      case Msg_Move:
         var mm , dd , xx , yy;
         mm = buffer_read( buffer , buffer_u8 );
         dd = buffer_read( buffer , buffer_u16 );
         xx = buffer_read( buffer , buffer_u16 );
         yy = buffer_read( buffer , buffer_u16 );
         
         var clientid = 0;
         repeat( ds_list_size( Server_Sck ) ) {
            othersocket = ds_list_find_value( Server_Sck , clientid );
            
            if ( othersocket != socket ) {
               buffer_seek( Server_Buf , buffer_seek_start , 0 );
               buffer_write( Server_Buf , buffer_u8 , Msg_Move );
               buffer_write( Server_Buf , buffer_u8 , mm );
               buffer_write( Server_Buf , buffer_u16 , dd );
               buffer_write( Server_Buf , buffer_u16 , xx );
               buffer_write( Server_Buf , buffer_u16 , yy );
               network_send_packet( othersocket , Server_Buf , buffer_tell( buffer ) );
            }
            
            clientid += 1;
         }
      break;
      case Msg_Shoot:
         var xx , yy;
         dd = buffer_read( buffer , buffer_u16 );
         
         var clientid = 0;
         repeat( ds_list_size( Server_Sck ) ) {
            othersocket = ds_list_find_value( Server_Sck , clientid );
            
            if ( othersocket != socket ) {
               buffer_seek( Server_Buf , buffer_seek_start , 0 );
               buffer_write( Server_Buf , buffer_u8 , Msg_Shoot );
               buffer_write( Server_Buf , buffer_u16 , dd );
               network_send_packet( othersocket , Server_Buf , buffer_tell( buffer ) );
            }
            
            clientid += 1;
         }
      break;
   }
