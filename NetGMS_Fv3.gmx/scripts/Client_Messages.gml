   var buffer = argument[ 0 ] , var bsize = argument[ 1 ] , msgid = argument[ 2 ];
   
   switch( msgid ) {
      case msg_queue:
         Socket = Net_Requeue( buffer , msg_queue );
      break;
      case msg_broadcast:
         if ( Net_TcpAssets( tcp_asset_sck ) == network_error && Net_UdpAssets( udp_asset_msz ) <= 10 ) {
            Net_Inquire( buffer );
         }
      break;
   }
