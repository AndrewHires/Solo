% [ed] = ToggleParam(obj, parname, parval, x, y, varargin)
%
% Creates a toggler SoloParamHandle of name given by parname, value by
% parval, and with the lower left-hand corner of the numedit's GUI at
% x, y.
%
% Any non-zero value becomes a value of 1.  
%
% OPTIONAL ARGS (needs more documentation!)
%    

function [ed] = ToggleParam(obj, parname, parval, x, y, varargin)

   % First get the label value:
   pairs = { ...
       'label',              parname                    ; ...
       }; parse_knownargs(varargin, pairs);

   if ischar(obj) && strcmp(obj, 'base'), param_owner = 'base';
   elseif isobject(obj),                  param_owner = ['@' class(obj)];
   else   error('obj must be an object or the string ''base''');
   end;
   
   % Now parse other args, including OnString and OffString
   pairs = { ...
       'param_owner',        param_owner            ; ...
       'param_funcowner',    determine_fullfuncname     ; ...
       'position',           gui_position(x, y)         ; ...
       'TooltipString',      ''                         ; ...
       'OnString'            label                      ; ...
       'OffString'           label                      ; ...
       'OnFontWeight'        'bold'                     ; ...
       'OffFontWeight'       'bold'                     ; ...
       'label'               label                      ; ...
       }; parseargs(varargin, pairs);


   if parval, parval = 1; else parval = 0; end;
   
   ed = SoloParamHandle(obj, parname, ...
                        'type',            'solotoggler', ...
                        'value',           parval, ...
                        'position',        position, ...
                        'TooltipString',   TooltipString, ...
                        'label',           label, ...
                        'OnString',        OnString,  ...
                        'OffString',       OffString, ...
                        'OnFontWeight',    OnFontWeight, ...
                        'OffFontWeight',   OffFontWeight, ...
                        'param_owner',     param_owner, ...
                        'param_funcowner', param_funcowner);
   assignin('caller', parname, eval(parname));
   return;   
   

   
