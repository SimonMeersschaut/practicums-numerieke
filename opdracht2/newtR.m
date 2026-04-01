function itsol = newtR(f, derf, tol, maxiter, x0)
% f is een function-handle voor een functie f:R -> R
% derf is een function-handle voor de afgeleide van f,
% i.e. derf: R -> R
% tol is de tolerantie. Het gebruikte stopcriterium is [aan te vullen]
% maxiter is het maximaal aantal iteraties dat wordt berekend. Zo blijft je
% algoritme niet eeuwig lopen.
% x0 is het startpunt van de Newton-Raphson iteratie
% itsol is een horizontale vector die alle iteratiepunten bevat, i.e. kolom k bevat
% iteratiepunt xk, en itsol(end) is het resultaat van de iteratie.
xk = x0;
itsol = [x0, 0];
for i=1:maxiter
    xk = xk - (f(xk)/derf(xk));
    itsol(i+1) = xk;
    if abs(itsol(i+1) - itsol(i)) < tol
        break;
    end
end