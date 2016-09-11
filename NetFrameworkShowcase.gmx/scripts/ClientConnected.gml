   buffer_seek( Client_Buf , buffer_seek_start , 0 );
   buffer_write( Client_Buf , buffer_u8 , -1 );
   var is_connected = network_send_packet( Client_Tcp , Client_Buf , buffer_get_size( Client_Buf ) );
   
   if ( is_connected >= true ) {
      Client_Sts = true;
   } else {
      Client_Sts = false;
   }
   
   return Client_Sts;
