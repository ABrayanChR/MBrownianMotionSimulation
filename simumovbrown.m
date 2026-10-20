% SIMULACIÓN DE MOVIMIENTO BROWNIANO
clc, clear
% Esta simulación muestra el movimiento de una partícula grande en un
% fluido de moléculas de órdenes de magnitud menores a la partícula de
% estudio. Se estudiará la cinemática de la partícula grande mediante
% las ecuaciones del movimiento browniano proporcionadas por Langevin
% en 1908.
% Esta simulación será en 2 dimensiones, con los ejes X e Y, y será
% hardcode, es decir, para un caso concreto con el objetivo de
% mostrar los casos generales
% Definimos los valores iniciales de la simulación y daremos un número
% de segundos a simular.
secs = 5;
tick = 0.1; % Tiempo entre eventos
slowmo = 0.01; % Cuánto porciento se quiere ralentizar la simulación (100 es
% a tiempo real)
dots = secs/tick;
rangeOfVision = [-100 100 -100 100]; % Define el tamaño a ver de los ejes
d = 2; % Dimensiones de la caja cuadrada
to = 0;
xo = 0;
yo = 0;
voax = 100;
voay = 100;
vob = 0;
b = 1;
m = 1; % La masa de una partícula de polen 2,5*10^-10 kg

% Damos los valores mínimos y máximos de las fuerzas que se le pueden
% ejercer a la partícula.
fbMax = 50;
fbMin = 20;
% Según la ecuación de Langevin:
% mdv/dt = -bv + Fb(t)
% Ahora deberemos de calcular las posiciones de la partícula según la
% ecuación
% Para el PROBLEMA A tendremos

posxa = zeros(dots);
posya = zeros(dots);

for i = 1:dots
    posxa(i) = xo - voax*(m/b)*(exp((-b*i*tick)/m)-1);
    posya(i) = yo - voay*(m/b)*(exp((-b*i*tick)/m)-1);
end

%Para el PROBLEMA B:
%Almaceno los valores a obtener en vectores de la longitud de las
%iteraciones a hacer.

posxb = zeros(dots);
posyb = zeros(dots);
vxb = zeros(dots);
vyb = zeros(dots);
vxb(1) = vob;
vyb(1) = vob;
fbx = fbMin + (fbMax-fbMin).*rand(1,dots);
fby = fbMin + (fbMax-fbMin).*rand(1,dots);

for i= 1:dots
    aux = rand(1);
    if aux<=0.5
        fbx(i) = -1*fbx(i);
    end
    aux = rand(1);
    if aux<=0.5
        fby(i) = -1*fby(i);
    end
end

for j = 1 : dots - 1
    vxb(j + 1) = (1 - (b/m)*tick)*vxb(j) + (fbx(j)*tick/m);
    vyb(j + 1) = (1 - (b/m)*tick)*vyb(j) + (fby(j)*tick/m);
    posxb(j + 1) = posxb(j) + vxb(j).*tick;
    posyb(j + 1) = posyb(j) + vyb(j).*tick;
end

hold on
% GRÁFICA DEL MOVIMIENTO DE LA PARTÍCULA EN A

subplot(2,2,1)

plot(posxa,posya,'c')
axis(rangeOfVision)
xlabel('Eje X');
ylabel('Eje Y');

% GRÁFICA DEL MOVIMIENTO DE LA PARTÍCULA EN B

subplot(2,2,2)

plot(posxb,posyb,'c')
axis(rangeOfVision)
xlabel('Eje X');
ylabel('Eje Y');

% GRÁFICA DE LA PARTÍCULA MOVIÉNDOSE EN A y B

subplot(2,2,3)

xlabel('Eje X');
ylabel('Eje Y');

subplot(2,2,4);

xlabel('Eje X');
ylabel('Eje Y');

for i = 1:dots
    %Para el problema A

    subplot(2,2,3)
    hold off
    plot(posxa,posya,'k-')
    hold on
    plot(posxa(i),posya(i),'o')
    axis(rangeOfVision)

    %Para el problema B

    subplot(2,2,4)
    hold off
    plot(posxb(j),posyb(j),'ko')
    hold on
    for j = 3:i
        plot([posxb(j-2), posxb(j-1)],[posyb(j-2), posyb(j-1)],'r-')
    end

    clc
    fprintf("Tick: %f\nRalentizado a: %f\nSegundos de simulación: %f\nTiempo desde inicio: %f\n",tick,slowmo,secs,(i*tick))
    pause(tick*slowmo/100)

end

axis(rangeOfVision)

% “Caja” que encierra la partícula en las dos simulaciones (es posible aplicarla,
% pero dejaremos esta aplicación debido a que no es de provecho para el estudio
% del movimiento. Se deja por si existe el interés de encerrar la partícula en
% algún futuro entre unas paredes imaginarias.)

% % % function crearcaja(d)
% % % plot([-d d],[d d],'k',[d d],[d -d],'k',[d -d],[-d -d],'k',[-d -d],[-d d],'k');
% % % axis([-(d+1) d+1 -(d+1) d+1]);
% % % xlabel('Eje X');
% % % ylabel('Eje Y');
% % % end
