// circuito RC passa-faixa
R1=1000;R2=220;C1=1e-6;C2=1e-6;
fc1=1/(2*%pi*R1*C1);
fc2=1/(2*%pi*R2*C2);
f = logspace (0,5,1e4);
mod_H1 = 1./((1+(fc1./f).^2).^0.5);
mod_H2 = 1./((1+(f./fc2).^2).^0.5);
mod_H=mod_H1.*mod_H1.*mod_H2;
ang_H1 = (180/%pi)*(atan(fc1./f));
ang_H2 =-(180/%pi)*(atan(f./fc2));
ang_H = ang_H1+ang_H2;
scf(2); clf (2);
subplot(2,1,1)
plot('ln',f,mod_H1,'r--','LineWidth',3)
plot('ln',f,mod_H2,'b--','LineWidth',3)
plot('In',f,mod_H,'k-','LineWidth',3)
//plot('ln',f,mod_H,'k-','LineWidth’,3)
plot('ln',f,1/sqrt(2)*f./f,'k--','LineWidth',1)
xlabel "$f (Hz)$" fontsize 5
ylabel "$módulo$" fontsize 5
legend (['H1(jw)';'H2(jw)';'H(jw)'],-1);
set(gca (),'font_size',3)
subplot(2,1,2)
plot('ln',f,ang_H1,'r--','LineWidth',3)
plot('ln',f,ang_H2,'b--','LineWidth',3)
plot('ln',f,ang_H,'k-','LineWidth',3)
xlabel "$f (Hz)$" fontsize 5
ylabel "$Fase(º)$" fontsize 5
legend (['<H1(jw)';'<H2(jw)';'<H(jw)'],-1);
set(gca (),'font_size',3)
