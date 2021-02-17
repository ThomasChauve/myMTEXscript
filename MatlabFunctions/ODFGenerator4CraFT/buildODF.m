function odf=buildODF(CS,type,bw,angle)
% buildODF is building different type of ODF
% uniform odf : buildODF(CS,'uniform')
% singleMax odf : buildODF(CS,'singleMax',bw)
% girdle odf : buildODF(CS,'uniform',bw,angle)
%
% Inputs :
%   CS : crystal symmetry object from MTEX
%   type : string telling what type of ODF you want
%   bw : float parameter controlling the spreding of the orientation (only usefull for singleMax and girdle ODF)
%   angle : angle in degree between the y-axis and the girdle (only usefull for girdle)
%
% Output :
%   odf : odf object from MTEX
%
% Note : for now singleMax and girdle are defined from the y-axis. The
% function could be addapted in the futur to be defined in respect to a
% given vector3d

if ~exist('angle','var')
     angle = 35;
end

if ~exist('bw','var')
     bw = 10;
end

if strcmp(type,'uniform')
    odf=uniformODF(CS);

elseif strcmp(type,'singleMax')
    vec=yvector;
    odf = fibreODF(Miller(0,0,0,1,CS),vec,'halfwidth',bw*degree);

elseif strcmp(type,'girdle')
    vec=vector3d(sin(angle*degree),cos(angle*degree),0);
    odf2 =1/360 * fibreODF(Miller(0,0,0,1,CS),vec,'halfwidth',bw*degree);
    for i = 1:359;
        rot = rotation.byAxisAngle(yvector,i*degree);
        odf2=odf2+1/360*fibreODF(Miller(0,0,0,1,CS),rot*vec,'halfwidth',bw*degree);
    end
    odf=odf2;
end

end