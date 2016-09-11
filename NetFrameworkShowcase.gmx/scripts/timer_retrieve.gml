   //call by: timer_retrieve( position , speed , mode );
   switch( argument2 ) {
      case 0:
         CT__CustomTimer[ median( argument0 , 0 , CT__CustomTimerTotal ) ] += argument1;
      break;
      case 1:
         CT__CustomTimer[ median( argument0 , 0 , CT__CustomTimerTotal ) ] -= argument1;
      break;
      case 2:
         CT__CustomTimer[ median( argument0 , 0 , CT__CustomTimerTotal ) ] /= argument1;
      break;
      case 3:
         CT__CustomTimer[ median( argument0 , 0 , CT__CustomTimerTotal ) ] *= argument1;
      break;
      case 4:
         CT__CustomTimer[ median( argument0 , 0 , CT__CustomTimerTotal ) ] = CT__CustomTimer[ median( argument0 , 0 , CT__CustomTimerTotal ) ] >> argument1;
      break;
      case 5:
         CT__CustomTimer[ median( argument0 , 0 , CT__CustomTimerTotal ) ] = CT__CustomTimer[ median( argument0 , 0 , CT__CustomTimerTotal ) ] << argument1;
      break;
   }
   
   return CT__CustomTimer[ median( argument0 , 0 , CT__CustomTimerTotal ) ];
