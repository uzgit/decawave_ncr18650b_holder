width = 43.5;
length = 60;
thickness = 1;

module mounting_holes()
{
    for( x_translation = [-17.5, 17.5] )
    {
        for( y_translation = [-23, 23] )
        {
            translate([x_translation, y_translation, 0])
            cylinder(r=1, h=20);
        }
    }
}






difference()
{
    union()
    {
        translate([-width/2, -length/2 + 20, 0])
        cube([width, length, thickness]);
        
        translate([-31.5, -length/2, 0])
        import("../stl/Battery_Holder.stl");
    }
    union()
    {
        translate([0, length/5 + 10, 0])
        mounting_holes();
    }
}
