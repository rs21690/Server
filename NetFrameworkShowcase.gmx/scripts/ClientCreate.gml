   globalvar Client_Tcp , Client_Buf , Client_Sts;
   Client_Tcp = network_create_socket( network_socket_tcp );
   Client_Buf = buffer_create( argument2 , buffer_fixed , 1 );
   Client_Sts = false;
   return ( network_connect( Client_Tcp , argument0 , argument1 ) >= 0 );
