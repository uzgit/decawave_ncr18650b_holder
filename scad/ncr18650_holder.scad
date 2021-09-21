battery_length = 68;
battery_radius = 19;

inner_length = battery_length + 2;
inner_width = battery_radius;
inner_height = battery_radius;

thickness = 2;
end_thickness = 3;

outer_width = inner_width + 2*thickness;
outer_height = inner_height + thickness;
outer_length = inner_length + 2*thickness + 2*end_thickness;

terminal_cavity_length = 2;
terminal_thickness = 1.5;
terminal_side_length = 11;
cavity_length = battery_length + 2*end_thickness + 1;
cavity_width = terminal_side_length - 4;
cavity_height = terminal_side_length - 4;

difference()
{
    // main positive matter
    translate([-outer_width/2, -outer_length/2 + 1, -outer_height/2])
    cube([outer_width, outer_length, outer_height]);

    union()
    {
        // battery void
        translate([-inner_width/2, -inner_length/2, -inner_height/2 + thickness])
        cube([inner_width, inner_length, inner_height]);
        
        // void for terminals
        translate([-cavity_width/2, -cavity_length/2, -cavity_height/2])
        cube([cavity_width, cavity_length, 20]);
        
        // voids for terminal holders
        translate([-terminal_side_length/2, -inner_length/2 - terminal_thickness - 1, -terminal_side_length/2])
        cube([terminal_side_length, terminal_cavity_length, 20]);

        translate([-terminal_side_length/2, inner_length/2 + terminal_thickness + 1, -terminal_side_length/2])
        cube([terminal_side_length, terminal_cavity_length, 20]);

//        translate([terminal_side_length/2, inner_length/2 + terminal_thickness + 1, terminal_side_length/2])
//        cube([terminal_side_length, terminal_cavity_length, 20]);
    }
}