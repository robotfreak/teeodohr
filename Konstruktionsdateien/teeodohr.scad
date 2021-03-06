$fn=50;

module ellipse(diameter) {
    //resize([diameter*1.5,diameter/1.5]) circle(d=diameter);
    scale([1.5,.5])circle(d=diameter);
}

module gruen() {
    linear_extrude(height=4) {
        translate([0,8,0]) rotate([0,0,90]) ellipse(8);
        translate([-4,8,0]) rotate([0,0,-45]) ellipse(6);
        translate([-4,4,0]) rotate([0,0,0]) ellipse(4);
    }
    translate([0,4,2]) rotate([0,90,-45]) difference() {
        translate([0,0,0]) cylinder(r=4,h=4);
        translate([6,0,2]) cube([8,8,4], center=true);
        translate([-6,0,2]) cube([8,8,4],center=true);
    }
}

module moehre() {
    difference() {
        union() {
            cylinder(r1=5.5, r2=6.5, h=2);
            translate([0,0,2]) cylinder(r1=6.5, r2=0.5, h=25);
        }
        cylinder(r=4.2, h=5);
    }
}

module ohr() {
    difference() {
        union() {
            translate([0,0,0]) {
                minkowski() {
                    cube([6,62,4], center=true);
                    cylinder(r=2,h=1);
                }
            }
            translate([5.8,43.4,0]) {
                rotate([0,0,-25]) {
                    difference() {
                        minkowski() {
                            cube([6,28,4], center=true);
                            cylinder(r=2,h=1);
                        }
                        translate([0,12,0]) cube([0.5,10,6], center=true);
                        translate([0,16,0]) rotate([0,0,45]) cube([3,3,6], center=true);
                    }
                }
            }
        }
        translate([0,0,1]) hull() {
            translate([0,0,1]) cube([6,6,2], center=true);
            translate([0,15,0]) cylinder(d=4,h=2);
            translate([0,21,0]) cylinder(d=2,h=2);
        }
        
        translate([0,-40,-2]) {
            hull() {
                translate([0,0,0]) cylinder(d=7.4,h=2);
                translate([0,16.5,0]) cylinder(d=4,h=2);
            }
            //translate([0,0,])cylinder(d=5.2,h=5);
        }
    }
}

module base() {
    difference() {
        translate([0,0,0]) cylinder(r=4,h=4);
        translate([6,0,2]) cube([8,8,4], center=true);
        translate([-6,0,2]) cube([8,8,4],center=true);
    }
}

!gruen();
moehre();
ohr();
base();

