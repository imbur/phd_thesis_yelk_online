

/*	(0,2)	(1,2)	(2,2) */
/*			      */
/*	(0,1)	(1,1)	(2,1) */
/* 			      */
/*		(1,0)	(2,0) */
/* 			      */

lc = 0.2;

Point(1) = {1, 0, 0, lc};
Point(2) = {2, 0, 0, lc};
Point(3) = {2, 1, 0, lc};
Point(4) = {2, 2, 0, lc};
Point(5) = {1, 2, 0, lc};
Point(6) = {0, 2, 0, lc};
Point(7) = {0, 1, 0, lc};
Point(8) = {1, 1, 0, lc};

Line(9) = {1, 2};
Line(10) = {8, 3};
Line(11) = {7, 8};

ly = 1/lc; /* Layers */

Extrude {0, 1, 0} {
  Line{9}; Layers{ly};
}
Extrude {0, 1, 0} {
  Line{10}; Layers{ly};
}
Extrude {0, 1, 0} {
  Line{11}; Layers{ly};
}

Physical Line(24) = {20, 16, 18, 14}; /* Outer conductor */
Physical Line(25) = {11, 13}; /* Inner conductor */
Physical Line(26) = {21, 9}; /* Neumann boundary */
Physical Surface(27) = {15, 19, 23};
