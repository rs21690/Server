   draw_primitive_begin( pr_trianglefan );
   draw_vertex_color( argument0 , argument1 , draw_get_color() , argument8 );
   draw_vertex_color( argument2 , argument3 , draw_get_color() , argument8 );
   draw_vertex_color( argument4 , argument5 , draw_get_color() , argument8 * 0.5 );
   draw_vertex_color( argument6 , argument7 , draw_get_color() , argument9 );
   draw_vertex_color( argument2 , argument3 , draw_get_color() , argument9 );
   draw_primitive_end();
