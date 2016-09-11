   var buffer = argument[ 0 ] , bsize = argument[ 1 ] , msgid = argument[ 2 ];
   
   switch( msgid ) {
      case msg_queue:
         Net_Dequeue( buffer );
      break;
   }
