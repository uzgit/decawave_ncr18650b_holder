include <../library/nuts_and_bolts.scad>
include <../library/ncr18650_holder.scad>

width = 43.5;
length = 60;
base_thickness = 4;

$fn=60;

translate([0, 40, 0])
union()
{
    translate([-width/2, -length/2, 0])
    cube([width, length, base_thickness]);
    
    for( x_translation = [-17.5, 17.5] )
    {
        for( y_translation = [-23, 23] )
        {
            translate([x_translation, y_translation, base_thickness])
            difference()
            {
                cylinder(r=3, h=7);
                cylinder(r=0.5, h=20);
            }
        }
    }
}

translate([0, 0, outer_height/2])
rotate([0, 0, 90])
ncr18650_holder();