//Circuito RL passa-baixa
R = 20;
L = 0.1;
f = logspace(-2,6,1e6);
mod_H = 1./((1+(2*%pi*f*L*(1/R)).^2).^0.5);
ang_H = (180/%pi)*(-atan(2*%pi*f*L*(1/R)));
scf(2); clf(2);
subplot(2,1,1)
plot('ln',f,mod_H,'b-','LineWidth',3)
set(gca(),'font_size',4)
xlabel "$f (Hz)$" fontsize 5
ylabel "$f|H(jw)|$" fontsize 5
subplot(2,1,2)
plot('ln',f,ang_H,'b-','LineWidth',3)
set(gca(),'font_size',4)
xlabel "$f (Hz)$" fontsize 5
ylabel "$Fase[H(jw)] (º)$" fontsize 5
