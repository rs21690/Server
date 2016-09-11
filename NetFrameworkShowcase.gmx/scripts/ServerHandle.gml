   switch ( ds_map_find_value( async_load , "type" ) ) {
      case network_type_connect:
         var accepted_socket = ds_map_find_value( async_load , "socket" );
         ds_list_add( Server_Sck , accepted_socket );
         Server_Lst = accepted_socket;
      break;
      case network_type_disconnect:
         var disconnected_socket = ds_map_find_value( async_load , "socket" );
         var socket_position = ds_list_find_index( Server_Sck , disconnected_socket );
         ds_list_delete( Server_Sck , socket_position );
      break;
      case network_type_data:
         var socket = ds_map_find_value( async_load , "id" );
         var buffer = ds_map_find_value( async_load , "buffer" );
         var buffer_size = ds_map_find_value( async_load , "size" );
         buffer_seek( buffer , buffer_seek_start , 0 );
         var msgid = buffer_read( buffer , buffer_u8 );
         script_execute( argument0 , socket , buffer , buffer_size , msgid );
      break;
   }
