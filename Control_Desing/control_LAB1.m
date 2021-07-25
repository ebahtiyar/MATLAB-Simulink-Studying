% clc
% clear
% close
% syms x(t) k a
% ki=[1,2,3];
% c = ['b','r','g']; %ezplot color
% ynt = dsolve('Dx(t) = - k*x(t) + t', 't');
% for i = 1:3
%      k  = ki(i);
%      equation = subs(ynt);
%      graph = ezplot(equation,[-2,2]);
%      set(graph, 'Color',c(i));
%      hold on
%      legend('k = 1','k = 2', 'k = 3')
% end
% 
% clc
% clear
% close
% syms x(t) k a
% ki=[1,2,3];
% aj =[-2,4,0];
% t = 0:0.01:1;
% cond = [x(0) == 1];
% for i = 1:3
%     a = aj(i);
%     for j = 1:3
%         k = ki(j);
%         ynt = dsolve('Dx(t) = - k*(a-x(t))', cond,'t');
%         equation = subs(ynt);
%         figure(i)
%         p = eval(equation);
%         plot(t,p)
%         hold on
%         legend('k = 1','k = 2' , 'k = 3')
%     end
%     
%     
%     
%     clc
% clear
% close
% syms x(t) k a
% ki=[1,2,3];
% aj =[-2,4,0];
% x0 = [1,2,3]; % All initial value
% t = 0:0.01:10;
% for c = 1:3
%     cond = [x(0) == x0(c)];
%         for i = 1:3
%             k = ki(i);
%             ynt = dsolve('Dx(t) = - k*x(t) + t', cond , 't');
%             equation = subs(ynt);
%             figure(c)
%             p = eval(equation);
%             plot(t,p)
%             hold on
%         end
% end