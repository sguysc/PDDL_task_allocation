(define (problem auto_warehouse_easy)
  (:domain auto_warehouse)
  (:objects
    p0 p1 p2 p3 - pallet
    robot0 robot1 - agent
    H0X4Y16 H1X4Y6 H0X9Y17 H1X5Y12 H0X5Y17 H1X4Y7 H3X0Y17 H3X6Y15 H3X0Y16 H2X4Y6 H2X7Y20 
    H0X4Y17 H3X1Y12 H1X14Y19 H3X1Y11 H2X5Y8 H3X2Y7 H2X11Y20 H3X1Y14 H1X5Y15 H3X6Y11 H3X6Y7 H2X7Y7 
    H2X12Y20 H2X4Y20 H2X4Y8 H0X3Y9 H0X3Y7 H1X4Y2 H0X11Y17 H3X2Y4 H2X7Y5 H1X4Y9 H2X2Y9 H0X12Y17 
    H1X5Y11 H1X6Y5 H3X1Y7 H0X10Y17 H1X5Y8 H1X9Y6 H2X6Y20 H3X6Y14 H0X6Y9 H0X5Y16 H3X2Y5 H1X4Y11 
    H1X4Y15 H1X6Y9 H2X2Y19 H1X4Y14 H2X7Y8 H3X5Y3 H3X1Y9 H0X7Y9 H1X4Y5 H2X3Y9 H2X4Y5 H1X4Y17 
    H1X9Y5 H3X1Y6 H1X4Y4 H3X1Y13 H1X4Y8 H2X5Y5 H0X7Y3 H1X4Y13 H0X4Y2 H3X6Y10 H3X1Y8 H2X6Y5 
    H1X9Y3 H1X6Y4 H3X6Y13 H1X6Y6 H0X6Y17 H1X4Y3 H0X7Y1 H1X14Y18 H1X4Y16 H1X4Y1 H3X2Y16 H1X5Y7 
    H0X6Y3 H2X6Y8 H3X0Y15 H1X4Y12 H0X8Y17 H3X6Y8 H1X5Y9 H3X2Y18 H2X10Y20 H3X1Y5 H3X1Y3 H3X5Y5 
    H0X4Y9 H3X0Y11 H1X5Y17 H2X5Y20 H3X1Y2 H3X6Y12 H1X5Y18 H1X4Y10 H3X2Y17 H1X9Y4 H2X4Y19 H2X3Y20 
    H0X7Y17 H3X1Y10 H3X1Y4 H3X3Y18 H0X2Y9 H3X9Y7 - location
  )

  (:init (= (total-cost) 0)
         (at robot0 H2X7Y5) (at robot1 H3X2Y4) 
         (avail robot0) (avail robot1) 
         (at p0 H1X4Y15) (at p1 H0X12Y17) (at p2 H3X1Y12) (at p3 H2X7Y20) 
         (avail p0) (avail p1) (avail p2) (avail p3) 
         (connected H1X9Y5 H1X9Y5) (= (distance H1X9Y5 H1X9Y5) 0)
         (connected H1X9Y5 H1X9Y6) (= (distance H1X9Y5 H1X9Y6) 1)
         (connected H1X9Y6 H2X7Y8) (= (distance H1X9Y6 H2X7Y8) 1)
         (connected H2X7Y8 H2X6Y8) (= (distance H2X7Y8 H2X6Y8) 1)
         (connected H2X6Y8 H1X4Y10) (= (distance H2X6Y8 H1X4Y10) 1)
         (connected H1X4Y10 H1X4Y11) (= (distance H1X4Y10 H1X4Y11) 1)
         (connected H1X4Y11 H1X4Y10) (= (distance H1X4Y11 H1X4Y10) 1)
         (connected H1X4Y10 H1X4Y9) (= (distance H1X4Y10 H1X4Y9) 1)
         (connected H1X4Y9 H1X4Y8) (= (distance H1X4Y9 H1X4Y8) 1)
         (connected H1X4Y8 H1X4Y7) (= (distance H1X4Y8 H1X4Y7) 1)
         (connected H1X4Y7 H1X4Y6) (= (distance H1X4Y7 H1X4Y6) 1)
         (connected H1X4Y6 H1X4Y5) (= (distance H1X4Y6 H1X4Y5) 1)
         (connected H1X4Y5 H1X4Y4) (= (distance H1X4Y5 H1X4Y4) 1)
         (connected H1X4Y4 H1X4Y3) (= (distance H1X4Y4 H1X4Y3) 1)
         (connected H1X4Y3 H1X4Y2) (= (distance H1X4Y3 H1X4Y2) 1)
         (connected H1X4Y2 H1X4Y1) (= (distance H1X4Y2 H1X4Y1) 1)
         (connected H1X4Y1 H0X6Y3) (= (distance H1X4Y1 H0X6Y3) 1)
         (connected H0X6Y3 H0X7Y3) (= (distance H0X6Y3 H0X7Y3) 1)
         (connected H0X7Y3 H1X9Y5) (= (distance H0X7Y3 H1X9Y5) 1)
         (connected H1X9Y5 H2X7Y7) (= (distance H1X9Y5 H2X7Y7) 1)
         (connected H2X7Y7 H1X5Y9) (= (distance H2X7Y7 H1X5Y9) 1)
         (connected H1X5Y9 H1X5Y12) (= (distance H1X5Y9 H1X5Y12) 1)
         (connected H1X5Y12 H1X4Y15) (= (distance H1X5Y12 H1X4Y15) 1)
         (connected H1X4Y15 H1X4Y14) (= (distance H1X4Y15 H1X4Y14) 1)
         (connected H1X4Y14 H1X4Y13) (= (distance H1X4Y14 H1X4Y13) 1)
         (connected H1X4Y13 H1X4Y12) (= (distance H1X4Y13 H1X4Y12) 1)
         (connected H1X4Y12 H1X4Y11) (= (distance H1X4Y12 H1X4Y11) 1)
         (connected H1X4Y11 H1X4Y10) (= (distance H1X4Y11 H1X4Y10) 1)
         (connected H1X4Y10 H1X4Y9) (= (distance H1X4Y10 H1X4Y9) 1)
         (connected H1X4Y9 H1X4Y8) (= (distance H1X4Y9 H1X4Y8) 1)
         (connected H1X4Y8 H1X4Y7) (= (distance H1X4Y8 H1X4Y7) 1)
         (connected H1X4Y7 H1X4Y6) (= (distance H1X4Y7 H1X4Y6) 1)
         (connected H1X4Y6 H1X4Y5) (= (distance H1X4Y6 H1X4Y5) 1)
         (connected H1X4Y5 H1X4Y4) (= (distance H1X4Y5 H1X4Y4) 1)
         (connected H1X4Y4 H1X4Y3) (= (distance H1X4Y4 H1X4Y3) 1)
         (connected H1X4Y3 H1X4Y2) (= (distance H1X4Y3 H1X4Y2) 1)
         (connected H1X4Y2 H1X4Y1) (= (distance H1X4Y2 H1X4Y1) 1)
         (connected H1X4Y1 H0X6Y3) (= (distance H1X4Y1 H0X6Y3) 1)
         (connected H0X6Y3 H0X7Y3) (= (distance H0X6Y3 H0X7Y3) 1)
         (connected H0X7Y3 H1X9Y5) (= (distance H0X7Y3 H1X9Y5) 1)
         (connected H1X9Y5 H2X7Y7) (= (distance H1X9Y5 H2X7Y7) 1)
         (connected H2X7Y7 H1X5Y9) (= (distance H2X7Y7 H1X5Y9) 1)
         (connected H1X5Y9 H1X5Y12) (= (distance H1X5Y9 H1X5Y12) 1)
         (connected H1X5Y12 H1X4Y15) (= (distance H1X5Y12 H1X4Y15) 1)
         (connected H1X4Y15 H0X6Y17) (= (distance H1X4Y15 H0X6Y17) 1)
         (connected H0X6Y17 H0X9Y17) (= (distance H0X6Y17 H0X9Y17) 1)
         (connected H0X9Y17 H0X12Y17) (= (distance H0X9Y17 H0X12Y17) 1)
         (connected H0X12Y17 H0X11Y17) (= (distance H0X12Y17 H0X11Y17) 1)
         (connected H0X11Y17 H0X10Y17) (= (distance H0X11Y17 H0X10Y17) 1)
         (connected H0X10Y17 H0X9Y17) (= (distance H0X10Y17 H0X9Y17) 1)
         (connected H0X9Y17 H0X8Y17) (= (distance H0X9Y17 H0X8Y17) 1)
         (connected H0X8Y17 H0X7Y17) (= (distance H0X8Y17 H0X7Y17) 1)
         (connected H0X7Y17 H0X6Y17) (= (distance H0X7Y17 H0X6Y17) 1)
         (connected H0X6Y17 H0X5Y17) (= (distance H0X6Y17 H0X5Y17) 1)
         (connected H0X5Y17 H0X4Y17) (= (distance H0X5Y17 H0X4Y17) 1)
         (connected H0X4Y17 H3X6Y15) (= (distance H0X4Y17 H3X6Y15) 1)
         (connected H3X6Y15 H3X6Y12) (= (distance H3X6Y15 H3X6Y12) 1)
         (connected H3X6Y12 H3X6Y11) (= (distance H3X6Y12 H3X6Y11) 1)
         (connected H3X6Y11 H3X6Y8) (= (distance H3X6Y11 H3X6Y8) 1)
         (connected H3X6Y8 H3X5Y5) (= (distance H3X6Y8 H3X5Y5) 1)
         (connected H3X5Y5 H0X7Y3) (= (distance H3X5Y5 H0X7Y3) 1)
         (connected H0X7Y3 H1X9Y5) (= (distance H0X7Y3 H1X9Y5) 1)
         (connected H1X9Y5 H2X7Y7) (= (distance H1X9Y5 H2X7Y7) 1)
         (connected H2X7Y7 H2X4Y6) (= (distance H2X7Y7 H2X4Y6) 1)
         (connected H2X4Y6 H3X2Y4) (= (distance H2X4Y6 H3X2Y4) 1)
         (connected H3X2Y4 H0X4Y2) (= (distance H3X2Y4 H0X4Y2) 1)
         (connected H0X4Y2 H0X7Y3) (= (distance H0X4Y2 H0X7Y3) 1)
         (connected H0X7Y3 H1X9Y5) (= (distance H0X7Y3 H1X9Y5) 1)
         (connected H1X9Y5 H1X9Y4) (= (distance H1X9Y5 H1X9Y4) 1)
         (connected H1X9Y4 H1X9Y3) (= (distance H1X9Y4 H1X9Y3) 1)
         (connected H1X9Y3 H2X7Y5) (= (distance H1X9Y3 H2X7Y5) 1)
         (connected H2X7Y5 H3X5Y3) (= (distance H2X7Y5 H3X5Y3) 1)
         (connected H3X5Y3 H0X7Y1) (= (distance H3X5Y3 H0X7Y1) 1)
         (connected H0X7Y1 H1X9Y3) (= (distance H0X7Y1 H1X9Y3) 1)
         (connected H1X9Y3 H1X9Y4) (= (distance H1X9Y3 H1X9Y4) 1)
         (connected H1X9Y4 H1X9Y5) (= (distance H1X9Y4 H1X9Y5) 1)
         (connected H1X9Y5 H1X9Y6) (= (distance H1X9Y5 H1X9Y6) 1)
         (connected H1X9Y6 H2X7Y8) (= (distance H1X9Y6 H2X7Y8) 1)
         (connected H2X7Y8 H2X6Y8) (= (distance H2X7Y8 H2X6Y8) 1)
         (connected H2X6Y8 H2X3Y9) (= (distance H2X6Y8 H2X3Y9) 1)
         (connected H2X3Y9 H3X1Y7) (= (distance H2X3Y9 H3X1Y7) 1)
         (connected H3X1Y7 H3X1Y8) (= (distance H3X1Y7 H3X1Y8) 1)
         (connected H3X1Y8 H3X1Y9) (= (distance H3X1Y8 H3X1Y9) 1)
         (connected H3X1Y9 H3X1Y10) (= (distance H3X1Y9 H3X1Y10) 1)
         (connected H3X1Y10 H3X1Y11) (= (distance H3X1Y10 H3X1Y11) 1)
         (connected H3X1Y11 H3X1Y12) (= (distance H3X1Y11 H3X1Y12) 1)
         (connected H3X1Y12 H3X1Y9) (= (distance H3X1Y12 H3X1Y9) 1)
         (connected H3X1Y9 H0X3Y7) (= (distance H3X1Y9 H0X3Y7) 1)
         (connected H0X3Y7 H3X5Y5) (= (distance H0X3Y7 H3X5Y5) 1)
         (connected H3X5Y5 H0X7Y3) (= (distance H3X5Y5 H0X7Y3) 1)
         (connected H0X7Y3 H1X9Y5) (= (distance H0X7Y3 H1X9Y5) 1)
         (connected H1X9Y5 H2X7Y7) (= (distance H1X9Y5 H2X7Y7) 1)
         (connected H2X7Y7 H1X5Y9) (= (distance H2X7Y7 H1X5Y9) 1)
         (connected H1X5Y9 H1X5Y12) (= (distance H1X5Y9 H1X5Y12) 1)
         (connected H1X5Y12 H1X5Y15) (= (distance H1X5Y12 H1X5Y15) 1)
         (connected H1X5Y15 H1X5Y18) (= (distance H1X5Y15 H1X5Y18) 1)
         (connected H1X5Y18 H2X3Y20) (= (distance H1X5Y18 H2X3Y20) 1)
         (connected H2X3Y20 H2X4Y20) (= (distance H2X3Y20 H2X4Y20) 1)
         (connected H2X4Y20 H2X5Y20) (= (distance H2X4Y20 H2X5Y20) 1)
         (connected H2X5Y20 H2X6Y20) (= (distance H2X5Y20 H2X6Y20) 1)
         (connected H2X6Y20 H2X7Y20) (= (distance H2X6Y20 H2X7Y20) 1)
         (connected H2X7Y20 H2X4Y19) (= (distance H2X7Y20 H2X4Y19) 1)
         (connected H2X4Y19 H3X2Y17) (= (distance H2X4Y19 H3X2Y17) 1)
         (connected H3X2Y17 H3X2Y16) (= (distance H3X2Y17 H3X2Y16) 1)
         (connected H3X2Y16 H3X1Y13) (= (distance H3X2Y16 H3X1Y13) 1)
         (connected H3X1Y13 H3X1Y10) (= (distance H3X1Y13 H3X1Y10) 1)
         (connected H3X1Y10 H3X1Y9) (= (distance H3X1Y10 H3X1Y9) 1)
         (connected H3X1Y9 H0X3Y7) (= (distance H3X1Y9 H0X3Y7) 1)
         (connected H0X3Y7 H3X5Y5) (= (distance H0X3Y7 H3X5Y5) 1)
         (connected H3X5Y5 H0X7Y3) (= (distance H3X5Y5 H0X7Y3) 1)
         (connected H0X7Y3 H1X9Y5) (= (distance H0X7Y3 H1X9Y5) 1)
         (connected H1X4Y11 H1X4Y11) (= (distance H1X4Y11 H1X4Y11) 0)
         (connected H1X4Y11 H1X4Y12) (= (distance H1X4Y11 H1X4Y12) 1)
         (connected H1X4Y12 H1X4Y15) (= (distance H1X4Y12 H1X4Y15) 1)
         (connected H1X4Y15 H1X4Y14) (= (distance H1X4Y15 H1X4Y14) 1)
         (connected H1X4Y14 H1X4Y13) (= (distance H1X4Y14 H1X4Y13) 1)
         (connected H1X4Y13 H1X4Y12) (= (distance H1X4Y13 H1X4Y12) 1)
         (connected H1X4Y12 H1X4Y11) (= (distance H1X4Y12 H1X4Y11) 1)
         (connected H1X4Y11 H1X4Y12) (= (distance H1X4Y11 H1X4Y12) 1)
         (connected H1X4Y12 H1X4Y15) (= (distance H1X4Y12 H1X4Y15) 1)
         (connected H1X4Y15 H0X6Y17) (= (distance H1X4Y15 H0X6Y17) 1)
         (connected H0X6Y17 H0X9Y17) (= (distance H0X6Y17 H0X9Y17) 1)
         (connected H0X9Y17 H0X12Y17) (= (distance H0X9Y17 H0X12Y17) 1)
         (connected H0X12Y17 H0X11Y17) (= (distance H0X12Y17 H0X11Y17) 1)
         (connected H0X11Y17 H0X10Y17) (= (distance H0X11Y17 H0X10Y17) 1)
         (connected H0X10Y17 H0X9Y17) (= (distance H0X10Y17 H0X9Y17) 1)
         (connected H0X9Y17 H0X8Y17) (= (distance H0X9Y17 H0X8Y17) 1)
         (connected H0X8Y17 H0X7Y17) (= (distance H0X8Y17 H0X7Y17) 1)
         (connected H0X7Y17 H0X6Y17) (= (distance H0X7Y17 H0X6Y17) 1)
         (connected H0X6Y17 H0X5Y17) (= (distance H0X6Y17 H0X5Y17) 1)
         (connected H0X5Y17 H0X4Y17) (= (distance H0X5Y17 H0X4Y17) 1)
         (connected H0X4Y17 H3X6Y15) (= (distance H0X4Y17 H3X6Y15) 1)
         (connected H3X6Y15 H3X6Y12) (= (distance H3X6Y15 H3X6Y12) 1)
         (connected H3X6Y12 H3X6Y11) (= (distance H3X6Y12 H3X6Y11) 1)
         (connected H3X6Y11 H3X6Y10) (= (distance H3X6Y11 H3X6Y10) 1)
         (connected H3X6Y10 H2X4Y8) (= (distance H3X6Y10 H2X4Y8) 1)
         (connected H2X4Y8 H2X5Y8) (= (distance H2X4Y8 H2X5Y8) 1)
         (connected H2X5Y8 H2X6Y8) (= (distance H2X5Y8 H2X6Y8) 1)
         (connected H2X6Y8 H1X4Y10) (= (distance H2X6Y8 H1X4Y10) 1)
         (connected H1X4Y10 H1X4Y11) (= (distance H1X4Y10 H1X4Y11) 1)
         (connected H1X4Y11 H1X4Y10) (= (distance H1X4Y11 H1X4Y10) 1)
         (connected H1X4Y10 H1X4Y9) (= (distance H1X4Y10 H1X4Y9) 1)
         (connected H1X4Y9 H1X4Y8) (= (distance H1X4Y9 H1X4Y8) 1)
         (connected H1X4Y8 H1X4Y7) (= (distance H1X4Y8 H1X4Y7) 1)
         (connected H1X4Y7 H2X2Y9) (= (distance H1X4Y7 H2X2Y9) 1)
         (connected H2X2Y9 H2X3Y9) (= (distance H2X2Y9 H2X3Y9) 1)
         (connected H2X3Y9 H3X1Y7) (= (distance H2X3Y9 H3X1Y7) 1)
         (connected H3X1Y7 H3X2Y4) (= (distance H3X1Y7 H3X2Y4) 1)
         (connected H3X2Y4 H0X4Y2) (= (distance H3X2Y4 H0X4Y2) 1)
         (connected H0X4Y2 H1X6Y4) (= (distance H0X4Y2 H1X6Y4) 1)
         (connected H1X6Y4 H1X6Y5) (= (distance H1X6Y4 H1X6Y5) 1)
         (connected H1X6Y5 H1X5Y8) (= (distance H1X6Y5 H1X5Y8) 1)
         (connected H1X5Y8 H1X4Y11) (= (distance H1X5Y8 H1X4Y11) 1)
         (connected H1X4Y11 H1X4Y10) (= (distance H1X4Y11 H1X4Y10) 1)
         (connected H1X4Y10 H1X4Y9) (= (distance H1X4Y10 H1X4Y9) 1)
         (connected H1X4Y9 H1X4Y8) (= (distance H1X4Y9 H1X4Y8) 1)
         (connected H1X4Y8 H1X4Y7) (= (distance H1X4Y8 H1X4Y7) 1)
         (connected H1X4Y7 H0X6Y9) (= (distance H1X4Y7 H0X6Y9) 1)
         (connected H0X6Y9 H0X7Y9) (= (distance H0X6Y9 H0X7Y9) 1)
         (connected H0X7Y9 H3X9Y7) (= (distance H0X7Y9 H3X9Y7) 1)
         (connected H3X9Y7 H2X7Y5) (= (distance H3X9Y7 H2X7Y5) 1)
         (connected H2X7Y5 H1X5Y7) (= (distance H2X7Y5 H1X5Y7) 1)
         (connected H1X5Y7 H1X5Y8) (= (distance H1X5Y7 H1X5Y8) 1)
         (connected H1X5Y8 H1X4Y11) (= (distance H1X5Y8 H1X4Y11) 1)
         (connected H1X4Y11 H1X4Y10) (= (distance H1X4Y11 H1X4Y10) 1)
         (connected H1X4Y10 H1X4Y9) (= (distance H1X4Y10 H1X4Y9) 1)
         (connected H1X4Y9 H1X4Y8) (= (distance H1X4Y9 H1X4Y8) 1)
         (connected H1X4Y8 H1X4Y7) (= (distance H1X4Y8 H1X4Y7) 1)
         (connected H1X4Y7 H2X2Y9) (= (distance H1X4Y7 H2X2Y9) 1)
         (connected H2X2Y9 H2X3Y9) (= (distance H2X2Y9 H2X3Y9) 1)
         (connected H2X3Y9 H3X1Y7) (= (distance H2X3Y9 H3X1Y7) 1)
         (connected H3X1Y7 H3X1Y8) (= (distance H3X1Y7 H3X1Y8) 1)
         (connected H3X1Y8 H3X1Y9) (= (distance H3X1Y8 H3X1Y9) 1)
         (connected H3X1Y9 H3X1Y10) (= (distance H3X1Y9 H3X1Y10) 1)
         (connected H3X1Y10 H3X1Y11) (= (distance H3X1Y10 H3X1Y11) 1)
         (connected H3X1Y11 H3X1Y12) (= (distance H3X1Y11 H3X1Y12) 1)
         (connected H3X1Y12 H3X1Y11) (= (distance H3X1Y12 H3X1Y11) 1)
         (connected H3X1Y11 H0X3Y9) (= (distance H3X1Y11 H0X3Y9) 1)
         (connected H0X3Y9 H0X2Y9) (= (distance H0X3Y9 H0X2Y9) 1)
         (connected H0X2Y9 H1X4Y11) (= (distance H0X2Y9 H1X4Y11) 1)
         (connected H1X4Y11 H1X4Y14) (= (distance H1X4Y11 H1X4Y14) 1)
         (connected H1X4Y14 H1X5Y17) (= (distance H1X4Y14 H1X5Y17) 1)
         (connected H1X5Y17 H1X5Y18) (= (distance H1X5Y17 H1X5Y18) 1)
         (connected H1X5Y18 H2X3Y20) (= (distance H1X5Y18 H2X3Y20) 1)
         (connected H2X3Y20 H2X4Y20) (= (distance H2X3Y20 H2X4Y20) 1)
         (connected H2X4Y20 H2X5Y20) (= (distance H2X4Y20 H2X5Y20) 1)
         (connected H2X5Y20 H2X6Y20) (= (distance H2X5Y20 H2X6Y20) 1)
         (connected H2X6Y20 H2X7Y20) (= (distance H2X6Y20 H2X7Y20) 1)
         (connected H2X7Y20 H2X4Y19) (= (distance H2X7Y20 H2X4Y19) 1)
         (connected H2X4Y19 H3X2Y17) (= (distance H2X4Y19 H3X2Y17) 1)
         (connected H3X2Y17 H3X1Y14) (= (distance H3X2Y17 H3X1Y14) 1)
         (connected H3X1Y14 H3X0Y11) (= (distance H3X1Y14 H3X0Y11) 1)
         (connected H3X0Y11 H0X2Y9) (= (distance H3X0Y11 H0X2Y9) 1)
         (connected H0X2Y9 H1X4Y11) (= (distance H0X2Y9 H1X4Y11) 1)
         (connected H1X4Y15 H1X4Y15) (= (distance H1X4Y15 H1X4Y15) 0)
         (connected H1X4Y15 H0X6Y17) (= (distance H1X4Y15 H0X6Y17) 1)
         (connected H0X6Y17 H0X9Y17) (= (distance H0X6Y17 H0X9Y17) 1)
         (connected H0X9Y17 H0X12Y17) (= (distance H0X9Y17 H0X12Y17) 1)
         (connected H0X12Y17 H0X11Y17) (= (distance H0X12Y17 H0X11Y17) 1)
         (connected H0X11Y17 H0X10Y17) (= (distance H0X11Y17 H0X10Y17) 1)
         (connected H0X10Y17 H0X9Y17) (= (distance H0X10Y17 H0X9Y17) 1)
         (connected H0X9Y17 H0X8Y17) (= (distance H0X9Y17 H0X8Y17) 1)
         (connected H0X8Y17 H0X7Y17) (= (distance H0X8Y17 H0X7Y17) 1)
         (connected H0X7Y17 H0X6Y17) (= (distance H0X7Y17 H0X6Y17) 1)
         (connected H0X6Y17 H0X5Y17) (= (distance H0X6Y17 H0X5Y17) 1)
         (connected H0X5Y17 H0X4Y17) (= (distance H0X5Y17 H0X4Y17) 1)
         (connected H0X4Y17 H3X6Y15) (= (distance H0X4Y17 H3X6Y15) 1)
         (connected H3X6Y15 H3X6Y12) (= (distance H3X6Y15 H3X6Y12) 1)
         (connected H3X6Y12 H3X6Y11) (= (distance H3X6Y12 H3X6Y11) 1)
         (connected H3X6Y11 H3X6Y10) (= (distance H3X6Y11 H3X6Y10) 1)
         (connected H3X6Y10 H2X4Y8) (= (distance H3X6Y10 H2X4Y8) 1)
         (connected H2X4Y8 H2X5Y8) (= (distance H2X4Y8 H2X5Y8) 1)
         (connected H2X5Y8 H2X6Y8) (= (distance H2X5Y8 H2X6Y8) 1)
         (connected H2X6Y8 H1X4Y10) (= (distance H2X6Y8 H1X4Y10) 1)
         (connected H1X4Y10 H1X4Y11) (= (distance H1X4Y10 H1X4Y11) 1)
         (connected H1X4Y11 H1X4Y12) (= (distance H1X4Y11 H1X4Y12) 1)
         (connected H1X4Y12 H1X4Y15) (= (distance H1X4Y12 H1X4Y15) 1)
         (connected H1X4Y15 H1X4Y14) (= (distance H1X4Y15 H1X4Y14) 1)
         (connected H1X4Y14 H1X4Y13) (= (distance H1X4Y14 H1X4Y13) 1)
         (connected H1X4Y13 H1X4Y12) (= (distance H1X4Y13 H1X4Y12) 1)
         (connected H1X4Y12 H1X4Y11) (= (distance H1X4Y12 H1X4Y11) 1)
         (connected H1X4Y11 H1X4Y10) (= (distance H1X4Y11 H1X4Y10) 1)
         (connected H1X4Y10 H1X4Y9) (= (distance H1X4Y10 H1X4Y9) 1)
         (connected H1X4Y9 H1X4Y8) (= (distance H1X4Y9 H1X4Y8) 1)
         (connected H1X4Y8 H1X4Y7) (= (distance H1X4Y8 H1X4Y7) 1)
         (connected H1X4Y7 H2X2Y9) (= (distance H1X4Y7 H2X2Y9) 1)
         (connected H2X2Y9 H2X3Y9) (= (distance H2X2Y9 H2X3Y9) 1)
         (connected H2X3Y9 H3X1Y7) (= (distance H2X3Y9 H3X1Y7) 1)
         (connected H3X1Y7 H3X2Y4) (= (distance H3X1Y7 H3X2Y4) 1)
         (connected H3X2Y4 H0X4Y2) (= (distance H3X2Y4 H0X4Y2) 1)
         (connected H0X4Y2 H1X6Y4) (= (distance H0X4Y2 H1X6Y4) 1)
         (connected H1X6Y4 H1X6Y5) (= (distance H1X6Y4 H1X6Y5) 1)
         (connected H1X6Y5 H1X6Y6) (= (distance H1X6Y5 H1X6Y6) 1)
         (connected H1X6Y6 H1X6Y9) (= (distance H1X6Y6 H1X6Y9) 1)
         (connected H1X6Y9 H1X5Y12) (= (distance H1X6Y9 H1X5Y12) 1)
         (connected H1X5Y12 H1X4Y15) (= (distance H1X5Y12 H1X4Y15) 1)
         (connected H1X4Y15 H1X4Y14) (= (distance H1X4Y15 H1X4Y14) 1)
         (connected H1X4Y14 H1X4Y13) (= (distance H1X4Y14 H1X4Y13) 1)
         (connected H1X4Y13 H1X4Y12) (= (distance H1X4Y13 H1X4Y12) 1)
         (connected H1X4Y12 H1X4Y11) (= (distance H1X4Y12 H1X4Y11) 1)
         (connected H1X4Y11 H1X4Y10) (= (distance H1X4Y11 H1X4Y10) 1)
         (connected H1X4Y10 H1X4Y9) (= (distance H1X4Y10 H1X4Y9) 1)
         (connected H1X4Y9 H1X4Y8) (= (distance H1X4Y9 H1X4Y8) 1)
         (connected H1X4Y8 H1X4Y7) (= (distance H1X4Y8 H1X4Y7) 1)
         (connected H1X4Y7 H0X6Y9) (= (distance H1X4Y7 H0X6Y9) 1)
         (connected H0X6Y9 H0X7Y9) (= (distance H0X6Y9 H0X7Y9) 1)
         (connected H0X7Y9 H3X9Y7) (= (distance H0X7Y9 H3X9Y7) 1)
         (connected H3X9Y7 H2X7Y5) (= (distance H3X9Y7 H2X7Y5) 1)
         (connected H2X7Y5 H1X5Y7) (= (distance H2X7Y5 H1X5Y7) 1)
         (connected H1X5Y7 H1X5Y8) (= (distance H1X5Y7 H1X5Y8) 1)
         (connected H1X5Y8 H1X5Y9) (= (distance H1X5Y8 H1X5Y9) 1)
         (connected H1X5Y9 H1X4Y12) (= (distance H1X5Y9 H1X4Y12) 1)
         (connected H1X4Y12 H1X4Y15) (= (distance H1X4Y12 H1X4Y15) 1)
         (connected H1X4Y15 H1X4Y16) (= (distance H1X4Y15 H1X4Y16) 1)
         (connected H1X4Y16 H1X4Y17) (= (distance H1X4Y16 H1X4Y17) 1)
         (connected H1X4Y17 H2X2Y19) (= (distance H1X4Y17 H2X2Y19) 1)
         (connected H2X2Y19 H3X0Y17) (= (distance H2X2Y19 H3X0Y17) 1)
         (connected H3X0Y17 H3X0Y16) (= (distance H3X0Y17 H3X0Y16) 1)
         (connected H3X0Y16 H3X0Y15) (= (distance H3X0Y16 H3X0Y15) 1)
         (connected H3X0Y15 H3X1Y12) (= (distance H3X0Y15 H3X1Y12) 1)
         (connected H3X1Y12 H3X1Y11) (= (distance H3X1Y12 H3X1Y11) 1)
         (connected H3X1Y11 H0X3Y9) (= (distance H3X1Y11 H0X3Y9) 1)
         (connected H0X3Y9 H1X5Y11) (= (distance H0X3Y9 H1X5Y11) 1)
         (connected H1X5Y11 H1X5Y12) (= (distance H1X5Y11 H1X5Y12) 1)
         (connected H1X5Y12 H1X4Y15) (= (distance H1X5Y12 H1X4Y15) 1)
         (connected H1X4Y15 H1X5Y18) (= (distance H1X4Y15 H1X5Y18) 1)
         (connected H1X5Y18 H2X3Y20) (= (distance H1X5Y18 H2X3Y20) 1)
         (connected H2X3Y20 H2X4Y20) (= (distance H2X3Y20 H2X4Y20) 1)
         (connected H2X4Y20 H2X5Y20) (= (distance H2X4Y20 H2X5Y20) 1)
         (connected H2X5Y20 H2X6Y20) (= (distance H2X5Y20 H2X6Y20) 1)
         (connected H2X6Y20 H2X7Y20) (= (distance H2X6Y20 H2X7Y20) 1)
         (connected H2X7Y20 H2X4Y19) (= (distance H2X7Y20 H2X4Y19) 1)
         (connected H2X4Y19 H3X2Y17) (= (distance H2X4Y19 H3X2Y17) 1)
         (connected H3X2Y17 H3X1Y14) (= (distance H3X2Y17 H3X1Y14) 1)
         (connected H3X1Y14 H3X1Y11) (= (distance H3X1Y14 H3X1Y11) 1)
         (connected H3X1Y11 H0X3Y9) (= (distance H3X1Y11 H0X3Y9) 1)
         (connected H0X3Y9 H1X5Y11) (= (distance H0X3Y9 H1X5Y11) 1)
         (connected H1X5Y11 H1X5Y12) (= (distance H1X5Y11 H1X5Y12) 1)
         (connected H1X5Y12 H1X4Y15) (= (distance H1X5Y12 H1X4Y15) 1)
         (connected H0X12Y17 H0X12Y17) (= (distance H0X12Y17 H0X12Y17) 0)
         (connected H0X12Y17 H0X11Y17) (= (distance H0X12Y17 H0X11Y17) 1)
         (connected H0X11Y17 H0X10Y17) (= (distance H0X11Y17 H0X10Y17) 1)
         (connected H0X10Y17 H0X9Y17) (= (distance H0X10Y17 H0X9Y17) 1)
         (connected H0X9Y17 H0X8Y17) (= (distance H0X9Y17 H0X8Y17) 1)
         (connected H0X8Y17 H0X7Y17) (= (distance H0X8Y17 H0X7Y17) 1)
         (connected H0X7Y17 H0X6Y17) (= (distance H0X7Y17 H0X6Y17) 1)
         (connected H0X6Y17 H0X5Y17) (= (distance H0X6Y17 H0X5Y17) 1)
         (connected H0X5Y17 H0X4Y17) (= (distance H0X5Y17 H0X4Y17) 1)
         (connected H0X4Y17 H3X6Y15) (= (distance H0X4Y17 H3X6Y15) 1)
         (connected H3X6Y15 H3X6Y12) (= (distance H3X6Y15 H3X6Y12) 1)
         (connected H3X6Y12 H3X6Y11) (= (distance H3X6Y12 H3X6Y11) 1)
         (connected H3X6Y11 H3X6Y8) (= (distance H3X6Y11 H3X6Y8) 1)
         (connected H3X6Y8 H2X4Y6) (= (distance H3X6Y8 H2X4Y6) 1)
         (connected H2X4Y6 H3X2Y4) (= (distance H2X4Y6 H3X2Y4) 1)
         (connected H3X2Y4 H0X4Y2) (= (distance H3X2Y4 H0X4Y2) 1)
         (connected H0X4Y2 H1X6Y4) (= (distance H0X4Y2 H1X6Y4) 1)
         (connected H1X6Y4 H1X6Y5) (= (distance H1X6Y4 H1X6Y5) 1)
         (connected H1X6Y5 H1X6Y6) (= (distance H1X6Y5 H1X6Y6) 1)
         (connected H1X6Y6 H1X6Y9) (= (distance H1X6Y6 H1X6Y9) 1)
         (connected H1X6Y9 H1X5Y12) (= (distance H1X6Y9 H1X5Y12) 1)
         (connected H1X5Y12 H1X4Y15) (= (distance H1X5Y12 H1X4Y15) 1)
         (connected H1X4Y15 H0X6Y17) (= (distance H1X4Y15 H0X6Y17) 1)
         (connected H0X6Y17 H0X9Y17) (= (distance H0X6Y17 H0X9Y17) 1)
         (connected H0X9Y17 H0X12Y17) (= (distance H0X9Y17 H0X12Y17) 1)
         (connected H0X12Y17 H0X11Y17) (= (distance H0X12Y17 H0X11Y17) 1)
         (connected H0X11Y17 H0X10Y17) (= (distance H0X11Y17 H0X10Y17) 1)
         (connected H0X10Y17 H0X9Y17) (= (distance H0X10Y17 H0X9Y17) 1)
         (connected H0X9Y17 H0X8Y17) (= (distance H0X9Y17 H0X8Y17) 1)
         (connected H0X8Y17 H0X7Y17) (= (distance H0X8Y17 H0X7Y17) 1)
         (connected H0X7Y17 H0X6Y17) (= (distance H0X7Y17 H0X6Y17) 1)
         (connected H0X6Y17 H0X5Y17) (= (distance H0X6Y17 H0X5Y17) 1)
         (connected H0X5Y17 H0X4Y17) (= (distance H0X5Y17 H0X4Y17) 1)
         (connected H0X4Y17 H3X6Y15) (= (distance H0X4Y17 H3X6Y15) 1)
         (connected H3X6Y15 H3X6Y12) (= (distance H3X6Y15 H3X6Y12) 1)
         (connected H3X6Y12 H3X6Y11) (= (distance H3X6Y12 H3X6Y11) 1)
         (connected H3X6Y11 H3X6Y10) (= (distance H3X6Y11 H3X6Y10) 1)
         (connected H3X6Y10 H3X6Y7) (= (distance H3X6Y10 H3X6Y7) 1)
         (connected H3X6Y7 H2X4Y5) (= (distance H3X6Y7 H2X4Y5) 1)
         (connected H2X4Y5 H2X5Y5) (= (distance H2X4Y5 H2X5Y5) 1)
         (connected H2X5Y5 H2X6Y5) (= (distance H2X5Y5 H2X6Y5) 1)
         (connected H2X6Y5 H2X7Y5) (= (distance H2X6Y5 H2X7Y5) 1)
         (connected H2X7Y5 H1X5Y7) (= (distance H2X7Y5 H1X5Y7) 1)
         (connected H1X5Y7 H1X5Y8) (= (distance H1X5Y7 H1X5Y8) 1)
         (connected H1X5Y8 H1X5Y9) (= (distance H1X5Y8 H1X5Y9) 1)
         (connected H1X5Y9 H1X4Y12) (= (distance H1X5Y9 H1X4Y12) 1)
         (connected H1X4Y12 H1X4Y15) (= (distance H1X4Y12 H1X4Y15) 1)
         (connected H1X4Y15 H0X6Y17) (= (distance H1X4Y15 H0X6Y17) 1)
         (connected H0X6Y17 H0X9Y17) (= (distance H0X6Y17 H0X9Y17) 1)
         (connected H0X9Y17 H0X12Y17) (= (distance H0X9Y17 H0X12Y17) 1)
         (connected H0X12Y17 H1X14Y19) (= (distance H0X12Y17 H1X14Y19) 1)
         (connected H1X14Y19 H1X14Y18) (= (distance H1X14Y19 H1X14Y18) 1)
         (connected H1X14Y18 H2X12Y20) (= (distance H1X14Y18 H2X12Y20) 1)
         (connected H2X12Y20 H2X11Y20) (= (distance H2X12Y20 H2X11Y20) 1)
         (connected H2X11Y20 H2X10Y20) (= (distance H2X11Y20 H2X10Y20) 1)
         (connected H2X10Y20 H2X7Y20) (= (distance H2X10Y20 H2X7Y20) 1)
         (connected H2X7Y20 H2X4Y19) (= (distance H2X7Y20 H2X4Y19) 1)
         (connected H2X4Y19 H3X2Y17) (= (distance H2X4Y19 H3X2Y17) 1)
         (connected H3X2Y17 H3X2Y16) (= (distance H3X2Y17 H3X2Y16) 1)
         (connected H3X2Y16 H3X1Y13) (= (distance H3X2Y16 H3X1Y13) 1)
         (connected H3X1Y13 H3X1Y12) (= (distance H3X1Y13 H3X1Y12) 1)
         (connected H3X1Y12 H3X1Y11) (= (distance H3X1Y12 H3X1Y11) 1)
         (connected H3X1Y11 H0X3Y9) (= (distance H3X1Y11 H0X3Y9) 1)
         (connected H0X3Y9 H1X5Y11) (= (distance H0X3Y9 H1X5Y11) 1)
         (connected H1X5Y11 H1X5Y12) (= (distance H1X5Y11 H1X5Y12) 1)
         (connected H1X5Y12 H1X4Y15) (= (distance H1X5Y12 H1X4Y15) 1)
         (connected H1X4Y15 H0X6Y17) (= (distance H1X4Y15 H0X6Y17) 1)
         (connected H0X6Y17 H0X9Y17) (= (distance H0X6Y17 H0X9Y17) 1)
         (connected H0X9Y17 H0X12Y17) (= (distance H0X9Y17 H0X12Y17) 1)
         (connected H0X12Y17 H1X14Y19) (= (distance H0X12Y17 H1X14Y19) 1)
         (connected H1X14Y19 H1X14Y18) (= (distance H1X14Y19 H1X14Y18) 1)
         (connected H1X14Y18 H2X12Y20) (= (distance H1X14Y18 H2X12Y20) 1)
         (connected H2X12Y20 H2X11Y20) (= (distance H2X12Y20 H2X11Y20) 1)
         (connected H2X11Y20 H2X10Y20) (= (distance H2X11Y20 H2X10Y20) 1)
         (connected H2X10Y20 H2X7Y20) (= (distance H2X10Y20 H2X7Y20) 1)
         (connected H2X7Y20 H2X6Y20) (= (distance H2X7Y20 H2X6Y20) 1)
         (connected H2X6Y20 H2X5Y20) (= (distance H2X6Y20 H2X5Y20) 1)
         (connected H2X5Y20 H3X3Y18) (= (distance H2X5Y20 H3X3Y18) 1)
         (connected H3X3Y18 H0X5Y16) (= (distance H3X3Y18 H0X5Y16) 1)
         (connected H0X5Y16 H0X8Y17) (= (distance H0X5Y16 H0X8Y17) 1)
         (connected H0X8Y17 H0X9Y17) (= (distance H0X8Y17 H0X9Y17) 1)
         (connected H0X9Y17 H0X12Y17) (= (distance H0X9Y17 H0X12Y17) 1)
         (connected H3X2Y4 H3X2Y4) (= (distance H3X2Y4 H3X2Y4) 0)
         (connected H3X2Y4 H0X4Y2) (= (distance H3X2Y4 H0X4Y2) 1)
         (connected H0X4Y2 H0X7Y1) (= (distance H0X4Y2 H0X7Y1) 1)
         (connected H0X7Y1 H1X9Y3) (= (distance H0X7Y1 H1X9Y3) 1)
         (connected H1X9Y3 H2X7Y5) (= (distance H1X9Y3 H2X7Y5) 1)
         (connected H2X7Y5 H2X4Y6) (= (distance H2X7Y5 H2X4Y6) 1)
         (connected H2X4Y6 H3X2Y4) (= (distance H2X4Y6 H3X2Y4) 1)
         (connected H3X2Y4 H3X2Y5) (= (distance H3X2Y4 H3X2Y5) 1)
         (connected H3X2Y5 H3X1Y2) (= (distance H3X2Y5 H3X1Y2) 1)
         (connected H3X1Y2 H3X1Y3) (= (distance H3X1Y2 H3X1Y3) 1)
         (connected H3X1Y3 H3X1Y4) (= (distance H3X1Y3 H3X1Y4) 1)
         (connected H3X1Y4 H3X1Y5) (= (distance H3X1Y4 H3X1Y5) 1)
         (connected H3X1Y5 H3X1Y6) (= (distance H3X1Y5 H3X1Y6) 1)
         (connected H3X1Y6 H3X1Y7) (= (distance H3X1Y6 H3X1Y7) 1)
         (connected H3X1Y7 H3X1Y8) (= (distance H3X1Y7 H3X1Y8) 1)
         (connected H3X1Y8 H3X1Y9) (= (distance H3X1Y8 H3X1Y9) 1)
         (connected H3X1Y9 H3X1Y10) (= (distance H3X1Y9 H3X1Y10) 1)
         (connected H3X1Y10 H3X1Y11) (= (distance H3X1Y10 H3X1Y11) 1)
         (connected H3X1Y11 H3X1Y12) (= (distance H3X1Y11 H3X1Y12) 1)
         (connected H3X1Y12 H3X1Y11) (= (distance H3X1Y12 H3X1Y11) 1)
         (connected H3X1Y11 H3X1Y10) (= (distance H3X1Y11 H3X1Y10) 1)
         (connected H3X1Y10 H3X1Y7) (= (distance H3X1Y10 H3X1Y7) 1)
         (connected H3X1Y7 H3X2Y4) (= (distance H3X1Y7 H3X2Y4) 1)
         (connected H3X2Y4 H0X4Y2) (= (distance H3X2Y4 H0X4Y2) 1)
         (connected H0X4Y2 H1X6Y4) (= (distance H0X4Y2 H1X6Y4) 1)
         (connected H1X6Y4 H1X6Y5) (= (distance H1X6Y4 H1X6Y5) 1)
         (connected H1X6Y5 H1X6Y6) (= (distance H1X6Y5 H1X6Y6) 1)
         (connected H1X6Y6 H1X6Y9) (= (distance H1X6Y6 H1X6Y9) 1)
         (connected H1X6Y9 H1X5Y12) (= (distance H1X6Y9 H1X5Y12) 1)
         (connected H1X5Y12 H1X5Y15) (= (distance H1X5Y12 H1X5Y15) 1)
         (connected H1X5Y15 H1X5Y18) (= (distance H1X5Y15 H1X5Y18) 1)
         (connected H1X5Y18 H2X3Y20) (= (distance H1X5Y18 H2X3Y20) 1)
         (connected H2X3Y20 H2X4Y20) (= (distance H2X3Y20 H2X4Y20) 1)
         (connected H2X4Y20 H2X5Y20) (= (distance H2X4Y20 H2X5Y20) 1)
         (connected H2X5Y20 H2X6Y20) (= (distance H2X5Y20 H2X6Y20) 1)
         (connected H2X6Y20 H2X7Y20) (= (distance H2X6Y20 H2X7Y20) 1)
         (connected H2X7Y20 H2X4Y19) (= (distance H2X7Y20 H2X4Y19) 1)
         (connected H2X4Y19 H3X2Y17) (= (distance H2X4Y19 H3X2Y17) 1)
         (connected H3X2Y17 H3X2Y16) (= (distance H3X2Y17 H3X2Y16) 1)
         (connected H3X2Y16 H3X1Y13) (= (distance H3X2Y16 H3X1Y13) 1)
         (connected H3X1Y13 H3X1Y10) (= (distance H3X1Y13 H3X1Y10) 1)
         (connected H3X1Y10 H3X2Y7) (= (distance H3X1Y10 H3X2Y7) 1)
         (connected H3X2Y7 H3X2Y4) (= (distance H3X2Y7 H3X2Y4) 1)
         (connected H2X7Y5 H2X7Y5) (= (distance H2X7Y5 H2X7Y5) 0)
         (connected H2X7Y5 H1X5Y7) (= (distance H2X7Y5 H1X5Y7) 1)
         (connected H1X5Y7 H2X3Y9) (= (distance H1X5Y7 H2X3Y9) 1)
         (connected H2X3Y9 H3X1Y7) (= (distance H2X3Y9 H3X1Y7) 1)
         (connected H3X1Y7 H3X1Y8) (= (distance H3X1Y7 H3X1Y8) 1)
         (connected H3X1Y8 H3X1Y9) (= (distance H3X1Y8 H3X1Y9) 1)
         (connected H3X1Y9 H3X1Y10) (= (distance H3X1Y9 H3X1Y10) 1)
         (connected H3X1Y10 H3X1Y11) (= (distance H3X1Y10 H3X1Y11) 1)
         (connected H3X1Y11 H3X1Y12) (= (distance H3X1Y11 H3X1Y12) 1)
         (connected H3X1Y12 H3X1Y11) (= (distance H3X1Y12 H3X1Y11) 1)
         (connected H3X1Y11 H0X3Y9) (= (distance H3X1Y11 H0X3Y9) 1)
         (connected H0X3Y9 H0X4Y9) (= (distance H0X3Y9 H0X4Y9) 1)
         (connected H0X4Y9 H0X7Y9) (= (distance H0X4Y9 H0X7Y9) 1)
         (connected H0X7Y9 H3X9Y7) (= (distance H0X7Y9 H3X9Y7) 1)
         (connected H3X9Y7 H2X7Y5) (= (distance H3X9Y7 H2X7Y5) 1)
         (connected H2X7Y5 H1X5Y7) (= (distance H2X7Y5 H1X5Y7) 1)
         (connected H1X5Y7 H1X5Y8) (= (distance H1X5Y7 H1X5Y8) 1)
         (connected H1X5Y8 H1X5Y9) (= (distance H1X5Y8 H1X5Y9) 1)
         (connected H1X5Y9 H1X5Y12) (= (distance H1X5Y9 H1X5Y12) 1)
         (connected H1X5Y12 H1X5Y15) (= (distance H1X5Y12 H1X5Y15) 1)
         (connected H1X5Y15 H1X5Y18) (= (distance H1X5Y15 H1X5Y18) 1)
         (connected H1X5Y18 H2X3Y20) (= (distance H1X5Y18 H2X3Y20) 1)
         (connected H2X3Y20 H2X4Y20) (= (distance H2X3Y20 H2X4Y20) 1)
         (connected H2X4Y20 H2X5Y20) (= (distance H2X4Y20 H2X5Y20) 1)
         (connected H2X5Y20 H2X6Y20) (= (distance H2X5Y20 H2X6Y20) 1)
         (connected H2X6Y20 H2X7Y20) (= (distance H2X6Y20 H2X7Y20) 1)
         (connected H2X7Y20 H2X4Y20) (= (distance H2X7Y20 H2X4Y20) 1)
         (connected H2X4Y20 H3X2Y18) (= (distance H2X4Y20 H3X2Y18) 1)
         (connected H3X2Y18 H0X4Y16) (= (distance H3X2Y18 H0X4Y16) 1)
         (connected H0X4Y16 H3X6Y14) (= (distance H0X4Y16 H3X6Y14) 1)
         (connected H3X6Y14 H3X6Y13) (= (distance H3X6Y14 H3X6Y13) 1)
         (connected H3X6Y13 H3X6Y10) (= (distance H3X6Y13 H3X6Y10) 1)
         (connected H3X6Y10 H3X6Y7) (= (distance H3X6Y10 H3X6Y7) 1)
         (connected H3X6Y7 H2X4Y5) (= (distance H3X6Y7 H2X4Y5) 1)
         (connected H2X4Y5 H2X5Y5) (= (distance H2X4Y5 H2X5Y5) 1)
         (connected H2X5Y5 H2X6Y5) (= (distance H2X5Y5 H2X6Y5) 1)
         (connected H2X6Y5 H2X7Y5) (= (distance H2X6Y5 H2X7Y5) 1)
         (connected H3X1Y12 H3X1Y12) (= (distance H3X1Y12 H3X1Y12) 0)
         (connected H3X1Y12 H3X1Y11) (= (distance H3X1Y12 H3X1Y11) 1)
         (connected H3X1Y11 H0X3Y9) (= (distance H3X1Y11 H0X3Y9) 1)
         (connected H0X3Y9 H1X5Y11) (= (distance H0X3Y9 H1X5Y11) 1)
         (connected H1X5Y11 H1X5Y12) (= (distance H1X5Y11 H1X5Y12) 1)
         (connected H1X5Y12 H1X5Y15) (= (distance H1X5Y12 H1X5Y15) 1)
         (connected H1X5Y15 H1X5Y18) (= (distance H1X5Y15 H1X5Y18) 1)
         (connected H1X5Y18 H2X3Y20) (= (distance H1X5Y18 H2X3Y20) 1)
         (connected H2X3Y20 H2X4Y20) (= (distance H2X3Y20 H2X4Y20) 1)
         (connected H2X4Y20 H2X5Y20) (= (distance H2X4Y20 H2X5Y20) 1)
         (connected H2X5Y20 H2X6Y20) (= (distance H2X5Y20 H2X6Y20) 1)
         (connected H2X6Y20 H2X7Y20) (= (distance H2X6Y20 H2X7Y20) 1)
         (connected H2X7Y20 H2X4Y19) (= (distance H2X7Y20 H2X4Y19) 1)
         (connected H2X4Y19 H3X2Y17) (= (distance H2X4Y19 H3X2Y17) 1)
         (connected H3X2Y17 H3X2Y16) (= (distance H3X2Y17 H3X2Y16) 1)
         (connected H3X2Y16 H3X1Y13) (= (distance H3X2Y16 H3X1Y13) 1)
         (connected H3X1Y13 H3X1Y12) (= (distance H3X1Y13 H3X1Y12) 1)
         (connected H2X7Y20 H2X7Y20) (= (distance H2X7Y20 H2X7Y20) 0)
  )
  (:goal (and (at p0 H2X7Y5) (at p1 H3X2Y4) (at p2 H1X9Y5) (at p3 H1X4Y11) )
    )
  (:metric minimize (total-cost))
)