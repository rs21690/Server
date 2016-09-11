   switch( ds_map_find_value( async_load , "type" ) ) {
      case network_type_data:
         var buffer = ds_map_find_value( async_load , "buffer" );
         var buffer_size = ds_map_find_value( async_load , "size" );
         buffer_seek( buffer , buffer_seek_start , 0 );
         var msgid = buffer_read( buffer , buffer_u8 );
         script_execute( argument0 , buffer , buffer_size , msgid );
      break;
   }
