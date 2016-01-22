aprox: main.o splines.o points.o chebyshev_approx.o gaus/libge.a
	$(CC) -o aprox  main.o splines.o points.o chebyshev_approx.o -L gaus -l ge

intrp: main.o splines.o points.o interpolator.o gaus/libge.a
	$(CC) -o intrp  main.o splines.o points.o interpolator.o -L gaus -l ge

prosta: main.o splines.o points.o prosta.o
	$(CC) -o prosta  main.o splines.o points.o prosta.o	

chebyshev_approx.o: makespl.h points.h gaus/piv_ge_solver.h
	$(CC) -I gaus -c chebyshev_approx.c

interpolator.o: makespl.h points.h gaus/piv_ge_solver.h
	$(CC) -I gaus -c interpolator.c

.PHONY: clean

clean:
	-rm *.o aprox intrp prosta spl.* myplot*

tests:
	./aprox -s spl.1 -p test/dane.1.-4.1 -g myplot1 -f -5 -t 1 -n 100
	./aprox -s spl.2 -p test/dane.2.5.7 -g myplot2 -f 2 -t 5 -n 300
	./aprox -s spl.3 -p test/dane.3.0.5 -g myplot3 -f 1 -t 5.7 -n 500
	./aprox -s spl.4 -p test/dane.4.-9.10 -g myplot4 -f -9 -t 9 -n 10
	./aprox -s spl.5 -p test/dane.5.0.1 -g myplot5 -f -1 -t 2 -n 100
	./aprox -s spl.6 -p test/dane.6.1.11 -g myplot6 -f 1.1 -t 11.1 -n 150
	./aprox -s spl7 -p test/dane.7.10.1000 -g myplot7 -f 0 -t 100 -n 888
	./aprox -s spl8 -p test/dane.8.5.5.1 -g myplot8 -f 5.1 -t 5.7 -n 300
	./aprox -s spl9 -p test/dane.9.1.99 -g myplot9 -f 0 -t 109 -n 1000
