   //call by: check_keys_or(key1,key2,key3,etc.);
   var k , n;
   k = 0;
   n = 0;
   
   repeat( argument_count ) {
      k += sign( keyboard_check( argument[ n ] ) );
      n += 1;
   }
   
   return ( k > 0 );
