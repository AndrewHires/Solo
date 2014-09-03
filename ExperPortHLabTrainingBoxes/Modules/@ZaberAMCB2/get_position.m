function r = get_position(z, varargin)
%
%
%



% 
% if nargin > 1
%     unit = varargin{1};
% else
%     unit = 1;
% end
% 
% if z.sobj.BytesAvailable > 0
%     fread(z.sobj,z.sobj.BytesAvailable,'uint8');  % clear input buffer
% end
% 
% 
% fwrite(z.sobj,[unit 54 0 0 0 0],'uint8'); % Command 54: Return Status
% reply = fread(z.sobj, 6, 'uint8');
% r = four_bytes_to_single(reply(3:6));





if strcmp(get(z.sobj,'Status'),'closed')
    error('Serial port status is closed.')
end

if nargin>1
    unit = varargin{1};
else
    unit = 1; % not 0
end

cmd = ['/0 ' num2str(unit) ' get pos'];

%disp(z.ValuesSent); AS

fprintf(z.sobj,cmd);%,'async');

reply = fscanf(z.sobj);
if length(reply)==6
    r = four_bytes_to_single(reply(3:6));
else 
    r = str2num(reply(18:end));
end

% r = [];
% 
% if get(z.sobj,'BytesAvailable')>0
% r = fread(z.sobj,6,'int8');
% end