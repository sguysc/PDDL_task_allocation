\ Model trs0
\ LP format - for model browsing. Use MPS format to capture full model detail.
Minimize
  z[p0] + z[p1] + z[p2] + z[p3] + z[p0_] + z[p1_] + z[p2_] + z[p3_]
   + 61 xa[p0] + 61 xa[p1] + 61 xa[p2] + 61 xa[p3] + 61 xa[p0_]
   + 61 xa[p1_] + 61 xa[p2_] + 61 xa[p3_] + 61 xb[p0] + 61 xb[p1]
   + 61 xb[p2] + 61 xb[p3] + 61 xb[p0_] + 61 xb[p1_] + 61 xb[p2_]
   + 61 xb[p3_] + 6100 g[p0] + 6100 g[p1] + 6100 g[p2] + 6100 g[p3]
   + 6100 g[p0_] + 6100 g[p1_] + 6100 g[p2_] + 6100 g[p3_]
Subject To
 assignToJob[p0]: x[p0,robot0] + x[p0,robot1] + g[p0] = 1
 assignToJob[p1]: x[p1,robot0] + x[p1,robot1] + g[p1] = 1
 assignToJob[p2]: x[p2,robot0] + x[p2,robot1] + g[p2] = 1
 assignToJob[p3]: x[p3,robot0] + x[p3,robot1] + g[p3] = 1
 assignToJob[p0_]: x[p0_,robot0] + x[p0_,robot1] + g[p0_] = 1
 assignToJob[p1_]: x[p1_,robot0] + x[p1_,robot1] + g[p1_] = 1
 assignToJob[p2_]: x[p2_,robot0] + x[p2_,robot1] + g[p2_] = 1
 assignToJob[p3_]: x[p3_,robot0] + x[p3_,robot1] + g[p3_] = 1
 assignOne[p0]: x[p0,robot0] + x[p0,robot1] <= 1
 assignOne[p1]: x[p1,robot0] + x[p1,robot1] <= 1
 assignOne[p2]: x[p2,robot0] + x[p2,robot1] <= 1
 assignOne[p3]: x[p3,robot0] + x[p3,robot1] <= 1
 assignOne[p0_]: x[p0_,robot0] + x[p0_,robot1] <= 1
 assignOne[p1_]: x[p1_,robot0] + x[p1_,robot1] <= 1
 assignOne[p2_]: x[p2_,robot0] + x[p2_,robot1] <= 1
 assignOne[p3_]: x[p3_,robot0] + x[p3_,robot1] <= 1
 techCapacity[robot0]: x[p0,robot0] + x[p1,robot0] + x[p2,robot0]
   + x[p3,robot0] + x[p0_,robot0] + x[p1_,robot0] + x[p2_,robot0]
   + x[p3_,robot0] - 480 u[robot0] + 7 y[H2X7Y20,H0X12Y17,robot0]
   + 7 y[H2X7Y20,H3X2Y4,robot0] + 8 y[H2X7Y20,H1X4Y15,robot0]
   + 6 y[H2X7Y20,H1X4Y11,robot0] + 5 y[H2X7Y20,H3X1Y12,robot0]
   + 10 y[H2X7Y20,H1X9Y5,robot0] + 11 y[H2X7Y20,H2X7Y5,robot0]
   + 6 y[H0X12Y17,H2X7Y20,robot0] + 14 y[H0X12Y17,H3X2Y4,robot0]
   + 19 y[H0X12Y17,H1X4Y15,robot0] + 17 y[H0X12Y17,H1X4Y11,robot0]
   + 11 y[H0X12Y17,H3X1Y12,robot0] + 15 y[H0X12Y17,H1X9Y5,robot0]
   + 17 y[H0X12Y17,H2X7Y5,robot0] + 13 y[H3X2Y4,H2X7Y20,robot0]
   + 10 y[H3X2Y4,H0X12Y17,robot0] + 7 y[H3X2Y4,H1X4Y15,robot0]
   + 5 y[H3X2Y4,H1X4Y11,robot0] + 12 y[H3X2Y4,H3X1Y12,robot0]
   + 3 y[H3X2Y4,H1X9Y5,robot0] + 4 y[H3X2Y4,H2X7Y5,robot0]
   + 6 y[H1X4Y15,H2X7Y20,robot0] + 3 y[H1X4Y15,H0X12Y17,robot0]
   + 12 y[H1X4Y15,H3X2Y4,robot0] + 4 y[H1X4Y15,H1X4Y11,robot0]
   + 7 y[H1X4Y15,H3X1Y12,robot0] + 17 y[H1X4Y15,H1X9Y5,robot0]
   + 12 y[H1X4Y15,H2X7Y5,robot0] + 8 y[H1X4Y11,H2X7Y20,robot0]
   + 5 y[H1X4Y11,H0X12Y17,robot0] + 8 y[H1X4Y11,H3X2Y4,robot0]
   + 2 y[H1X4Y11,H1X4Y15,robot0] + 12 y[H1X4Y11,H3X1Y12,robot0]
   + 13 y[H1X4Y11,H1X9Y5,robot0] + 8 y[H1X4Y11,H2X7Y5,robot0]
   + 11 y[H3X1Y12,H2X7Y20,robot0] + 8 y[H3X1Y12,H0X12Y17,robot0]
   + 4 y[H3X1Y12,H3X2Y4,robot0] + 5 y[H3X1Y12,H1X4Y15,robot0]
   + 4 y[H3X1Y12,H1X4Y11,robot0] + 5 y[H3X1Y12,H1X9Y5,robot0]
   + 6 y[H3X1Y12,H2X7Y5,robot0] + 10 y[H1X9Y5,H2X7Y20,robot0]
   + 7 y[H1X9Y5,H0X12Y17,robot0] + 3 y[H1X9Y5,H3X2Y4,robot0]
   + 4 y[H1X9Y5,H1X4Y15,robot0] + 5 y[H1X9Y5,H1X4Y11,robot0]
   + 10 y[H1X9Y5,H3X1Y12,robot0] + 3 y[H1X9Y5,H2X7Y5,robot0]
   + 11 y[H2X7Y5,H2X7Y20,robot0] + 8 y[H2X7Y5,H0X12Y17,robot0]
   + 2 y[H2X7Y5,H3X2Y4,robot0] + 5 y[H2X7Y5,H1X4Y15,robot0]
   + 3 y[H2X7Y5,H1X4Y11,robot0] + 8 y[H2X7Y5,H3X1Y12,robot0]
   + 5 y[H2X7Y5,H1X9Y5,robot0] <= 0
 techCapacity[robot1]: x[p0,robot1] + x[p1,robot1] + x[p2,robot1]
   + x[p3,robot1] + x[p0_,robot1] + x[p1_,robot1] + x[p2_,robot1]
   + x[p3_,robot1] - 480 u[robot1] + 7 y[H2X7Y20,H0X12Y17,robot1]
   + 7 y[H2X7Y20,H3X2Y4,robot1] + 8 y[H2X7Y20,H1X4Y15,robot1]
   + 6 y[H2X7Y20,H1X4Y11,robot1] + 5 y[H2X7Y20,H3X1Y12,robot1]
   + 10 y[H2X7Y20,H1X9Y5,robot1] + 11 y[H2X7Y20,H2X7Y5,robot1]
   + 6 y[H0X12Y17,H2X7Y20,robot1] + 14 y[H0X12Y17,H3X2Y4,robot1]
   + 19 y[H0X12Y17,H1X4Y15,robot1] + 17 y[H0X12Y17,H1X4Y11,robot1]
   + 11 y[H0X12Y17,H3X1Y12,robot1] + 15 y[H0X12Y17,H1X9Y5,robot1]
   + 17 y[H0X12Y17,H2X7Y5,robot1] + 13 y[H3X2Y4,H2X7Y20,robot1]
   + 10 y[H3X2Y4,H0X12Y17,robot1] + 7 y[H3X2Y4,H1X4Y15,robot1]
   + 5 y[H3X2Y4,H1X4Y11,robot1] + 12 y[H3X2Y4,H3X1Y12,robot1]
   + 3 y[H3X2Y4,H1X9Y5,robot1] + 4 y[H3X2Y4,H2X7Y5,robot1]
   + 6 y[H1X4Y15,H2X7Y20,robot1] + 3 y[H1X4Y15,H0X12Y17,robot1]
   + 12 y[H1X4Y15,H3X2Y4,robot1] + 4 y[H1X4Y15,H1X4Y11,robot1]
   + 7 y[H1X4Y15,H3X1Y12,robot1] + 17 y[H1X4Y15,H1X9Y5,robot1]
   + 12 y[H1X4Y15,H2X7Y5,robot1] + 8 y[H1X4Y11,H2X7Y20,robot1]
   + 5 y[H1X4Y11,H0X12Y17,robot1] + 8 y[H1X4Y11,H3X2Y4,robot1]
   + 2 y[H1X4Y11,H1X4Y15,robot1] + 12 y[H1X4Y11,H3X1Y12,robot1]
   + 13 y[H1X4Y11,H1X9Y5,robot1] + 8 y[H1X4Y11,H2X7Y5,robot1]
   + 11 y[H3X1Y12,H2X7Y20,robot1] + 8 y[H3X1Y12,H0X12Y17,robot1]
   + 4 y[H3X1Y12,H3X2Y4,robot1] + 5 y[H3X1Y12,H1X4Y15,robot1]
   + 4 y[H3X1Y12,H1X4Y11,robot1] + 5 y[H3X1Y12,H1X9Y5,robot1]
   + 6 y[H3X1Y12,H2X7Y5,robot1] + 10 y[H1X9Y5,H2X7Y20,robot1]
   + 7 y[H1X9Y5,H0X12Y17,robot1] + 3 y[H1X9Y5,H3X2Y4,robot1]
   + 4 y[H1X9Y5,H1X4Y15,robot1] + 5 y[H1X9Y5,H1X4Y11,robot1]
   + 10 y[H1X9Y5,H3X1Y12,robot1] + 3 y[H1X9Y5,H2X7Y5,robot1]
   + 11 y[H2X7Y5,H2X7Y20,robot1] + 8 y[H2X7Y5,H0X12Y17,robot1]
   + 2 y[H2X7Y5,H3X2Y4,robot1] + 5 y[H2X7Y5,H1X4Y15,robot1]
   + 3 y[H2X7Y5,H1X4Y11,robot1] + 8 y[H2X7Y5,H3X1Y12,robot1]
   + 5 y[H2X7Y5,H1X9Y5,robot1] <= 0
 techTour1[robot0,p0]: - x[p0,robot0] + y[H2X7Y20,H1X4Y15,robot0]
   + y[H0X12Y17,H1X4Y15,robot0] + y[H3X2Y4,H1X4Y15,robot0]
   + y[H1X4Y15,H1X4Y15,robot0] + y[H1X4Y11,H1X4Y15,robot0]
   + y[H3X1Y12,H1X4Y15,robot0] + y[H1X9Y5,H1X4Y15,robot0]
   + y[H2X7Y5,H1X4Y15,robot0] = 0
 techTour1[robot0,p1]: - x[p1,robot0] + y[H2X7Y20,H0X12Y17,robot0]
   + y[H0X12Y17,H0X12Y17,robot0] + y[H3X2Y4,H0X12Y17,robot0]
   + y[H1X4Y15,H0X12Y17,robot0] + y[H1X4Y11,H0X12Y17,robot0]
   + y[H3X1Y12,H0X12Y17,robot0] + y[H1X9Y5,H0X12Y17,robot0]
   + y[H2X7Y5,H0X12Y17,robot0] = 0
 techTour1[robot0,p2]: - x[p2,robot0] + y[H2X7Y20,H3X1Y12,robot0]
   + y[H0X12Y17,H3X1Y12,robot0] + y[H3X2Y4,H3X1Y12,robot0]
   + y[H1X4Y15,H3X1Y12,robot0] + y[H1X4Y11,H3X1Y12,robot0]
   + y[H3X1Y12,H3X1Y12,robot0] + y[H1X9Y5,H3X1Y12,robot0]
   + y[H2X7Y5,H3X1Y12,robot0] = 0
 techTour1[robot0,p3]: - x[p3,robot0] + y[H2X7Y20,H2X7Y20,robot0]
   + y[H0X12Y17,H2X7Y20,robot0] + y[H3X2Y4,H2X7Y20,robot0]
   + y[H1X4Y15,H2X7Y20,robot0] + y[H1X4Y11,H2X7Y20,robot0]
   + y[H3X1Y12,H2X7Y20,robot0] + y[H1X9Y5,H2X7Y20,robot0]
   + y[H2X7Y5,H2X7Y20,robot0] = 0
 techTour1[robot0,p0_]: - x[p0_,robot0] + y[H2X7Y20,H2X7Y5,robot0]
   + y[H0X12Y17,H2X7Y5,robot0] + y[H3X2Y4,H2X7Y5,robot0]
   + y[H1X4Y15,H2X7Y5,robot0] + y[H1X4Y11,H2X7Y5,robot0]
   + y[H3X1Y12,H2X7Y5,robot0] + y[H1X9Y5,H2X7Y5,robot0]
   + y[H2X7Y5,H2X7Y5,robot0] = 0
 techTour1[robot0,p1_]: - x[p1_,robot0] + y[H2X7Y20,H3X2Y4,robot0]
   + y[H0X12Y17,H3X2Y4,robot0] + y[H3X2Y4,H3X2Y4,robot0]
   + y[H1X4Y15,H3X2Y4,robot0] + y[H1X4Y11,H3X2Y4,robot0]
   + y[H3X1Y12,H3X2Y4,robot0] + y[H1X9Y5,H3X2Y4,robot0]
   + y[H2X7Y5,H3X2Y4,robot0] = 0
 techTour1[robot0,p2_]: - x[p2_,robot0] + y[H2X7Y20,H1X9Y5,robot0]
   + y[H0X12Y17,H1X9Y5,robot0] + y[H3X2Y4,H1X9Y5,robot0]
   + y[H1X4Y15,H1X9Y5,robot0] + y[H1X4Y11,H1X9Y5,robot0]
   + y[H3X1Y12,H1X9Y5,robot0] + y[H1X9Y5,H1X9Y5,robot0]
   + y[H2X7Y5,H1X9Y5,robot0] = 0
 techTour1[robot0,p3_]: - x[p3_,robot0] + y[H2X7Y20,H1X4Y11,robot0]
   + y[H0X12Y17,H1X4Y11,robot0] + y[H3X2Y4,H1X4Y11,robot0]
   + y[H1X4Y15,H1X4Y11,robot0] + y[H1X4Y11,H1X4Y11,robot0]
   + y[H3X1Y12,H1X4Y11,robot0] + y[H1X9Y5,H1X4Y11,robot0]
   + y[H2X7Y5,H1X4Y11,robot0] = 0
 techTour1[robot1,p0]: - x[p0,robot1] + y[H2X7Y20,H1X4Y15,robot1]
   + y[H0X12Y17,H1X4Y15,robot1] + y[H3X2Y4,H1X4Y15,robot1]
   + y[H1X4Y15,H1X4Y15,robot1] + y[H1X4Y11,H1X4Y15,robot1]
   + y[H3X1Y12,H1X4Y15,robot1] + y[H1X9Y5,H1X4Y15,robot1]
   + y[H2X7Y5,H1X4Y15,robot1] = 0
 techTour1[robot1,p1]: - x[p1,robot1] + y[H2X7Y20,H0X12Y17,robot1]
   + y[H0X12Y17,H0X12Y17,robot1] + y[H3X2Y4,H0X12Y17,robot1]
   + y[H1X4Y15,H0X12Y17,robot1] + y[H1X4Y11,H0X12Y17,robot1]
   + y[H3X1Y12,H0X12Y17,robot1] + y[H1X9Y5,H0X12Y17,robot1]
   + y[H2X7Y5,H0X12Y17,robot1] = 0
 techTour1[robot1,p2]: - x[p2,robot1] + y[H2X7Y20,H3X1Y12,robot1]
   + y[H0X12Y17,H3X1Y12,robot1] + y[H3X2Y4,H3X1Y12,robot1]
   + y[H1X4Y15,H3X1Y12,robot1] + y[H1X4Y11,H3X1Y12,robot1]
   + y[H3X1Y12,H3X1Y12,robot1] + y[H1X9Y5,H3X1Y12,robot1]
   + y[H2X7Y5,H3X1Y12,robot1] = 0
 techTour1[robot1,p3]: - x[p3,robot1] + y[H2X7Y20,H2X7Y20,robot1]
   + y[H0X12Y17,H2X7Y20,robot1] + y[H3X2Y4,H2X7Y20,robot1]
   + y[H1X4Y15,H2X7Y20,robot1] + y[H1X4Y11,H2X7Y20,robot1]
   + y[H3X1Y12,H2X7Y20,robot1] + y[H1X9Y5,H2X7Y20,robot1]
   + y[H2X7Y5,H2X7Y20,robot1] = 0
 techTour1[robot1,p0_]: - x[p0_,robot1] + y[H2X7Y20,H2X7Y5,robot1]
   + y[H0X12Y17,H2X7Y5,robot1] + y[H3X2Y4,H2X7Y5,robot1]
   + y[H1X4Y15,H2X7Y5,robot1] + y[H1X4Y11,H2X7Y5,robot1]
   + y[H3X1Y12,H2X7Y5,robot1] + y[H1X9Y5,H2X7Y5,robot1]
   + y[H2X7Y5,H2X7Y5,robot1] = 0
 techTour1[robot1,p1_]: - x[p1_,robot1] + y[H2X7Y20,H3X2Y4,robot1]
   + y[H0X12Y17,H3X2Y4,robot1] + y[H3X2Y4,H3X2Y4,robot1]
   + y[H1X4Y15,H3X2Y4,robot1] + y[H1X4Y11,H3X2Y4,robot1]
   + y[H3X1Y12,H3X2Y4,robot1] + y[H1X9Y5,H3X2Y4,robot1]
   + y[H2X7Y5,H3X2Y4,robot1] = 0
 techTour1[robot1,p2_]: - x[p2_,robot1] + y[H2X7Y20,H1X9Y5,robot1]
   + y[H0X12Y17,H1X9Y5,robot1] + y[H3X2Y4,H1X9Y5,robot1]
   + y[H1X4Y15,H1X9Y5,robot1] + y[H1X4Y11,H1X9Y5,robot1]
   + y[H3X1Y12,H1X9Y5,robot1] + y[H1X9Y5,H1X9Y5,robot1]
   + y[H2X7Y5,H1X9Y5,robot1] = 0
 techTour1[robot1,p3_]: - x[p3_,robot1] + y[H2X7Y20,H1X4Y11,robot1]
   + y[H0X12Y17,H1X4Y11,robot1] + y[H3X2Y4,H1X4Y11,robot1]
   + y[H1X4Y15,H1X4Y11,robot1] + y[H1X4Y11,H1X4Y11,robot1]
   + y[H3X1Y12,H1X4Y11,robot1] + y[H1X9Y5,H1X4Y11,robot1]
   + y[H2X7Y5,H1X4Y11,robot1] = 0
 techTour2[robot0,p0]: - x[p0,robot0] + y[H1X4Y15,H2X7Y20,robot0]
   + y[H1X4Y15,H0X12Y17,robot0] + y[H1X4Y15,H3X2Y4,robot0]
   + y[H1X4Y15,H1X4Y15,robot0] + y[H1X4Y15,H1X4Y11,robot0]
   + y[H1X4Y15,H3X1Y12,robot0] + y[H1X4Y15,H1X9Y5,robot0]
   + y[H1X4Y15,H2X7Y5,robot0] = 0
 techTour2[robot0,p1]: - x[p1,robot0] + y[H0X12Y17,H2X7Y20,robot0]
   + y[H0X12Y17,H0X12Y17,robot0] + y[H0X12Y17,H3X2Y4,robot0]
   + y[H0X12Y17,H1X4Y15,robot0] + y[H0X12Y17,H1X4Y11,robot0]
   + y[H0X12Y17,H3X1Y12,robot0] + y[H0X12Y17,H1X9Y5,robot0]
   + y[H0X12Y17,H2X7Y5,robot0] = 0
 techTour2[robot0,p2]: - x[p2,robot0] + y[H3X1Y12,H2X7Y20,robot0]
   + y[H3X1Y12,H0X12Y17,robot0] + y[H3X1Y12,H3X2Y4,robot0]
   + y[H3X1Y12,H1X4Y15,robot0] + y[H3X1Y12,H1X4Y11,robot0]
   + y[H3X1Y12,H3X1Y12,robot0] + y[H3X1Y12,H1X9Y5,robot0]
   + y[H3X1Y12,H2X7Y5,robot0] = 0
 techTour2[robot0,p3]: - x[p3,robot0] + y[H2X7Y20,H2X7Y20,robot0]
   + y[H2X7Y20,H0X12Y17,robot0] + y[H2X7Y20,H3X2Y4,robot0]
   + y[H2X7Y20,H1X4Y15,robot0] + y[H2X7Y20,H1X4Y11,robot0]
   + y[H2X7Y20,H3X1Y12,robot0] + y[H2X7Y20,H1X9Y5,robot0]
   + y[H2X7Y20,H2X7Y5,robot0] = 0
 techTour2[robot0,p0_]: - x[p0_,robot0] + y[H2X7Y5,H2X7Y20,robot0]
   + y[H2X7Y5,H0X12Y17,robot0] + y[H2X7Y5,H3X2Y4,robot0]
   + y[H2X7Y5,H1X4Y15,robot0] + y[H2X7Y5,H1X4Y11,robot0]
   + y[H2X7Y5,H3X1Y12,robot0] + y[H2X7Y5,H1X9Y5,robot0]
   + y[H2X7Y5,H2X7Y5,robot0] = 0
 techTour2[robot0,p1_]: - x[p1_,robot0] + y[H3X2Y4,H2X7Y20,robot0]
   + y[H3X2Y4,H0X12Y17,robot0] + y[H3X2Y4,H3X2Y4,robot0]
   + y[H3X2Y4,H1X4Y15,robot0] + y[H3X2Y4,H1X4Y11,robot0]
   + y[H3X2Y4,H3X1Y12,robot0] + y[H3X2Y4,H1X9Y5,robot0]
   + y[H3X2Y4,H2X7Y5,robot0] = 0
 techTour2[robot0,p2_]: - x[p2_,robot0] + y[H1X9Y5,H2X7Y20,robot0]
   + y[H1X9Y5,H0X12Y17,robot0] + y[H1X9Y5,H3X2Y4,robot0]
   + y[H1X9Y5,H1X4Y15,robot0] + y[H1X9Y5,H1X4Y11,robot0]
   + y[H1X9Y5,H3X1Y12,robot0] + y[H1X9Y5,H1X9Y5,robot0]
   + y[H1X9Y5,H2X7Y5,robot0] = 0
 techTour2[robot0,p3_]: - x[p3_,robot0] + y[H1X4Y11,H2X7Y20,robot0]
   + y[H1X4Y11,H0X12Y17,robot0] + y[H1X4Y11,H3X2Y4,robot0]
   + y[H1X4Y11,H1X4Y15,robot0] + y[H1X4Y11,H1X4Y11,robot0]
   + y[H1X4Y11,H3X1Y12,robot0] + y[H1X4Y11,H1X9Y5,robot0]
   + y[H1X4Y11,H2X7Y5,robot0] = 0
 techTour2[robot1,p0]: - x[p0,robot1] + y[H1X4Y15,H2X7Y20,robot1]
   + y[H1X4Y15,H0X12Y17,robot1] + y[H1X4Y15,H3X2Y4,robot1]
   + y[H1X4Y15,H1X4Y15,robot1] + y[H1X4Y15,H1X4Y11,robot1]
   + y[H1X4Y15,H3X1Y12,robot1] + y[H1X4Y15,H1X9Y5,robot1]
   + y[H1X4Y15,H2X7Y5,robot1] = 0
 techTour2[robot1,p1]: - x[p1,robot1] + y[H0X12Y17,H2X7Y20,robot1]
   + y[H0X12Y17,H0X12Y17,robot1] + y[H0X12Y17,H3X2Y4,robot1]
   + y[H0X12Y17,H1X4Y15,robot1] + y[H0X12Y17,H1X4Y11,robot1]
   + y[H0X12Y17,H3X1Y12,robot1] + y[H0X12Y17,H1X9Y5,robot1]
   + y[H0X12Y17,H2X7Y5,robot1] = 0
 techTour2[robot1,p2]: - x[p2,robot1] + y[H3X1Y12,H2X7Y20,robot1]
   + y[H3X1Y12,H0X12Y17,robot1] + y[H3X1Y12,H3X2Y4,robot1]
   + y[H3X1Y12,H1X4Y15,robot1] + y[H3X1Y12,H1X4Y11,robot1]
   + y[H3X1Y12,H3X1Y12,robot1] + y[H3X1Y12,H1X9Y5,robot1]
   + y[H3X1Y12,H2X7Y5,robot1] = 0
 techTour2[robot1,p3]: - x[p3,robot1] + y[H2X7Y20,H2X7Y20,robot1]
   + y[H2X7Y20,H0X12Y17,robot1] + y[H2X7Y20,H3X2Y4,robot1]
   + y[H2X7Y20,H1X4Y15,robot1] + y[H2X7Y20,H1X4Y11,robot1]
   + y[H2X7Y20,H3X1Y12,robot1] + y[H2X7Y20,H1X9Y5,robot1]
   + y[H2X7Y20,H2X7Y5,robot1] = 0
 techTour2[robot1,p0_]: - x[p0_,robot1] + y[H2X7Y5,H2X7Y20,robot1]
   + y[H2X7Y5,H0X12Y17,robot1] + y[H2X7Y5,H3X2Y4,robot1]
   + y[H2X7Y5,H1X4Y15,robot1] + y[H2X7Y5,H1X4Y11,robot1]
   + y[H2X7Y5,H3X1Y12,robot1] + y[H2X7Y5,H1X9Y5,robot1]
   + y[H2X7Y5,H2X7Y5,robot1] = 0
 techTour2[robot1,p1_]: - x[p1_,robot1] + y[H3X2Y4,H2X7Y20,robot1]
   + y[H3X2Y4,H0X12Y17,robot1] + y[H3X2Y4,H3X2Y4,robot1]
   + y[H3X2Y4,H1X4Y15,robot1] + y[H3X2Y4,H1X4Y11,robot1]
   + y[H3X2Y4,H3X1Y12,robot1] + y[H3X2Y4,H1X9Y5,robot1]
   + y[H3X2Y4,H2X7Y5,robot1] = 0
 techTour2[robot1,p2_]: - x[p2_,robot1] + y[H1X9Y5,H2X7Y20,robot1]
   + y[H1X9Y5,H0X12Y17,robot1] + y[H1X9Y5,H3X2Y4,robot1]
   + y[H1X9Y5,H1X4Y15,robot1] + y[H1X9Y5,H1X4Y11,robot1]
   + y[H1X9Y5,H3X1Y12,robot1] + y[H1X9Y5,H1X9Y5,robot1]
   + y[H1X9Y5,H2X7Y5,robot1] = 0
 techTour2[robot1,p3_]: - x[p3_,robot1] + y[H1X4Y11,H2X7Y20,robot1]
   + y[H1X4Y11,H0X12Y17,robot1] + y[H1X4Y11,H3X2Y4,robot1]
   + y[H1X4Y11,H1X4Y15,robot1] + y[H1X4Y11,H1X4Y11,robot1]
   + y[H1X4Y11,H3X1Y12,robot1] + y[H1X4Y11,H1X9Y5,robot1]
   + y[H1X4Y11,H2X7Y5,robot1] = 0
 sameinit_loc1[robot0]: - u[robot0] + y[H2X7Y20,H2X7Y5,robot0]
   + y[H0X12Y17,H2X7Y5,robot0] + y[H3X2Y4,H2X7Y5,robot0]
   + y[H1X4Y15,H2X7Y5,robot0] + y[H1X4Y11,H2X7Y5,robot0]
   + y[H3X1Y12,H2X7Y5,robot0] + y[H1X9Y5,H2X7Y5,robot0]
   + y[H2X7Y5,H2X7Y5,robot0] = 0
 sameinit_loc1[robot1]: - u[robot1] + y[H2X7Y20,H3X2Y4,robot1]
   + y[H0X12Y17,H3X2Y4,robot1] + y[H3X2Y4,H3X2Y4,robot1]
   + y[H1X4Y15,H3X2Y4,robot1] + y[H1X4Y11,H3X2Y4,robot1]
   + y[H3X1Y12,H3X2Y4,robot1] + y[H1X9Y5,H3X2Y4,robot1]
   + y[H2X7Y5,H3X2Y4,robot1] = 0
 sameinit_loc2[robot0]: - u[robot0] + y[H2X7Y5,H2X7Y20,robot0]
   + y[H2X7Y5,H0X12Y17,robot0] + y[H2X7Y5,H3X2Y4,robot0]
   + y[H2X7Y5,H1X4Y15,robot0] + y[H2X7Y5,H1X4Y11,robot0]
   + y[H2X7Y5,H3X1Y12,robot0] + y[H2X7Y5,H1X9Y5,robot0]
   + y[H2X7Y5,H2X7Y5,robot0] = 0
 sameinit_loc2[robot1]: - u[robot1] + y[H3X2Y4,H2X7Y20,robot1]
   + y[H3X2Y4,H0X12Y17,robot1] + y[H3X2Y4,H3X2Y4,robot1]
   + y[H3X2Y4,H1X4Y15,robot1] + y[H3X2Y4,H1X4Y11,robot1]
   + y[H3X2Y4,H3X1Y12,robot1] + y[H3X2Y4,H1X9Y5,robot1]
   + y[H3X2Y4,H2X7Y5,robot1] = 0
 tempoPallet[p0,p0]: - 601 y[H1X4Y15,H1X4Y15,robot0]
   - 601 y[H1X4Y15,H1X4Y15,robot1] >= -600
 tempoPallet[p0,p1]: - 604 y[H1X4Y15,H0X12Y17,robot0]
   - 604 y[H1X4Y15,H0X12Y17,robot1] + t[H0X12Y17] - t[H1X4Y15] >= -600
 tempoPallet[p0,p2]: - 608 y[H1X4Y15,H3X1Y12,robot0]
   - 608 y[H1X4Y15,H3X1Y12,robot1] - t[H1X4Y15] + t[H3X1Y12] >= -600
 tempoPallet[p0,p3]: - 607 y[H1X4Y15,H2X7Y20,robot0]
   - 607 y[H1X4Y15,H2X7Y20,robot1] + t[H2X7Y20] - t[H1X4Y15] >= -600
 tempoPallet[p0,p0_]: - 613 y[H1X4Y15,H2X7Y5,robot0]
   - 613 y[H1X4Y15,H2X7Y5,robot1] - t[H1X4Y15] + t[H2X7Y5] >= -600
 tempoPallet[p0,p1_]: - 613 y[H1X4Y15,H3X2Y4,robot0]
   - 613 y[H1X4Y15,H3X2Y4,robot1] + t[H3X2Y4] - t[H1X4Y15] >= -600
 tempoPallet[p0,p2_]: - 618 y[H1X4Y15,H1X9Y5,robot0]
   - 618 y[H1X4Y15,H1X9Y5,robot1] - t[H1X4Y15] + t[H1X9Y5] >= -600
 tempoPallet[p0,p3_]: - 605 y[H1X4Y15,H1X4Y11,robot0]
   - 605 y[H1X4Y15,H1X4Y11,robot1] - t[H1X4Y15] + t[H1X4Y11] >= -600
 tempoPallet[p1,p0]: - 620 y[H0X12Y17,H1X4Y15,robot0]
   - 620 y[H0X12Y17,H1X4Y15,robot1] - t[H0X12Y17] + t[H1X4Y15] >= -600
 tempoPallet[p1,p1]: - 601 y[H0X12Y17,H0X12Y17,robot0]
   - 601 y[H0X12Y17,H0X12Y17,robot1] >= -600
 tempoPallet[p1,p2]: - 612 y[H0X12Y17,H3X1Y12,robot0]
   - 612 y[H0X12Y17,H3X1Y12,robot1] - t[H0X12Y17] + t[H3X1Y12] >= -600
 tempoPallet[p1,p3]: - 607 y[H0X12Y17,H2X7Y20,robot0]
   - 607 y[H0X12Y17,H2X7Y20,robot1] + t[H2X7Y20] - t[H0X12Y17] >= -600
 tempoPallet[p1,p0_]: - 618 y[H0X12Y17,H2X7Y5,robot0]
   - 618 y[H0X12Y17,H2X7Y5,robot1] - t[H0X12Y17] + t[H2X7Y5] >= -600
 tempoPallet[p1,p1_]: - 615 y[H0X12Y17,H3X2Y4,robot0]
   - 615 y[H0X12Y17,H3X2Y4,robot1] - t[H0X12Y17] + t[H3X2Y4] >= -600
 tempoPallet[p1,p2_]: - 616 y[H0X12Y17,H1X9Y5,robot0]
   - 616 y[H0X12Y17,H1X9Y5,robot1] - t[H0X12Y17] + t[H1X9Y5] >= -600
 tempoPallet[p1,p3_]: - 618 y[H0X12Y17,H1X4Y11,robot0]
   - 618 y[H0X12Y17,H1X4Y11,robot1] - t[H0X12Y17] + t[H1X4Y11] >= -600
 tempoPallet[p2,p0]: - 606 y[H3X1Y12,H1X4Y15,robot0]
   - 606 y[H3X1Y12,H1X4Y15,robot1] + t[H1X4Y15] - t[H3X1Y12] >= -600
 tempoPallet[p2,p1]: - 609 y[H3X1Y12,H0X12Y17,robot0]
   - 609 y[H3X1Y12,H0X12Y17,robot1] + t[H0X12Y17] - t[H3X1Y12] >= -600
 tempoPallet[p2,p2]: - 601 y[H3X1Y12,H3X1Y12,robot0]
   - 601 y[H3X1Y12,H3X1Y12,robot1] >= -600
 tempoPallet[p2,p3]: - 612 y[H3X1Y12,H2X7Y20,robot0]
   - 612 y[H3X1Y12,H2X7Y20,robot1] + t[H2X7Y20] - t[H3X1Y12] >= -600
 tempoPallet[p2,p0_]: - 607 y[H3X1Y12,H2X7Y5,robot0]
   - 607 y[H3X1Y12,H2X7Y5,robot1] - t[H3X1Y12] + t[H2X7Y5] >= -600
 tempoPallet[p2,p1_]: - 605 y[H3X1Y12,H3X2Y4,robot0]
   - 605 y[H3X1Y12,H3X2Y4,robot1] + t[H3X2Y4] - t[H3X1Y12] >= -600
 tempoPallet[p2,p2_]: - 606 y[H3X1Y12,H1X9Y5,robot0]
   - 606 y[H3X1Y12,H1X9Y5,robot1] - t[H3X1Y12] + t[H1X9Y5] >= -600
 tempoPallet[p2,p3_]: - 605 y[H3X1Y12,H1X4Y11,robot0]
   - 605 y[H3X1Y12,H1X4Y11,robot1] + t[H1X4Y11] - t[H3X1Y12] >= -600
 tempoPallet[p3,p0]: - 609 y[H2X7Y20,H1X4Y15,robot0]
   - 609 y[H2X7Y20,H1X4Y15,robot1] - t[H2X7Y20] + t[H1X4Y15] >= -600
 tempoPallet[p3,p1]: - 608 y[H2X7Y20,H0X12Y17,robot0]
   - 608 y[H2X7Y20,H0X12Y17,robot1] - t[H2X7Y20] + t[H0X12Y17] >= -600
 tempoPallet[p3,p2]: - 606 y[H2X7Y20,H3X1Y12,robot0]
   - 606 y[H2X7Y20,H3X1Y12,robot1] - t[H2X7Y20] + t[H3X1Y12] >= -600
 tempoPallet[p3,p3]: - 601 y[H2X7Y20,H2X7Y20,robot0]
   - 601 y[H2X7Y20,H2X7Y20,robot1] >= -600
 tempoPallet[p3,p0_]: - 612 y[H2X7Y20,H2X7Y5,robot0]
   - 612 y[H2X7Y20,H2X7Y5,robot1] - t[H2X7Y20] + t[H2X7Y5] >= -600
 tempoPallet[p3,p1_]: - 608 y[H2X7Y20,H3X2Y4,robot0]
   - 608 y[H2X7Y20,H3X2Y4,robot1] - t[H2X7Y20] + t[H3X2Y4] >= -600
 tempoPallet[p3,p2_]: - 611 y[H2X7Y20,H1X9Y5,robot0]
   - 611 y[H2X7Y20,H1X9Y5,robot1] - t[H2X7Y20] + t[H1X9Y5] >= -600
 tempoPallet[p3,p3_]: - 607 y[H2X7Y20,H1X4Y11,robot0]
   - 607 y[H2X7Y20,H1X4Y11,robot1] - t[H2X7Y20] + t[H1X4Y11] >= -600
 tempoPallet[p0_,p0]: - 606 y[H2X7Y5,H1X4Y15,robot0]
   - 606 y[H2X7Y5,H1X4Y15,robot1] + t[H1X4Y15] - t[H2X7Y5] >= -600
 tempoPallet[p0_,p1]: - 609 y[H2X7Y5,H0X12Y17,robot0]
   - 609 y[H2X7Y5,H0X12Y17,robot1] + t[H0X12Y17] - t[H2X7Y5] >= -600
 tempoPallet[p0_,p2]: - 609 y[H2X7Y5,H3X1Y12,robot0]
   - 609 y[H2X7Y5,H3X1Y12,robot1] + t[H3X1Y12] - t[H2X7Y5] >= -600
 tempoPallet[p0_,p3]: - 612 y[H2X7Y5,H2X7Y20,robot0]
   - 612 y[H2X7Y5,H2X7Y20,robot1] + t[H2X7Y20] - t[H2X7Y5] >= -600
 tempoPallet[p0_,p0_]: - 601 y[H2X7Y5,H2X7Y5,robot0]
   - 601 y[H2X7Y5,H2X7Y5,robot1] >= -600
 tempoPallet[p0_,p1_]: - 603 y[H2X7Y5,H3X2Y4,robot0]
   - 603 y[H2X7Y5,H3X2Y4,robot1] + t[H3X2Y4] - t[H2X7Y5] >= -600
 tempoPallet[p0_,p2_]: - 606 y[H2X7Y5,H1X9Y5,robot0]
   - 606 y[H2X7Y5,H1X9Y5,robot1] + t[H1X9Y5] - t[H2X7Y5] >= -600
 tempoPallet[p0_,p3_]: - 604 y[H2X7Y5,H1X4Y11,robot0]
   - 604 y[H2X7Y5,H1X4Y11,robot1] + t[H1X4Y11] - t[H2X7Y5] >= -600
 tempoPallet[p1_,p0]: - 608 y[H3X2Y4,H1X4Y15,robot0]
   - 608 y[H3X2Y4,H1X4Y15,robot1] - t[H3X2Y4] + t[H1X4Y15] >= -600
 tempoPallet[p1_,p1]: - 611 y[H3X2Y4,H0X12Y17,robot0]
   - 611 y[H3X2Y4,H0X12Y17,robot1] + t[H0X12Y17] - t[H3X2Y4] >= -600
 tempoPallet[p1_,p2]: - 613 y[H3X2Y4,H3X1Y12,robot0]
   - 613 y[H3X2Y4,H3X1Y12,robot1] - t[H3X2Y4] + t[H3X1Y12] >= -600
 tempoPallet[p1_,p3]: - 614 y[H3X2Y4,H2X7Y20,robot0]
   - 614 y[H3X2Y4,H2X7Y20,robot1] + t[H2X7Y20] - t[H3X2Y4] >= -600
 tempoPallet[p1_,p0_]: - 605 y[H3X2Y4,H2X7Y5,robot0]
   - 605 y[H3X2Y4,H2X7Y5,robot1] - t[H3X2Y4] + t[H2X7Y5] >= -600
 tempoPallet[p1_,p1_]: - 601 y[H3X2Y4,H3X2Y4,robot0]
   - 601 y[H3X2Y4,H3X2Y4,robot1] >= -600
 tempoPallet[p1_,p2_]: - 604 y[H3X2Y4,H1X9Y5,robot0]
   - 604 y[H3X2Y4,H1X9Y5,robot1] - t[H3X2Y4] + t[H1X9Y5] >= -600
 tempoPallet[p1_,p3_]: - 606 y[H3X2Y4,H1X4Y11,robot0]
   - 606 y[H3X2Y4,H1X4Y11,robot1] - t[H3X2Y4] + t[H1X4Y11] >= -600
 tempoPallet[p2_,p0]: - 605 y[H1X9Y5,H1X4Y15,robot0]
   - 605 y[H1X9Y5,H1X4Y15,robot1] + t[H1X4Y15] - t[H1X9Y5] >= -600
 tempoPallet[p2_,p1]: - 608 y[H1X9Y5,H0X12Y17,robot0]
   - 608 y[H1X9Y5,H0X12Y17,robot1] + t[H0X12Y17] - t[H1X9Y5] >= -600
 tempoPallet[p2_,p2]: - 611 y[H1X9Y5,H3X1Y12,robot0]
   - 611 y[H1X9Y5,H3X1Y12,robot1] + t[H3X1Y12] - t[H1X9Y5] >= -600
 tempoPallet[p2_,p3]: - 611 y[H1X9Y5,H2X7Y20,robot0]
   - 611 y[H1X9Y5,H2X7Y20,robot1] + t[H2X7Y20] - t[H1X9Y5] >= -600
 tempoPallet[p2_,p0_]: - 604 y[H1X9Y5,H2X7Y5,robot0]
   - 604 y[H1X9Y5,H2X7Y5,robot1] - t[H1X9Y5] + t[H2X7Y5] >= -600
 tempoPallet[p2_,p1_]: - 604 y[H1X9Y5,H3X2Y4,robot0]
   - 604 y[H1X9Y5,H3X2Y4,robot1] + t[H3X2Y4] - t[H1X9Y5] >= -600
 tempoPallet[p2_,p2_]: - 601 y[H1X9Y5,H1X9Y5,robot0]
   - 601 y[H1X9Y5,H1X9Y5,robot1] >= -600
 tempoPallet[p2_,p3_]: - 606 y[H1X9Y5,H1X4Y11,robot0]
   - 606 y[H1X9Y5,H1X4Y11,robot1] + t[H1X4Y11] - t[H1X9Y5] >= -600
 tempoPallet[p3_,p0]: - 603 y[H1X4Y11,H1X4Y15,robot0]
   - 603 y[H1X4Y11,H1X4Y15,robot1] + t[H1X4Y15] - t[H1X4Y11] >= -600
 tempoPallet[p3_,p1]: - 606 y[H1X4Y11,H0X12Y17,robot0]
   - 606 y[H1X4Y11,H0X12Y17,robot1] + t[H0X12Y17] - t[H1X4Y11] >= -600
 tempoPallet[p3_,p2]: - 613 y[H1X4Y11,H3X1Y12,robot0]
   - 613 y[H1X4Y11,H3X1Y12,robot1] - t[H1X4Y11] + t[H3X1Y12] >= -600
 tempoPallet[p3_,p3]: - 609 y[H1X4Y11,H2X7Y20,robot0]
   - 609 y[H1X4Y11,H2X7Y20,robot1] + t[H2X7Y20] - t[H1X4Y11] >= -600
 tempoPallet[p3_,p0_]: - 609 y[H1X4Y11,H2X7Y5,robot0]
   - 609 y[H1X4Y11,H2X7Y5,robot1] - t[H1X4Y11] + t[H2X7Y5] >= -600
 tempoPallet[p3_,p1_]: - 609 y[H1X4Y11,H3X2Y4,robot0]
   - 609 y[H1X4Y11,H3X2Y4,robot1] + t[H3X2Y4] - t[H1X4Y11] >= -600
 tempoPallet[p3_,p2_]: - 614 y[H1X4Y11,H1X9Y5,robot0]
   - 614 y[H1X4Y11,H1X9Y5,robot1] - t[H1X4Y11] + t[H1X9Y5] >= -600
 tempoPallet[p3_,p3_]: - 601 y[H1X4Y11,H1X4Y11,robot0]
   - 601 y[H1X4Y11,H1X4Y11,robot1] >= -600
 tempoinit_loc[H3X2Y4,p0]: - 607 y[H3X2Y4,H1X4Y15,robot0]
   - 607 y[H3X2Y4,H1X4Y15,robot1] - t[H3X2Y4] + t[H1X4Y15] >= -600
 tempoinit_loc[H3X2Y4,p1]: - 610 y[H3X2Y4,H0X12Y17,robot0]
   - 610 y[H3X2Y4,H0X12Y17,robot1] + t[H0X12Y17] - t[H3X2Y4] >= -600
 tempoinit_loc[H3X2Y4,p2]: - 612 y[H3X2Y4,H3X1Y12,robot0]
   - 612 y[H3X2Y4,H3X1Y12,robot1] - t[H3X2Y4] + t[H3X1Y12] >= -600
 tempoinit_loc[H3X2Y4,p3]: - 613 y[H3X2Y4,H2X7Y20,robot0]
   - 613 y[H3X2Y4,H2X7Y20,robot1] + t[H2X7Y20] - t[H3X2Y4] >= -600
 tempoinit_loc[H3X2Y4,p0_]: - 604 y[H3X2Y4,H2X7Y5,robot0]
   - 604 y[H3X2Y4,H2X7Y5,robot1] - t[H3X2Y4] + t[H2X7Y5] >= -600
 tempoinit_loc[H3X2Y4,p1_]: - 600 y[H3X2Y4,H3X2Y4,robot0]
   - 600 y[H3X2Y4,H3X2Y4,robot1] >= -600
 tempoinit_loc[H3X2Y4,p2_]: - 603 y[H3X2Y4,H1X9Y5,robot0]
   - 603 y[H3X2Y4,H1X9Y5,robot1] - t[H3X2Y4] + t[H1X9Y5] >= -600
 tempoinit_loc[H3X2Y4,p3_]: - 605 y[H3X2Y4,H1X4Y11,robot0]
   - 605 y[H3X2Y4,H1X4Y11,robot1] - t[H3X2Y4] + t[H1X4Y11] >= -600
 tempoinit_loc[H2X7Y5,p0]: - 605 y[H2X7Y5,H1X4Y15,robot0]
   - 605 y[H2X7Y5,H1X4Y15,robot1] + t[H1X4Y15] - t[H2X7Y5] >= -600
 tempoinit_loc[H2X7Y5,p1]: - 608 y[H2X7Y5,H0X12Y17,robot0]
   - 608 y[H2X7Y5,H0X12Y17,robot1] + t[H0X12Y17] - t[H2X7Y5] >= -600
 tempoinit_loc[H2X7Y5,p2]: - 608 y[H2X7Y5,H3X1Y12,robot0]
   - 608 y[H2X7Y5,H3X1Y12,robot1] + t[H3X1Y12] - t[H2X7Y5] >= -600
 tempoinit_loc[H2X7Y5,p3]: - 611 y[H2X7Y5,H2X7Y20,robot0]
   - 611 y[H2X7Y5,H2X7Y20,robot1] + t[H2X7Y20] - t[H2X7Y5] >= -600
 tempoinit_loc[H2X7Y5,p0_]: - 600 y[H2X7Y5,H2X7Y5,robot0]
   - 600 y[H2X7Y5,H2X7Y5,robot1] >= -600
 tempoinit_loc[H2X7Y5,p1_]: - 602 y[H2X7Y5,H3X2Y4,robot0]
   - 602 y[H2X7Y5,H3X2Y4,robot1] + t[H3X2Y4] - t[H2X7Y5] >= -600
 tempoinit_loc[H2X7Y5,p2_]: - 605 y[H2X7Y5,H1X9Y5,robot0]
   - 605 y[H2X7Y5,H1X9Y5,robot1] + t[H1X9Y5] - t[H2X7Y5] >= -600
 tempoinit_loc[H2X7Y5,p3_]: - 603 y[H2X7Y5,H1X4Y11,robot0]
   - 603 y[H2X7Y5,H1X4Y11,robot1] + t[H1X4Y11] - t[H2X7Y5] >= -600
 timeWinA[p0]: t[H1X4Y15] + xa[p0] >= 0
 timeWinA[p1]: t[H0X12Y17] + xa[p1] >= 0
 timeWinA[p2]: t[H3X1Y12] + xa[p2] >= 0
 timeWinA[p3]: t[H2X7Y20] + xa[p3] >= 0
 timeWinA[p0_]: t[H2X7Y5] + xa[p0_] >= 0
 timeWinA[p1_]: t[H3X2Y4] + xa[p1_] >= 0
 timeWinA[p2_]: t[H1X9Y5] + xa[p2_] >= 0
 timeWinA[p3_]: t[H1X4Y11] + xa[p3_] >= 0
 timeWinB[p0]: t[H1X4Y15] - xb[p0] <= 200
 timeWinB[p1]: t[H0X12Y17] - xb[p1] <= 200
 timeWinB[p2]: t[H3X1Y12] - xb[p2] <= 200
 timeWinB[p3]: t[H2X7Y20] - xb[p3] <= 200
 timeWinB[p0_]: t[H2X7Y5] - xb[p0_] <= 200
 timeWinB[p1_]: t[H3X2Y4] - xb[p1_] <= 200
 timeWinB[p2_]: t[H1X9Y5] - xb[p2_] <= 200
 timeWinB[p3_]: t[H1X4Y11] - xb[p3_] <= 200
 lateness[p0]: - t[H1X4Y15] + z[p0] >= -229
 lateness[p1]: - t[H0X12Y17] + z[p1] >= -229
 lateness[p2]: - t[H3X1Y12] + z[p2] >= -229
 lateness[p3]: - t[H2X7Y20] + z[p3] >= -229
 lateness[p0_]: - t[H2X7Y5] + z[p0_] >= -229
 lateness[p1_]: - t[H3X2Y4] + z[p1_] >= -229
 lateness[p2_]: - t[H1X9Y5] + z[p2_] >= -229
 lateness[p3_]: - t[H1X4Y11] + z[p3_] >= -229
