// circuito RL passa-faixa em dB
R1=1000;R2=220;L1=1e-3;L2=1e-3;
fc1=R1/(2*%pi*L1);
fc2=R2/(2*%pi*L2);
f = logspace(1,10,1e4);
mod_H1=1./((1+(fc1./f).^2).^0.5);
mod_H2=1./((1+(f./fc2).^2).^0.5);
mod_H=mod_H1.*mod_H2;
ang_H1=(180/%pi)*(atan(fc1./f));
ang_H2=-(180/%pi)*(atan(f./fc2));
ang_H=ang_H1+ang_H2;
scf(3); clf(3);
subplot(2,1,1)
plot('ln',f,20*log10(mod_H1),'r--','LineWidth',3)
plot('ln',f,20*log10(mod_H2),'b--','LineWidth',3)
plot('ln',f,20*log10(mod_H),'k-','LineWidth',3)
plot('ln',f,20*log10(1/sqrt(2)*f./f),'k--','LineWidth',1)
xlabel "$f(Hz)$" fontsize 5
ylabel "$módulo_{dB}$" fontsize 5
legend(['H1(jw)';'H2(jw)';'H(jw)'],-1);
set(gca (),'font_size',3)
subplot(2,1,2)
plot('ln',f,ang_H1,'r--','LineWidth',3)
plot('ln',f,ang_H2,'b--','LineWidth',3)
plot('ln',f,ang_H,'k-','LineWidth',3)
xlabel "$f(Hz)$" fontsize 5
ylabel "$Fase(º)$" fontsize 5
legend(['<H1(jw)';'<H2(jw)';'<H(jw)'],-1);
set(gca (),'font_size',3)
