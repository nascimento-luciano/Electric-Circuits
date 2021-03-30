R=20;L=0.1;
fc=R/(2*%pi*L);
f = logspace(-2,4,1e4);
mod_H = 1./((1+(f./fc).^2).^0.5);
mod_H_db=20*log10(mod_H) 
ang_H = (180/%pi)*(atan(f./fc));
scf(6); clf(6);
subplot(2,1,1)
//plot('ln',f,mod_H,'k-','LineWidth',3)
plot('ln',f,mod_H_db,'k-','LineWidth',3)
plot('ln',f,1/sqrt(2)*f./f,'k--','LineWidth',1)
xlabel "$f (Hz)$" fontsize 5
//ylabel "$módulo$" fontsize 5
ylabel "$módulo_{dB}$" fontsize 5
legend(['H(jw)'],-1);
set(gca(),'font_size',3)
subplot(2,1,2)
plot('ln',f,ang_H,'k-','LineWidth',3)
xlabel "$f (Hz)$" fontsize 5
ylabel "$Fase(º)$" fontsize 5
legend(['<H(jw)'],-1);
set(gca(),'font_size',3)