Bounds
 y[H2X7Y20,H3X2Y4,robot0] = 0
 y[H2X7Y20,H2X7Y5,robot1] = 0
 y[H0X12Y17,H3X2Y4,robot0] = 0
 y[H0X12Y17,H2X7Y5,robot1] = 0
 y[H3X2Y4,H2X7Y20,robot0] = 0
 y[H3X2Y4,H0X12Y17,robot0] = 0
 y[H3X2Y4,H3X2Y4,robot0] = 0
 y[H3X2Y4,H1X4Y15,robot0] = 0
 y[H3X2Y4,H1X4Y11,robot0] = 0
 y[H3X2Y4,H3X1Y12,robot0] = 0
 y[H3X2Y4,H1X9Y5,robot0] = 0
 y[H3X2Y4,H2X7Y5,robot0] = 0
 y[H3X2Y4,H2X7Y5,robot1] = 0
 y[H1X4Y15,H3X2Y4,robot0] = 0
 y[H1X4Y15,H2X7Y5,robot1] = 0
 y[H1X4Y11,H3X2Y4,robot0] = 0
 y[H1X4Y11,H2X7Y5,robot1] = 0
 y[H3X1Y12,H3X2Y4,robot0] = 0
 y[H3X1Y12,H2X7Y5,robot1] = 0
 y[H1X9Y5,H3X2Y4,robot0] = 0
 y[H1X9Y5,H2X7Y5,robot1] = 0
 y[H2X7Y5,H2X7Y20,robot1] = 0
 y[H2X7Y5,H0X12Y17,robot1] = 0
 y[H2X7Y5,H3X2Y4,robot0] = 0
 y[H2X7Y5,H3X2Y4,robot1] = 0
 y[H2X7Y5,H1X4Y15,robot1] = 0
 y[H2X7Y5,H1X4Y11,robot1] = 0
 y[H2X7Y5,H3X1Y12,robot1] = 0
 y[H2X7Y5,H1X9Y5,robot1] = 0
 y[H2X7Y5,H2X7Y5,robot1] = 0
 t[H2X7Y20] <= 600
 t[H0X12Y17] <= 600
 t[H3X2Y4] <= 600
 t[H1X4Y15] <= 600
 t[H1X4Y11] <= 600
 t[H3X1Y12] <= 600
 t[H1X9Y5] <= 600
 t[H2X7Y5] <= 600
