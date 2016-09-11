   globalvar Server_Tcp , Server_Buf , Server_Sck , Server_Lst;
   Server_Tcp = network_create_server( network_socket_tcp , argument0 , argument1 )
   Server_Buf = buffer_create( argument2 , buffer_fixed , 1 );
   Server_Sck = ds_list_create();
   Server_Lst = -1;
   return ( Server_Tcp >= 0 );