Binaries
 x[p0,robot0] x[p0,robot1] x[p1,robot0] x[p1,robot1] x[p2,robot0]
 x[p2,robot1] x[p3,robot0] x[p3,robot1] x[p0_,robot0] x[p0_,robot1]
 x[p1_,robot0] x[p1_,robot1] x[p2_,robot0] x[p2_,robot1] x[p3_,robot0]
 x[p3_,robot1] u[robot0] u[robot1] y[H2X7Y20,H2X7Y20,robot0]
 y[H2X7Y20,H2X7Y20,robot1] y[H2X7Y20,H0X12Y17,robot0]
 y[H2X7Y20,H0X12Y17,robot1] y[H2X7Y20,H3X2Y4,robot0]
 y[H2X7Y20,H3X2Y4,robot1] y[H2X7Y20,H1X4Y15,robot0]
 y[H2X7Y20,H1X4Y15,robot1] y[H2X7Y20,H1X4Y11,robot0]
 y[H2X7Y20,H1X4Y11,robot1] y[H2X7Y20,H3X1Y12,robot0]
 y[H2X7Y20,H3X1Y12,robot1] y[H2X7Y20,H1X9Y5,robot0]
 y[H2X7Y20,H1X9Y5,robot1] y[H2X7Y20,H2X7Y5,robot0] y[H2X7Y20,H2X7Y5,robot1]
 y[H0X12Y17,H2X7Y20,robot0] y[H0X12Y17,H2X7Y20,robot1]
 y[H0X12Y17,H0X12Y17,robot0] y[H0X12Y17,H0X12Y17,robot1]
 y[H0X12Y17,H3X2Y4,robot0] y[H0X12Y17,H3X2Y4,robot1]
 y[H0X12Y17,H1X4Y15,robot0] y[H0X12Y17,H1X4Y15,robot1]
 y[H0X12Y17,H1X4Y11,robot0] y[H0X12Y17,H1X4Y11,robot1]
 y[H0X12Y17,H3X1Y12,robot0] y[H0X12Y17,H3X1Y12,robot1]
 y[H0X12Y17,H1X9Y5,robot0] y[H0X12Y17,H1X9Y5,robot1]
 y[H0X12Y17,H2X7Y5,robot0] y[H0X12Y17,H2X7Y5,robot1]
 y[H3X2Y4,H2X7Y20,robot0] y[H3X2Y4,H2X7Y20,robot1]
 y[H3X2Y4,H0X12Y17,robot0] y[H3X2Y4,H0X12Y17,robot1]
 y[H3X2Y4,H3X2Y4,robot0] y[H3X2Y4,H3X2Y4,robot1] y[H3X2Y4,H1X4Y15,robot0]
 y[H3X2Y4,H1X4Y15,robot1] y[H3X2Y4,H1X4Y11,robot0] y[H3X2Y4,H1X4Y11,robot1]
 y[H3X2Y4,H3X1Y12,robot0] y[H3X2Y4,H3X1Y12,robot1] y[H3X2Y4,H1X9Y5,robot0]
 y[H3X2Y4,H1X9Y5,robot1] y[H3X2Y4,H2X7Y5,robot0] y[H3X2Y4,H2X7Y5,robot1]
 y[H1X4Y15,H2X7Y20,robot0] y[H1X4Y15,H2X7Y20,robot1]
 y[H1X4Y15,H0X12Y17,robot0] y[H1X4Y15,H0X12Y17,robot1]
 y[H1X4Y15,H3X2Y4,robot0] y[H1X4Y15,H3X2Y4,robot1]
 y[H1X4Y15,H1X4Y15,robot0] y[H1X4Y15,H1X4Y15,robot1]
 y[H1X4Y15,H1X4Y11,robot0] y[H1X4Y15,H1X4Y11,robot1]
 y[H1X4Y15,H3X1Y12,robot0] y[H1X4Y15,H3X1Y12,robot1]
 y[H1X4Y15,H1X9Y5,robot0] y[H1X4Y15,H1X9Y5,robot1] y[H1X4Y15,H2X7Y5,robot0]
 y[H1X4Y15,H2X7Y5,robot1] y[H1X4Y11,H2X7Y20,robot0]
 y[H1X4Y11,H2X7Y20,robot1] y[H1X4Y11,H0X12Y17,robot0]
 y[H1X4Y11,H0X12Y17,robot1] y[H1X4Y11,H3X2Y4,robot0]
 y[H1X4Y11,H3X2Y4,robot1] y[H1X4Y11,H1X4Y15,robot0]
 y[H1X4Y11,H1X4Y15,robot1] y[H1X4Y11,H1X4Y11,robot0]
 y[H1X4Y11,H1X4Y11,robot1] y[H1X4Y11,H3X1Y12,robot0]
 y[H1X4Y11,H3X1Y12,robot1] y[H1X4Y11,H1X9Y5,robot0]
 y[H1X4Y11,H1X9Y5,robot1] y[H1X4Y11,H2X7Y5,robot0] y[H1X4Y11,H2X7Y5,robot1]
 y[H3X1Y12,H2X7Y20,robot0] y[H3X1Y12,H2X7Y20,robot1]
 y[H3X1Y12,H0X12Y17,robot0] y[H3X1Y12,H0X12Y17,robot1]
 y[H3X1Y12,H3X2Y4,robot0] y[H3X1Y12,H3X2Y4,robot1]
 y[H3X1Y12,H1X4Y15,robot0] y[H3X1Y12,H1X4Y15,robot1]
 y[H3X1Y12,H1X4Y11,robot0] y[H3X1Y12,H1X4Y11,robot1]
 y[H3X1Y12,H3X1Y12,robot0] y[H3X1Y12,H3X1Y12,robot1]
 y[H3X1Y12,H1X9Y5,robot0] y[H3X1Y12,H1X9Y5,robot1] y[H3X1Y12,H2X7Y5,robot0]
 y[H3X1Y12,H2X7Y5,robot1] y[H1X9Y5,H2X7Y20,robot0] y[H1X9Y5,H2X7Y20,robot1]
 y[H1X9Y5,H0X12Y17,robot0] y[H1X9Y5,H0X12Y17,robot1]
 y[H1X9Y5,H3X2Y4,robot0] y[H1X9Y5,H3X2Y4,robot1] y[H1X9Y5,H1X4Y15,robot0]
 y[H1X9Y5,H1X4Y15,robot1] y[H1X9Y5,H1X4Y11,robot0] y[H1X9Y5,H1X4Y11,robot1]
 y[H1X9Y5,H3X1Y12,robot0] y[H1X9Y5,H3X1Y12,robot1] y[H1X9Y5,H1X9Y5,robot0]
 y[H1X9Y5,H1X9Y5,robot1] y[H1X9Y5,H2X7Y5,robot0] y[H1X9Y5,H2X7Y5,robot1]
 y[H2X7Y5,H2X7Y20,robot0] y[H2X7Y5,H2X7Y20,robot1]
 y[H2X7Y5,H0X12Y17,robot0] y[H2X7Y5,H0X12Y17,robot1]
 y[H2X7Y5,H3X2Y4,robot0] y[H2X7Y5,H3X2Y4,robot1] y[H2X7Y5,H1X4Y15,robot0]
 y[H2X7Y5,H1X4Y15,robot1] y[H2X7Y5,H1X4Y11,robot0] y[H2X7Y5,H1X4Y11,robot1]
 y[H2X7Y5,H3X1Y12,robot0] y[H2X7Y5,H3X1Y12,robot1] y[H2X7Y5,H1X9Y5,robot0]
 y[H2X7Y5,H1X9Y5,robot1] y[H2X7Y5,H2X7Y5,robot0] y[H2X7Y5,H2X7Y5,robot1]
 g[p0] g[p1] g[p2] g[p3] g[p0_] g[p1_] g[p2_] g[p3_]
End
